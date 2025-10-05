#!/usr/bin/env bash
set -euo pipefail

# Install Go
wget https://go.dev/dl/go1.25.1.linux-amd64.tar.gz
tar -xzf go1.25.1.linux-amd64.tar.gz
sudo rm -rf $HOME/go
mv go "$HOME"
rm go1.25.1.linux-amd64.tar.gz

# Remove any existing Go-related exports from /etc/profile
# A backup will be created at /etc/profile.bak
sed -i.bak \
  -e '/export GOBIN/d' \
  -e '/export GOPATH/d' \
  -e '/export GOROOT/d' \
  $HOME/.bashrc

# Append the desired Go environment variables
cat go.env || sudo tee $HOME/.bashrc
source go.env

echo "run 'source ~/.bashrc' to activate the Go installation or close this terminal and open a new one"