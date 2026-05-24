#!/bin/bash

read -p "Enter employee name: " fullname
read -p "Enter department: " department

username=$(echo "$fullname" | tr '[:upper:]' '[:lower:]' | tr -d ' ')

base_username=$username
counter=1

while id "$username" &>/dev/null
do
    username="${base_username}${counter}"
    ((counter++))
done

department=$(echo "$department" | tr '[:upper:]' '[:lower:]')

if ! getent group "$department" > /dev/null
then
    groupadd "$department"
fi

useradd "$username"

usermod -aG "$department" "$username"

shared_dir="/shared-$department"

if [ ! -d "$shared_dir" ]
then
    mkdir "$shared_dir"
fi

chgrp "$department" "$shared_dir"
chmod 770 "$shared_dir"

echo "------------------------------"
echo "Provisioning Complete"
echo "Username: $username"
echo "Department: $department"
echo "Shared Directory: $shared_dir"
echo "------------------------------"
