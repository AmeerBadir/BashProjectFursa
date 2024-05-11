# your solution here...
#!/bin/bash
echo Hellow $USER
COURSE_ID='DevOpsFursa'

if [ -e "$HOME/.token" ]; then
    # Get the octal representation of the file permissions
    permissions=$(stat -c "%a" "$HOME/.token")
    if [ "$permissions" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi

fi
umask 0077
export PATH="$PATH:/$(HOME)/usercommands"
date -u +"%Y-%m-%dT%H:%M:%S%:z"

alias ltxt='ls *.txt'

tmp_dir="$HOME/tmp"

if [ -d "$tmp_dir" ]; then
    rm -rf "${tmp_dir:?}/"*
else
    mkdir "$tmp_dir"
fi

# killing the process that is bound to port 8080 (if it exists)
fuser -k 8080/tcp