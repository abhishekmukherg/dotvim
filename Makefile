SHELL = /bin/bash

# all:
# 	- install dependencies
# 	- update vundle
# 	- install all bundles
all : deps dirs vundle bundles

# dependences to install -------------------------------------------------------
deps : /usr/bin/ack ctags xautomation pep8
	@echo "Installing dependencies"

ack :
	hash ack-grep &> /dev/null || sudo apt-get install ack-grep \
		&& sudo ln -sib /usr/bin/ack-grep /usr/bin/ack

ctags : 
	hash ctags &> /dev/null || sudo apt-get install exuberant-ctags

xautomation : 
	hash xte &> /dev/null || sudo apt-get install xautomation

pep8 : 
	hash pep8 &> /dev/null || sudo apt-get install pep8

# directories to create -------------------------------------------------------
dirs :
	@echo "Creating vim directories .swap, .backup, .undo"
	[ -d .swap ] || mkdir .swap
	[ -d .backup ] || mkdir .backup
	[ -d .undo ] || mkdir .undo

# vundle ----------------------------------------------------------------------
vundle :
	@echo "Updating vundle"
	git submodule init && git submodule update

# vim bundles -----------------------------------------------------------------
bundles :
	@echo "Fetching all bundles"
	vim +BundleInstall +qall

# install ---------------------------------------------------------------------

BACKUPDIR := $(shell mktemp -d)
PWD := $(shell pwd)

install : backup
	@echo "Linking dir to ~/.vim and vimrc to ~/.vimrc"
	ln -s "$(PWD)" "$(HOME)/.vim"
	ln -s vimrc "$(HOME)/.vimrc"

backup :
	@echo "Backing up existing .vim/, .vimrc, .gvimrc to " $(BACKUPDIR)
	[ ! -d "$(HOME)/.vim" ] || mv "$(HOME)/.vim" $(BACKUPDIR)
	[ ! -f "$(HOME)/.vimrc" ] || mv "$(HOME)/.vimrc" $(BACKUPDIR)
	[ ! -f "$(HOME)/.gvimrc" ] || mv "$(HOME)/.gvimrc" $(BACKUPDIR)
