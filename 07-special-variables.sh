#!/bin/bash

echo "All the specials variables passed to the scripts are: $@"
echo "The name of the script is: $0"
echo "The number of arguments passed to the scripts is: $#"
echo "The PID of the script is: $$"
echo "The present working directory is: $PWD"
echo "The home directory of the user is: $HOME"
echo "The script execution user is: $USER"
sleep 10 &
echo "PID of most recently backgrounded process is: $!"
echo "The last command executed was: $?"
echo "All the arguments passed to the script are: $*"
