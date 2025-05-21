#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo -e "$R You need to run this script as root or with sudo. $N"
    exit 1
    else
    echo "You are running this script as root." 
fi

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo -e "$G Installing $2 is Successful. $N"
        else
        echo -e "$R Installing $2 is not Successful. $N"
        exit 1
    fi
}
# This script will install the mysql in the system
dnf list installed mysql

if [ $? -ne 0 ]; then
    echo -e "MySQL is not installed. Installing MySQL..."
    dnf install mysql -y
    VALIDATE $? MySQL   
else
    echo -e "$Y MySQL is already installed. $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    echo "Python3 is not installed. Installing Python3..."
    dnf install python3 -y
    VALIDATE $? Python3
else
    echo -e "$Y Python3 is already installed. $N"
fi


dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "Nginx is not installed. Installing Nginx..."
    dnf install nginx -y
    VALIDATE $? Nginx 
    else
    echo -e "$Y Nginx is already installed. $N"
fi