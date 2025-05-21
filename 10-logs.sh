#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d'.' -f1)
echo -e "$G The name of the script is: $SCRIPT_NAME $N"
LOG_FILE="$LOGS_DIR/$SCRIPT_NAME.log"

echo ""Script started at $(date)""  | tee -a $LOG_FILE

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
# This script will install the mysql in the system
dnf list installed mysql

if [ $? -ne 0 ]; then
    echo -e "MySQL is not installed. Installing MySQL..." | tee -a $LOG_FILE
    dnf install mysql -y
    VALIDATE $? MySQL   
else
    echo -e "$Y MySQL is already installed. $N" | tee -a $LOG_FILE
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    echo "Python3 is not installed. Installing Python3..." | tee -a $LOG_FILE
    dnf install python3 -y
    VALIDATE $? Python3
else
    echo -e "$Y Python3 is already installed. $N" | tee -a $LOG_FILE
fi


dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "Nginx is not installed. Installing Nginx..." | tee -a $LOG_FILE
    dnf install nginx -y
    VALIDATE $? Nginx 
    else
    echo -e "$Y Nginx is already installed. $N" | tee -a $LOG_FILE
fi