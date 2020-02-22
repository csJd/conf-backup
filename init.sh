#!/bin/bash

dir_url=$(pwd)

[[ -e ~/.profile ]] && mv ~/.profile ~/.profile.old
ln -s "$dir_url/.profile" ~/.profile

[[ -e ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.old
ln -s "$dir_url/.zshrc" ~/.zshrc
ln -s "$dir_url/.zsh-custom" ~/

ln -s "$dir_url/.vimrc" ~/.vimrc
ln -s "$dir_url/.ideavimrc" ~/.ideavimrc

ln -s "$dir_url/.gitconfig" ~/.gitconfig
ln -s "$dir_url/.gitignore" ~/.gitignore

ln -s "$dir_url/.pip" ~/
ln -s "$dir_url/.condarc" ~/.condarc
ln -s "$dir_url/.tmux.conf" ~/.tmux.conf
ln -s "$dir_url/vscode-settings.conf" ~/Library/Application\ Support/Code/User/settings.json

