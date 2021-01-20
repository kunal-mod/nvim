set nocompatible

call plug#begin('C:/Users/asus/AppData/Local/nvim/plugged')

" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'


call plug#end()

filetype plugin on

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

filetype on

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set splitright
set splitbelow

" Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar

set encoding=utf-8

syntax on

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1






highlight Comment cterm=italic gui=italic

set nu rnu" relative line numbering
set clipboard=unnamed " public copy/paste register
set ruler
set autoindent " enable auto indentation of lines
set cindent
nnoremap // :noh<return>
set smartindent " allow vim to best-effort guess the indentation

nnoremap <space> a<return><Esc>bea<return>
map <C-n> :NERDTreeToggle<CR>

nnoremap \ :vnew <bar> :te<return>

" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
    autocmd filetype cpp nnoremap <f6> :w <bar> !g++ -std=c++11 % <return>
    autocmd filetype cpp nnoremap <f7> :vnew <bar> :te "a.exe" <cr>
    autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
augroup END