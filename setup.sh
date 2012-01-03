#!/bin/bash

# get vundle going
git submodule init
git submodule update

# Setup directories
mkdir .swap
mkdir .backup
mkdir .undo

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
sudo apt-get install exuberant-ctags

# pyflakes
# see issue: https://github.com/kevinw/pyflakes-vim/issues/27
pushd
cd bundle/pyflakes-vim
git submodule init
git submodule update
popd

# Remove ugly gtk resize handler
# @see http://askubuntu.com/questions/47831/how-to-remove-gvims-fat-bottom-border-and-resize-grip
echo 'style "no-resize-handle"
{
    GtkWindow::resize-grip-height = 0
    GtkWindow::resize-grip-width = 0
}

class "GtkWidget" style "no-resize-handle"

style "vimfix" {
  bg[NORMAL] = "#242424" # Random dark color
}
widget "vim-main-window.*GtkForm" style "vimfix"' > ~/.gtkrc-2.0

# Used for calling F11 from within vim to go fullscreen
# since fullscreen support isnt built in
sudo apt-get install xautomation
