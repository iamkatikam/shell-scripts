#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "You need to run this script as root or with sudo."
    exit 1
    else
    echo "You are running this script as root." 
fi

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo "Installing $2 is Successful."
        else
        echo "Installing $2 is not Successful."
        exit 1
    fi
}
# This script will install the mysql in the system
dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "MySQL is not installed. Installing MySQL..."
    dnf install mysql -y
    VALIDATE $? MySQL   
else
    echo "MySQL is already installed."
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    echo "Python3 is not installed. Installing Python3..."
    dnf install python3 -y
    VALIDATE $? Python3
else
    echo "Python3 is already installed."
fi


dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "Nginx is not installed. Installing Nginx..."
    dnf install nginx -y
    VALIDATE $? Nginx 
    else
    echo "Nginx is already installed."
fi