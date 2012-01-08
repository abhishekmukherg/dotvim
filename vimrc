" 
" tmellor's vimrc
" @email timothy.mellor@gmail.com
" 

" -----------------------------------------------------------------------------
" Mandatory stuff for vundle
" -----------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

filetype plugin indent on " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" mandatory for some plugins
set t_Co=256

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" -----------------------------------------------------------------------------
" Plugin Bundles
" -----------------------------------------------------------------------------

""" Language Agnostic """

" Library
Bundle 'vim-scripts/L9'

" UI improvements
Bundle 'wycats/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'dickeytk/status.vim'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'molok/vim-smartusline'
Bundle 'nathanaelkane/vim-indent-guides'

" Utilities
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-align'
Bundle 'wincent/Command-T'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'

" Manipulation
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'

" Code completion
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'mattn/zencoding-vim'

" Source Control
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'gregsexton/gitv'

" Window/buffer/tab manipulation
Bundle 'vim-scripts/ZoomWin'
Bundle 'mutewinter/LustyJuggler'
" also use 'mpage' but it doesnt have a repo,
" included manually
set rtp+=~/.vim/bundle/mpage/*

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'scottymoon/vim-twilight'
Bundle 'nanotech/jellybeans.vim'
Bundle 'godlygeek/csapprox'
Bundle 'mattsa/vim-eddie'
Bundle 'tomasr/molokai'
Bundle 'therubymug/vim-pyte'
Bundle 'vim-scripts/vydark'
Bundle 'Cleanroom'

" Syntax
Bundle 'scrooloose/syntastic'

""" Language Specific """

" Python
" Bundle 'kevinw/pyflakes-vim'
" Bundle 'fs111/pydoc.vim'
Bundle 'klen/python-mode'
" Bundle 'nvie/vim-pep8'

" Java
" see http://www.vim.org/scripts/script.php?script_id=1785
Bundle 'javacomplete'

" Css
Bundle 'skammer/vim-css-color'
Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'

" Velocity
Bundle 'velocity.vim'

" Lisp
Bundle 'vim-scripts/slimv.vim'

" -----------------------------------------------------------------------------
" Plugin Setup / Shortcuts / Maps
" -----------------------------------------------------------------------------

" python-mode
" required
let g:pymode_syntax = 1

" Easy access to Align
nnoremap <Leader>= :Align 
vnoremap <Leader>= :Align 

" Shortcut to ZoomWin
nnoremap <Leader>z :ZoomWin<CR>

" Run Ack fast
nnoremap <Leader>a :Ack<Space>
nnoremap <Leader>la :LAck<Space>

" toggle MiniBufExplorer
nnoremap <Leader>m :TMiniBufExplorer<CR>

" toggle tagbar
nnoremap <Leader>tg :TagbarToggle<CR>
" generate ctags
nnoremap <Leader>ct :silent! ctags -R --extra=+f

" command-t
let g:CommandTMaxFiles=20000
let g:CommandTMaxHeight=15

" fuzzy funder
nnoremap <Leader>ff :FufFileWithCurrentBufferDir<CR>
nnoremap <Leader>fb :FufBuffer<CR>
nnoremap <Leader>ft :FufTaggedFile<CR>

" status line
" always show status bar
set laststatus=2

" -----------------------------------------------------------------------------
" General setup
" -----------------------------------------------------------------------------

""" Color setup """
set background=dark
colorscheme jellybeans

""" Editing behavior """
set showmode                             " always show what mode we're currently editing in
set nowrap                               " don't wrap lines
set tabstop=4                            " a tab is four spaces
set softtabstop=4                        " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                            " expand tabs by default (overloadable per file type later)
set shiftwidth=4                         " number of spaces to use for autoindenting
set shiftround                           " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set autoindent                           " always set autoindenting on
set copyindent                           " copy the previous indentation on autoindenting
set number                               " always show line numbers
set showmatch                            " set show matching parenthesis
set ignorecase                           " ignore case when searching
set smartcase                            " ignore case if search pattern is all lowercase,
                                         " case-sensitive otherwise
set smarttab                             " insert tabs on the start of a line according to
                                         " shiftwidth, not tabstop
set scrolloff=4                          " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all                      " allow the cursor to go in to "invalid" places
set hlsearch                             " highlight search terms
set incsearch                            " show search matches as you type
set gdefault                             " search/replace "globally" (on a line) by default

set nolist                               " don't show invisible characters by default,
set mouse=a                              " enable using the mouse if terminal emulator
                                         " supports it (xterm does)
set fileformats=                         " unix,dos,mac

set termencoding=utf-8
set encoding=utf-8

set history=1000                         " remember more commands and search history
set undolevels=1000                      " use many muchos levels of undo

if v:version >= 730
  set undofile                           " keep a persistent backup file
  set undodir=~/.vim/.undo,~/tmp,/tmp
endif

set directory=~/.vim/.swap,~/tmp,/tmp    " store swap files in one of these directories
set backupdir=~/.vim/.backup,~/tmp,/tmp  " store swap files in one of these directories

set wildmenu                             " make tab completion for files/buffers act like bash
set wildmode=list:full                   " show a list when pressing tab and complete
                                         " first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                " change the terminal's title
set novisualbell                         " don't blink
set noerrorbells                         " don't beep
set showcmd                              " show (partial) command in the last line of the screen
                                         " this also shows visual selection info
set nomodeline                           " disable mode lines (security measure)
set cursorline                           " underline the current line, for quick orientation

""" Search and Movement """

" Make vim use regular regexps (very magic)
" @see http://stevelosh.com/blog/2010/09/coming-home-to-vim
" @see :help \v
nnoremap / /\v
vnoremap / /\v

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" after using '.', go to the character we were before 
" http://vim.wikia.com/wiki/VimTip1142
function! ResDot(count)
    execute "normal!" count . "."
    if line("'[") <= line("$")
        normal! g`[
    endif
endfunction

nnoremap <silent> . :<C-U>call ResDot(v:count1)<CR>

" Quickfix window with last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

""" Utility """

" restore position in file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" save when focus lost
au FocusLost * :wa

" Auto resize windows when vim resized
autocmd VimResized * wincmd =

" Make D and Y behave
nnoremap D d$
nnoremap Y y$

""" Gvim specific """
if has('gui_running')
  " Not sure which of these are totally necessary
  " but I want to get rid of as much as possible.
  set guioptions-=m
  set guioptions-=M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
  set guioptions-=F
endif

" -----------------------------------------------------------------------------
" General Shortcuts and mappings
" -----------------------------------------------------------------------------

" close other buffers
nnoremap <Leader>o :on<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <Leader>v <C-w>v<C-w>l

" use semicolon for commands
" http://vim.wikia.com/wiki/Map_semicolon_to_colon
map ; :

" Easier movement up and down
nnoremap H <C-D>
nnoremap L <C-U>

" Turn off highlight with space and clear messages
" @see http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Quit fast
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :wq<CR>

" Delete buffer
nnoremap <Leader>d :bd<CR>

" %% expands to dir of current file
cnoremap %% %:p:h

" close the quickfix window
nnoremap <Leader>cl :cclose<CR>

" location list stuff
nnoremap <Leader>ll :ll<CR>
nnoremap <Leader>j :lne<CR>
nnoremap <Leader>k :lpre<CR>

" -----------------------------------------------------------------------------
" Auto/omni complete settings
" -----------------------------------------------------------------------------

" javacomplete
" Could also use CompleteParamsInfo
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

" -----------------------------------------------------------------------------
" Language specific settings
" -----------------------------------------------------------------------------

" 2 spaces for tab in vim script
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2

" -----------------------------------------------------------------------------
" Custom magic goes here
" -----------------------------------------------------------------------------

" Stuff below is to center the current buffer in the screen
" This is good for going full screen and editing just one file
"   at a time.
let g:centerinscreen_active = 0

function! ToggleCenterInScreen(desired_width)
  if g:centerinscreen_active == 0
    let a:window_width = winwidth(winnr())
    let a:sidepanel_width = (a:window_width - a:desired_width) / 2

    exec("silent leftabove " . a:sidepanel_width . "vsplit new")
    wincmd l
    exec("silent rightbelow " . a:sidepanel_width . "vsplit new")
    wincmd h
    let g:centerinscreen_active = 1
  else
    wincmd h
    close
    wincmd l
    close

    let g:centerinscreen_active = 0
  endif
endfunction

nnoremap <Leader>r :exec ToggleCenterInScreen(100)<CR>
nnoremap <Leader>f :call system("xte 'key F11'")<CR>
