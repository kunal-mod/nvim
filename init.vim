" Author: Kunal Mod


call plug#begin('~/local/share/nvim/plugged')

Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      "see use cases
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

call plug#end()


let mapleader = ","

set splitright
set splitbelow
"set ignorecase      " ignore case while searching
set nu rnu
set showmatch
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab		" convert tab to whitespaces
set shiftwidth=4	" width for autoindent
set smartindent
set nowrap
"set autoindent
syntax on
filetype plugin on
set clipboard=unnamed
set exrc    " this allow us to have project specific vimrc as this make vim look for vimrc first in current dir


"colorscheme gruvbox
colorscheme afterglow

"inoremap <silent> <C-Return> <CR><Esc>O

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"resizing splits
nnoremap <leader>vi :vertical resize +5<CR>
nnoremap <leader>vd :vertical resize -5<CR>
nnoremap <leader>hi :resize +5<CR>
nnoremap <leader>hd :resize -5<CR>

inoremap jj <Esc>
nnoremap \ :split <bar> :resize 15 <bar> :te<CR> i

"syntastic remap
nnoremap <leader>sc :lclose<CR>
nnoremap <leader>sn :lnext<CR>
nnoremap <leader>sp :lprevious<CR>






" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1

" NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden = 1    "show hidden files 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

noremap <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 

" Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Map to open current file in NERDTree and set size
nnoremap <leader>o :NERDTreeFind<bar> :vertical resize 30<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 

" NERDTree Git Plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"NERDCommenter

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


"   Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0




augroup compileandrun
    autocmd!
    autocmd filetype cpp nnoremap <F6> :w <bar> :!g++ -std=c++14 % <CR>
    autocmd filetype cpp nnoremap <F7> :split <bar> :resize 15 <bar> :te "./a.out" <CR> i
augroup END
