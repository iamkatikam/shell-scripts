#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
echo -e "$G The name of the script is: $SCRIPT_NAME"
LOG_FILE="$LOGS_DIR/$SCRIPT_NAME.log"
echo -e "$G The log file is: $LOG_FILE $N"
mkdir -p $LOGS_DIR
echo "script started at $(date)"  | tee -a $LOG_FILE

PACKAGES=(
    "mysql"
    "python3"
    "nginx"
    "httpd"
    "ansible"
)

#echo ""Script started at $(date)""  | tee -a $LOG_FILE

if [ ! -d $LOGS_DIR ]; then
    mkdir $LOGS_DIR
    echo -e "$G Created the logs directory. $N"  | tee -a $LOG_FILE
else
    echo -e "$Y Logs directory already exists. $N"  | tee -a $LOG_FILE
fi

userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo -e "$R You need to run this script as root or with sudo. $N"  | tee -a $LOG_FILE
    exit 1
    else
    echo "You are running this script as root." &>> $LOG_FILE
fi

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo -e "$G Installing $2 is Successful. $N" &>> $LOG_FILE
        else
        echo -e "$R Installing $2 is not Successful. $N" &>> $LOG_FILE
        exit 1
    fi
}
for package in ${PACKAGES[@]}
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo -e "$package is not installed. Installing $package..." | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? $package   
    else
        echo -e "$Y $package is already installed. $N" | tee -a $LOG_FILE
    fi
done





