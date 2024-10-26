" Turn syntax highlighting on.
syntax on

" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on

" Add numbers to each line on the left-hand side.
set number

" Highlight current line
set cursorline

" Enable mouse support
set mouse=a

" Use spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Show matching parentheses
set showmatch

" Enable incremental search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Enable auto-indentation
set autoindent
set smartindent

" Enable clipboard support
set clipboard=unnamedplus

" Disable backup and swap files
set nobackup
set noswapfile

" Faster update time
set updatetime=300

" Set color scheme (you can change it to your preferred theme)
colorscheme desert

" Better status line
set laststatus=2
set showmode

" Show trailing whitespaces and tabs
set list
set listchars=tab:>-,trail:·

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Speed up scrolling in Vim
set ttyfast

