if has('python3')
    silent! python3 1
endif

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
set spell

let g:pymode_rope=0

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
au BufRead /tmp/mutt-* set tw=72

augroup filetypedetect
      " Mail
autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

"options for mails
autocmd BufRead,BufNewFile mutt-* call MailHook()
function MailHook()
    setlocal textwidth=72
    setlocal colorcolumn=72
endfunction

syntax on
filetype plugin indent on
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
 " when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" AsyncRun with vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" https://github.com/pedrohdz/vim-yaml-folds/blob/master/after/ftplugin/yaml/folding.vim
function! YamlFolds()
  let previous_level = indent(prevnonblank(v:lnum - 1)) / &shiftwidth
  let current_level = indent(v:lnum) / &shiftwidth
  let next_level = indent(nextnonblank(v:lnum + 1)) / &shiftwidth

  if getline(v:lnum + 1) =~ '^\s*$'
    return "="

  elseif current_level < next_level
    return next_level

  elseif current_level > next_level
    return ('s' . (current_level - next_level))

  elseif current_level == previous_level
    return "="

  endif

  return next_level
endfunction

function! YamlFoldText()
  let lines = v:foldend - v:foldstart
  return getline(v:foldstart) . '   (level ' . v:foldlevel . ', lines ' . lines . ')'
endfunction

setlocal foldmethod=expr
setlocal foldexpr=YamlFolds()
setlocal foldtext=YamlFoldText()

let b:undo_ftplugin =
      \ exists('b:undo_ftplugin')
        \  ? b:undo_ftplugin . ' | '
        \ : ''
\ . 'setlocal foldexpr< foldmethod< foldtext<'
