My Dotfiles
========

A place to store my dot files for coding

Usage
========

Clone into ~/dotfiles/

Then add symlinks in your ~/ directory

ln -nfs ~/dotfiles/vim/ .vim
ln -nfs ~/dotfiles/vimrc .vimrc
ln -nfs ~/dotfiles/bash_profile .bash_profile
ln -nfs ~/dotfiles/bash_aliases .bash_aliases
ln -nfs ~/dotfiles/gitconfig .gitconfig

Fetch submodules after cloning repo, in ~/dotfiles
run: git submodule update --init
