#!/usr/bin/env bash
# Check to see if it's already installed
if code -v &> /dev/null
then
    exit    # VSCode already installed 
fi

# Install VSCode using apt package manager
# Add .deb file to apt package manager sources list so it can be installed and updated via apt 
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# install via apt
sudo apt install apt-transport-https
sudo apt update
sudo apt install code