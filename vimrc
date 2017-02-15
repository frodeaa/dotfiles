set hidden
set number
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
set fileformats=unix
set encoding=utf-8
set fileencoding=utf-8
set smartindent
set cursorline
set statusline=%<%F%h%m%r%h%w%y\ %=col:%c%V\ lin:%l\,%L\ %P
set laststatus=2

let mapleader = ','

" Map Ctrl-å to Ctrl-] (command for following links), since Ctrl-] doesn't
" work with Norwegian keyboard layout (on Macs at least)
map <C-å> <C-]>

syntax on
filetype plugin indent on
colorscheme solarized

" AsyncRun with vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
