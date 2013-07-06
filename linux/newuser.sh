#!/bin/bash
# USEAGE: sudo ./newuser.sh <username>
# Will need to run as root (or sudo)

# Query additional information needed
# Username (if not supplied as argument)
if [ $# -eq 0 ]; then
    read -p "Username? " username
fi
read -p "Current email? " email
read -p "Full name? " full_name
read -p "Phone (leave blank if unknown)? " home_phone
read -p "Initial group? " init_group
read -p "Additional groups (separate with comma)? " additional_groups


# Actually add the user
if [ ${#additional_groups} -gt 0 ]; then
    useradd -m -g "$init_group" -G "$additional_groups" -s /bin/bash "$username"
else
    useradd -m -g "$init_group" -s /bin/bash "$username"
fi

# Set user's password
# Do they want it to be randomised and emailed to them?
read -n1 -p "Generate random password? [y/n] " yn_random_password; echo     # echo just there to get the line break
if [ $yn_random_password == y ]; then
    # read 12 suitable characters from /dev/urandom
    new_password=`tr -cd "[:lower:][:upper:][:digit:]$%" < /dev/urandom | head -c${1:-12}; echo`

else
    read -p "Password? " new_password
fi

echo -e "$new_password\n$new_password" | (passwd $username) >/dev/null
new_password="nothing"

# Update finger information
if [ ${#home_phone} -gt 0 ]; then
    chfn -f "$full_name" -h "$home_phone" "$username"
else
    chfn -f "$full_name" "$username"
fi

# Add directories as required
read -n 1 -p "Add public_html [y/n]? " yn_pub_html; echo
[ $yn_pub_html == y ] && mkdir -p "/home/${username}/public_html" && echo "You'll probably have to update httpd.conf to enable userdir for $username"
read -n 1 -p "Add cgi-bin [y/n]? " yn_cgi_bin; echo
[ $yn_cgi_bin == y ] && mkdir -p "/home/${username}/public_html" && echo "Similarly, you'll probably have to update httpd.conf to enable cgi-bin for $username"

# TODO: need to email user to let them know the have an account + include username and password!
# Can't use the randomly generated password feature until this has been done!