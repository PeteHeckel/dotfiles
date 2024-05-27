#!/usr/bin/bash

sudo apt install zsh -y
sudo chsh -s $(which zsh)

## TODO: Figure out why this creates the oh-my-zsh dir in /root instead of /home/user/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Themes
git clone https://github.com/sindresorhus/pure.git "$HOME/.oh-my-zsh/custom/themes/pure"

# Plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
