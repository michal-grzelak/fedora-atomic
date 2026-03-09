#!/usr/bin/env bash

set -ouex pipefail

echo "Installing AdGuard CLI for Linux"

# download and install
curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardCLI/release/install.sh | sh -s -- -v -o /usr/lib/adguard_cli
rm /usr/lib/adguard_cli/.nosymlink

# link binary
ln -s /usr/lib/adguard_cli/adguard-cli /usr/bin/adguard-cli
