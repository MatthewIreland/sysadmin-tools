#!/bin/sh
# USEAGE: ./apacheinstall.sh
# Installs apache (configure below)
# This script must be run as root (or sudo)!
# If pcre is not installed, first run ./pcreinstall.sh
# After running this script, run ./apacheconfigure.pl to correctly setup /conf/httpd.conf

# don't need to run as root for the first bit
#su matthew

# replace the following with the latest versions
apache_latest_version=httpd-2.4.4
apr_latest_version=apr-1.4.8
apr_util_latest_version=apr-util-1.5.2

# configure the following as desired
install_directory="/usr/local/apache/"

# save current working directory (to restore later)
original_working_directory=${PWD}

# download apache source
cd
if [ ! -d "downloads/" ]; then
    mkdir downloads
fi
cd downloads
echo "Downloading apache"
wget -q -t10 "http://www.mirrorservice.org/sites/ftp.apache.org//httpd/${apache_latest_version}.tar.gz"

# download apache portable runtime project
echo "Downloading apache portable runtime project"
wget -q -t10 "http://www.mirrorservice.org/sites/ftp.apache.org//apr/${apr_latest_version}.tar.gz"
wget -q -t10 "http://www.mirrorservice.org/sites/ftp.apache.org//apr/${apr_util_latest_version}.tar.gz"

# extract source
echo "Extracting"
gzip -d "${apache_latest_version}.tar.gz" >/dev/null
gzip -d "${apr_latest_version}.tar.gz" >/dev/null
gzip -d "${apr_util_latest_version}.tar.gz" >/dev/null
tar xvf "${apache_latest_version}.tar" >/dev/null
tar xvf "${apr_latest_version}.tar" >/dev/null
tar xvf "${apr_util_latest_version}.tar" >/dev/null

# configure
mv "${apr_util_latest_version}" "${apache_latest_version}/srclib/apr-util"
mv "${apr_latest_version}" "${apache_latest_version}/srclib/apr"
echo "Configuring"
cd ${apache_latest_version}
./configure --prefix="${install_directory}" --with-included-apr --enable-userdir --with-pcre=/usr/local/pcre/bin/pcre-config #>/dev/null
if [ $? -ne 0 ]; then
    exit 1
    echo "Configuration failed!"
fi

# now need to be root
#exit

# build
echo "Building"
make #>/dev/null
if [ $? -ne 0 ]; then
    exit 2
    echo "Build failed!"
fi

# install
echo "Installing"
make install #>/dev/null
if [ $? -ne 0 ]; then
    exit 3
    echo "Install failed!"
fi

echo "Done :-)"

# restore original working directory
cd $original_working_directory