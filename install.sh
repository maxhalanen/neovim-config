#!/bin/bash

set -e

NVIM_CONFIG="$HOME/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup existing config
if [ -d "$NVIM_CONFIG" ]; then
  echo "Backing up existing config to $NVIM_CONFIG.bak"
  mv "$NVIM_CONFIG" "$NVIM_CONFIG.bak"
fi

# Copy config
echo "Installing neovim config..."
mkdir -p "$NVIM_CONFIG"
cp -r "$SCRIPT_DIR/init.lua" "$NVIM_CONFIG/"
cp -r "$SCRIPT_DIR/lua" "$NVIM_CONFIG/"

echo "Done. Open nvim and run :Lazy sync to install plugins."
