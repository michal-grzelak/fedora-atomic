#!/usr/bin/env bash

set -ouex pipefail

echo "Installing ProtonPass for Linux"

# download
wget -q https://proton.me/download/pass/linux/x64/ProtonPass.rpm -O ProtonPass.rpm

# install with dnf5
dnf5 install -y ProtonPass.rpm

# remove installer
rm ProtonPass.rpm
