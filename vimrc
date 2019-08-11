" vundle start
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
Plug '~/.vim/plugged/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Yggdroot/indentLine', {'for': 'python'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
" Plugin 'cjrh/vim-cond'
" Plugin 'davidhalter/jedi-vim'
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" coding habits
set nu 
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set splitbelow
set splitright
set encoding=utf-8
set hlsearch

" Map space to leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" map ESC -> jj
inoremap jj <Esc>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead, BufNewFile *.py, *.pyw, *.c, *.cpp, *.h match BadWhitespace /\s\+$/

" Flake8
let python_high_light_all=1
syntax on

" indentLine
let g:IndentLineEnable=1

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YmcCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = "python"     " use env python as python bin

" NerdTree
" map <C-n> :NERDTreeToggle<CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" airline
let g:airline#extensions#tabline#enabled = 1
