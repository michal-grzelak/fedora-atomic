#!/usr/bin/env bash

set -ouex pipefail

echo "Installing ToolHive for Linux"

# get latest rpm url
URL=$(curl -s https://api.github.com/repos/stacklok/toolhive-studio/releases/latest \
    | jq -r '.assets[] | select(.name | test("x86_64.rpm")) | .browser_download_url')

# install with dnf5
dnf5 install -y "$URL"
