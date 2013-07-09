#!/bin/sh
# USEAGE: ./mysqlinstall.sh
# Installs MySQL
# This script must be run as root (or sudo)!
# Be sure to run the postinstallation setup script (./mysqlsetup.sh) after installing!

# replace the following with the latest versions
mysql_latest_version="mysql-5.6.12-linux-glibc2.5-i686"
mysql_url="http://dev.mysql.com/get/Downloads/MySQL-5.6/${mysql_latest_version}.tar.gz/from/http://cdn.mysql.com/"

# configure the following as desired
install_directory="/usr/local/mysql/"

# save current working directory (to restore later)
original_working_directory=${PWD}

# download apache source
cd
if [ ! -d "downloads/" ]; then
    mkdir downloads
fi
cd downloads
echo "Downloading MySQL"
#wget -q -t10 "$mysql_url"
wget -v -t10 "$mysql_url"

# extract source
echo "Extracting"
tar zxvf "${mysql_latest_version}.tar.gz" >/dev/null
cd "$mysql_latest_version"

# add group + system user
groupadd mysql
useradd -r -g mysql mysql


# use cmake to process platform/compiler independent configuration files
echo "Configuring"
cmake . -DBUILD_CONFIG=mysql_release -DCMAKE_INSTALL_PREFIX=/usr/local/mysql
if [ $? -ne 0 ]; then
    exit
fi

# compile
echo "Compiling"
make
if [ $? -ne 0 ]; then
    exit
fi

# install
echo "Installing"
make install
if [ $? -ne 0 ]; then
    exit
fi

echo "Done :-)"

# restore original working directory
cd $original_working_directory