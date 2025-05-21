#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "You need to run this script as root or with sudo."
    exit 1
    else
    echo "You are running this script as root." 
fi
# This script will install the commands in the system
dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "MySQL is not installed. Installing MySQL..."
    dnf install mysql -y
    if [ $? -eq 0 ]; then
        echo "MySQL installed successfully."
    else
        echo "Failed to install MySQL."
        exit 1
    fi
else
    echo "MySQL is already installed."
fi