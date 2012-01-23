SHELL = /bin/bash

# all:
# 	- install dependencies
# 	- update vundle
# 	- install all bundles
all : deps dirs vundle bundles

# dependences to install -------------------------------------------------------
deps : ack ctags xautomation pep8

ack : /usr/bin/ack
	hash ack-grep &> /dev/null || sudo apt-get install ack-grep

/usr/bin/ack :
	sudo ln -sib /usr/bin/ack-grep /usr/bin/ack

ctags : 
	hash ctags &> /dev/null || sudo apt-get install exuberant-ctags

xautomation : 
	hash xte &> /dev/null || sudo apt-get install xautomation

pep8 : 
	hash pep8 &> /dev/null || sudo apt-get install pep8

# directories to create -------------------------------------------------------
dirs : swap backup undo

swap : 
	[ -d .swap ] || mkdir .swap

backup : 
	[ -d .backup ] || mkdir .backup

undo : 
	[ -d .undo ] || mkdir .undo

# vundle ----------------------------------------------------------------------
vundle :
	git submodule init && git submodule update

# vim bundles -----------------------------------------------------------------
bundles :
	vim +BundleInstall +qall


