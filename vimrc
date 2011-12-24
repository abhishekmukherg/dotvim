 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" UI improvements
Bundle "wycats/nerdtree"
Bundle "majutsushi/tagbar"

" Utilities
Bundle "mileszs/ack.vim"
Bundle "tsaleh/vim-align"
Bundle "wincent/Command-T"

" Manipulation
Bundle "michaeljsmith/vim-indent-object"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-repeat"
Bundle "scrooloose/nerdcommenter"

" Code completion
Bundle "ervandew/supertab"
Bundle "Raimondi/delimitMate"
Bundle "docunext/closetag.vim"

" Source Control
Bundle "tpope/vim-fugitive"

" Window/buffer/tab manipulation
Bundle "vim-scripts/ZoomWin"

" Colors
Bundle "altercation/vim-colors-solarized"
Bundle "scottymoon/vim-twilight"
Bundle "nanotech/jellybeans.vim"

"" Language Specific
" Python
Bundle "kevinw/pyflakes-vim"

filetype plugin indent on " required!


" Color setup
set background=dark
colorscheme jellybeans

