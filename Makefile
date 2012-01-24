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
	hash ack-grep &> /dev/null || sudo apt-get install ack-grep

/usr/bin/ack : ack
	sudo ln -sib /usr/bin/ack-grep /usr/bin/ack

ctags : 
	hash ctags &> /dev/null || sudo apt-get install exuberant-ctags

xautomation : 
	hash xte &> /dev/null || sudo apt-get install xautomation

pep8 : 
	hash pep8 &> /dev/null || sudo apt-get install pep8

# directories to create -------------------------------------------------------
dirs : swap backup undo
	@echo "Creating vim directories .swap, .backup, .undo"

swap : 
	[ -d .swap ] || mkdir .swap

backup : 
	[ -d .backup ] || mkdir .backup

undo : 
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

install : backup
	@echo "Linking dir to ~/.vim and vimrc to ~/.vimrc"
	ln -s . "$(HOME)/.vim"
	ln -s vimrc "$(HOME)/.vimrc"

backup :
	@echo "Backing up existing .vim/, .vimrc, .gvimrc to " $(BACKUPDIR)
	[ ! -d "$(HOME)/.vim" ] || cp -R "$(HOME)/.vim" $(BACKUPDIR)
	[ ! -f "$(HOME)/.vimrc"] || cp "$(HOME)/.vimrc" $(BACKUPDIR)
	[ ! -f "$(HOME)/.gvimrc"] || cp "$(HOME)/.gvimrc" $(BACKUPDIR)
