#!/usr/bin/env bash
echo "Symlinking..."

echo "zshrc..."
# Zsh
symlink_file $HOME/.macSetup/install/.zshrc $HOME/.zshrc

echo "vimrc..."
# Vim
symlink_file $HOME/.macSetup/install/.vimrc $HOME/.vimrc
