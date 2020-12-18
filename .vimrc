" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'gilgigilgil/anderson.vim'
Plug 'mcmartelle/vim-monokai-bold'
Plug 'sainnhe/sonokai'
Plug 'victorze/foo'
Plug 'lewis6991/moonlight.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" File Manager
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
" Syntax and Lang Specific
Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'hashivim/vim-terraform'
call plug#end()

filetype plugin indent on
syntax on

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" enable 256 colors
set t_Co=256

" UNIX as standard file type
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

autocmd BufWritePre * %s/\s\+$//e

set number
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" split screen
set splitbelow
set splitright

"split navigations: below, above, right, left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding
set foldmethod=indent
set foldlevel=99

" fold with spacebar
nnoremap <space> za

" when bracket, briefly jump to matching bracket
set showmatch

" allow mouse support
set mouse=a

set wrap
set textwidth=100

" wrap long lines at a char in breakat rather than last char on screen
set linebreak
set showbreak=+++

" allow backspace over autoindent, line breaks and over the start of insert
set backspace=indent,eol,start

" Enable syntax highlighting
syntax enable

" access system clipboard
set clipboard=unnamed

" SimplyFold config
let g:SimpylFold_docstring_preview=1

" Airline config
" let g:airline_theme='monokai_tasty'
let g:airline_theme='sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
set noshowmode

" Colorscheme settings
if has('termguicolors')
    set termguicolors
endif

let g:vim_monokai_tasty_italic = 1
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
" set background=dark

" Sonokai colorscheme settings
let g:sonokai_style = 'default' " sonokai, maia, shusia, anromeda, atlantis
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment=1
let g:sonokai_cursor = 'green'

" Colorschemes
" colorscheme vim-monokai-tasty
" colorscheme anderson
" colorscheme monokai-bold
" colorscheme abyss
" colorscheme hacker
" colorscheme hypero
" colorscheme moonlight
colorscheme sonokai
" colorscheme maia
" colorscheme shusia
" colorscheme andromeda
" colorscheme atlantis

" NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0

" Python config
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix
    \ | set foldmethod=indent
let python_highlight_all=1
syntax on

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

au BufNewFile,BufRead *.js
    \ set tabstop=2
    \ | set softtabstop=2
    \ | set shiftwidth=2

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Terraform
let g:terraform_align = 1
let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save = 1

" functions

"R emoves trailing spaces
function TrimWhiteSpace()
    %s/\s*$//e
    ''
endfunction

" Mappings
 map <F2> :call TrimWhiteSpace()<CR>
 map! <F2> :call TrimWhiteSpace()<CR>

