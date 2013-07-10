#!/bin/bash
# USEAGE: ./postfixinstall.sh
# Installs postfix
# This script must be run as root (or sudo)!

# replace the following with the latest version
latest_version=postfix-2.10.1

# configure the following as desired
install_directory="/usr/local/postfix/"

# save current working directory (to restore later)
original_working_directory=${PWD}

# download postfix source
cd
if [ ! -d "downloads/" ]; then
    mkdir downloads
fi
cd downloads
echo "Downloading postfix"
wget -q -t10 "http://mirror.tje.me.uk/pub/mirrors/postfix-release/official/${latest_version}.tar.gz"

# extract source
echo "Extracting"
tar zxvf "${latest_version}.tar" >/dev/null
cd $latest_version

# compile
echo "Compiling"
make
if [ $? -ne 0 ]; then
    exit 1
    echo "Build failed!"
fi

# 

# install
echo "Installing"
make install #>/dev/null
if [ $? -ne 0 ]; then
    exit
fi

echo "Done :-)"

# restore original working directory
cd $original_working_directory