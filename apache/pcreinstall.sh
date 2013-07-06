#!/bin/sh
# USEAGE: ./apacheinstall.sh
# Installs PCRE - Perl Compatible Regular Expressions - (used by Apache, PHP, KDE, Postfix etc)
# This script must be run as root (or sudo)!

# don't need to run as root for the first bit                                                                                                                                                                 
#su matthew

# replace the following with the latest version
latest_version=pcre-8.33

# save current working directory (to restore later)
original_working_directory=${PWD}

# download pcre source
cd
if [ ! -d "downloads/" ]; then
    mkdir downloads
fi
cd downloads
wget "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${latest_version}.tar.gz"

# extract source
gzip -d "${latest_version}.tar.gz" >/dev/null
tar xvf "${latest_version}.tar" >/dev/null
cd $latest_version

# configure
./configure --prefix=/usr/local/pcre

# now need to be root
#exit

# make
make

# install
make install

echo "Done :-)"

# restore original working directory
cd $original_working_directory