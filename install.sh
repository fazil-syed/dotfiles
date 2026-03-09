#!/bin/bash

set -e #exit on error

echo "----- INSTALLING apt packages ------"
sudo apt update 
sudo apt install -y \
	tmux \
	gjs \ 
	syncthing \
	stwo \
	git \
	curl  

echo "----- INSTALLING ghostty via snap -----"
sudo snap install ghostty --classic

echo "----- INSTALLING starship ------"
curl -sS https://starship.rs/install.sh" | sh

echo "------ Installing nvm ------"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

echo "----- INSTALL Treesitter CLI via npm ------"
npm install -g tree-sitter-cli

echo "----- INSTALLING NEOVIM FROM SOURCE" 
echo "NOTE: This will take a few minutes to compile"
git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
cd ~


echo "------ Installing tmux plugin manager ------"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



echo "---- STOW dotfiles"
cd ~/.dotfiles
stow zsh
stow tmux
stow nvim
stow ghostty
stow starship
stow git
stow ssh

echo "----- AUTOMATED SETUP DONE"


echo "------ ADDITIONAL STEPS TO BE DONE ------"

echo "1. SETUP OBSIDIAN VAULT AND CONNECT WITH SYNCTHING"

echo "2. SYNCTHING enable and start via systemctl under user mode"

echo "3. SYNCTHING web on 8384 PORT"

