#!/usr/bin/env bash

set -ouex pipefail

echo "Installing ToolHive for Linux"

# create temp dir
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# download tarball binary
curl -L https://github.com/stacklok/toolhive-studio/releases/latest/download/toolhive-studio-linux-x64.tar.gz | tar -xz

# install toolhive
install -m 755 toolhive-studio-linux-x64/ToolHive /usr/bin/ToolHive

# cleanup
cd /
rm -rf "$TMP_DIR"
