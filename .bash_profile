#!/bin/bash

# Greet the user
echo Hello $USER

#  environment variable called COURSE_ID
export COURSE_ID="DevOpsFursa"

# check if there is a file named token in the home directory


if [ -e "$HOME/.token" ]; then
    # Get the octal representation of the file permissions
    permissions=$(stat -c "%a" "$HOME/.token")
    if [ "$permissions" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi

fi

# change mask,  such that the default permissions of new created files will be
# r and w for the user and the group only.

umask 006

# adding "/home/<username>/usercommands" directory to PATH environment variables
export PATH=$PATH:$HOME/usercommands

# Print current date in ISO 8601 format
date -u +"%Y-%m-%dT%H:%M:%S%:z"

#Define ltxt comand and  alias for it
alias ltxt='ls *.txt'

# check if there is a directory named tmp in the home directory, if yes clear it else creat tmp
tmp_dir="$HOME/tmp"

if [ -d "$tmp_dir" ]; then
    rm -rf "${tmp_dir:?}/"*
else
    mkdir "$tmp_dir"
fi

# kill the process that is bound to port 8080
fuser -k 8080/tcp
