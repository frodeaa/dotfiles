set nocompatible
set hidden
set nonumber
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
set fileformats=unix
set encoding=utf-8
set fileencoding=utf-8
set smartindent
set hlsearch
set incsearch
set cursorline
set statusline=%<%F%h%m%r%h%w%y\ %=col:%c%V\ lin:%l\,%L\ %P
set laststatus=2

if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a

let mapleader = ','

" Map Ctrl-å to Ctrl-] (command for following links), since Ctrl-] doesn't
" work with Norwegian keyboard layout (on Macs at least)
map <C-å> <C-]>
map <f9> :make

" edit/reload the vim rc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" configure netrw to
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" configure ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

autocmd BufWritePre * %s/\s\+$//e

syntax on
filetype plugin indent on
set background=dark
colorscheme solarized

" AsyncRun with vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
