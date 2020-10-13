let mapleader = ","

set number
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" when bracket, briefly jump to matching bracket
set showmatch

set wrap
set textwidth=100

" wrap long lines at a char in breakat rather than last char on screen
set linebreak
set showbreak=+++ 

" allow backspace over autoindent, line breaks and over the start of insert
set backspace=indent,eol,start  

" UNIX as standard file type
set ffs=unix

" Enable syntax highlighting
syntax enable

set encoding=utf8

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'
" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Airline config
let g:airline_theme='monokai_tasty'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

" Colorscheme
colorscheme vim-monokai-tasty

