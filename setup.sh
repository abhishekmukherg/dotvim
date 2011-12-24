#!/bin/bash

# Ack.vim
sudo apt-get install ack-grep
sudo ln -sib /usr/bin/ack-grep /usr/bin/ack

# Command-T
sudo apt-get install ruby rub-dev
pushd
cd bundle/command-t/ruby/command-t
rake extconf.rb
popd

# ctags
sudo apt-get install ctags 

# pyflakes
# see issue: https://github.com/kevinw/pyflakes-vim/issues/27
pushd
cd bundle/pyflakes-vim
git submodule init
git submodule update
popd
