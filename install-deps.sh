#!/bin/bash

set -e

install_linux() {
  echo "Installing system dependencies..."
  sudo apt-get update -qq
  sudo apt-get install -y \
    git curl wget unzip \
    build-essential \
    python3 python3-pip \
    nodejs npm \
    ripgrep \
    fd-find

  if ! command -v cargo &>/dev/null; then
    echo "Installing Rust/Cargo..."
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
  fi
}

install_mac() {
  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Install it from https://brew.sh first."
    exit 1
  fi
  echo "Installing system dependencies..."
  brew install git curl wget unzip node python ripgrep fd
  if ! command -v cargo &>/dev/null; then
    brew install rust
  fi
}

case "$(uname)" in
  Linux)  install_linux ;;
  Darwin) install_mac ;;
  *) echo "Unsupported OS. Install dependencies manually." ;;
esac

echo "Done."
