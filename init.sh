#!/bin/bash

dir_url=$(pwd)

[[ -e ~/.profile ]] && mv ~/.profile ~/.profile.old
ln -s "$dir_url/.profile" ~/

[[ -e ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.old
ln -s "$dir_url/.zshrc" ~/
ln -s "$dir_url/.zsh-custom" ~/

ln -s "$dir_url/.vim" ~/
ln -s "$dir_url/.vimrc" ~/
ln -s "$dir_url/.ideavimrc" ~/

ln -s "$dir_url/.pip" ~/
ln -s "$dir_url/.condarc" ~/
ln -s "$dir_url/.jupyter" ~/
ln -s "$dir_url/.tmux.conf" ~/
ln -s "$dir_url/.gitconfig" ~/

