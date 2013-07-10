#!/bin/sh
# USEAGE: ./mysqlsetup.sh
# Performs postinstallation setup of MySQL
# Needs to initialise the grant tables (which initially have no passwords), start the server and make sure that the server works satisfactorily
# This script can be run as root (or sudo), and must be if the installation was performed by root!

# save current working directory (to restore later)
original_working_directory=${PWD}

cd /usr/local/mysql

# set permissions (wrong if installation was performed by root)
chown -R mysql .
chgrp -R mysql .

# create default option file and setup grant tables
# at this point you'll probably have to cp /usr/local/mysql/share/english/errmsg.sys /usr/share/errmsg.sys
scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/var/lib/mysql           # --user flag is necessary if this script is run as root
if [ $? -ne 0 ]; then
    exit
fi

# now set permissions to secure the directory
# this approache leaves plugin_dir not-writable by the server, and so doesn't allow users to write executable code using SELECT ... INTO DUMPFILE
chown -R root .
chown -R mysql data    # the data directory must be readable/writable by mysql user!

# you may wish to copy one of the sample configuration files here (update this to best match the server)
# if nothing is done (as is currently the case), a default file will be created on first startup

echo "Done :-)"
echo "Make sure that you secure the initial accounts! Details: http://dev.mysql.com/doc/refman/5.6/en/default-privileges.html"

# restore original working directory
cd $original_working_directory