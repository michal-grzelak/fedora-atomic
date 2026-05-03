#!/usr/bin/env bash

set -ouex pipefail

echo "Installing Canon drivers for Linux"

# download
curl https://gdlp01.c-wss.com/gds/8/0100008398/01/cnijfilter2-5.40-1-rpm.tar.gz -o canon.tar.gz
tar -xzf canon.tar.gz

# install rpm
rpm -iv --nodigest --nofiledigest ./cnijfilter2-5.40-1-rpm/packages/cnijfilter2-5.40-1.x86_64.rpm

# remove installer
rm canon.tar.gz
rm -rf cnijfilter2-5.40-1-rpm
