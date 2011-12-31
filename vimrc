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

" Library
Bundle 'vim-scripts/L9'

" UI improvements
Bundle 'wycats/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'dickeytk/status.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'nathanaelkane/vim-indent-guides'

" Utilities
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-align'
Bundle 'wincent/Command-T'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'

" Manipulation
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'

" Code completion
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'mattn/zencoding-vim'
Bundle 'ervandew/supertab'

" Source Control
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'gregsexton/gitv'

" Window/buffer/tab manipulation
Bundle 'vim-scripts/ZoomWin'
Bundle 'mutewinter/LustyJuggler'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'scottymoon/vim-twilight'
Bundle 'nanotech/jellybeans.vim'
Bundle 'godlygeek/csapprox'

" Syntax
Bundle 'scrooloose/syntastic'

"" Language Specific
" Python
Bundle 'kevinw/pyflakes-vim'
Bundle 'fs111/pydoc.vim'
Bundle 'klen/python-mode'

" Java
" see http://www.vim.org/scripts/script.php?script_id=1785
Bundle 'javacomplete'

" Css
Bundle 'skammer/vim-css-color'
Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'

filetype plugin indent on " required!


" Color setup
set background=dark
colorscheme jellybeans

" python-mode
" required
let g:pymode_syntax = 1

" javacomplete
if has ("autocmd")
  " Could also use CompleteParamsInfo
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

