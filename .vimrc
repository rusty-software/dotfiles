set nocompatible
filetype off

""" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Text editing enhancements
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/vim-pseudocl'
Plugin 'junegunn/vim-oblique'

" Tools
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode=0

Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1

Plugin 'qpkorr/vim-bufkill'

Plugin 'chriskempson/base16-vim'
Plugin 'hzchirs/vim-material'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t' " Look

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/vim-niji'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

let g:clj_fmt_autosave = 0
let g:clojure_fuzzy_indent_patterns = ['describe', 'it', '^doto', '^with', '^def', '^let', 'go-loop']

" React Native
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Other languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'fsouza/go.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ledger/vim-ledger'
Plugin 'tpope/vim-markdown'

let g:markdown_fenced_languages = [
      \ 'coffee',
      \ 'css',
      \ 'erb=eruby',
      \ 'javascript',
      \ 'js=javascript',
      \ 'json=javascript',
      \ 'ruby',
      \ 'sass',
      \ 'xml',
      \ 'html',
      \ 'clojure']

" Tmux
"Plugin 'jpalardy/vim-slime'
"Plugin 'tpope/vim-dispatch'
"Plugin 'jgdavey/tslime.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

""" Look and Feel
set background=dark

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='molokai'

if has("gui_running")
  set guioptions-=T " Remove toolbar
  set guioptions-=m " Remove menu bar
  set guioptions-=r " Remove scroll bar
  set guioptions-=L " Remove scroll bar

  set guifont=Inconsolata-g\ 11

  " Highlight column 81 and 121 and up
  let &colorcolumn="81,".join(range(121,999),",")
endif

" Turn on syntax hilighting.
syntax enable
filetype plugin indent on

set autoread
set laststatus=2
set cursorline
set backspace=indent,eol,start

" Hilight searches and do incremental searches. Also ignore case for searches.
set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden      " Don't require saving before switching buffers
set showcmd     " Show command prefixes.
set wildmenu    " Menu of completions
set scrolloff=5 " Keep 5 lines of context when scrolling
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Files ignored when expanding wildcards. Also ignored by CtrlP.
set wildignore+=*.class
set wildignore+=*/out/*
set wildignore+=*/target/*
set wildmode=longest,full

set number
set cpoptions+=n " Wrapped text uses line number columns

set listchars=tab:→·,trail:·
set list

" Turn on auto indenting.
set autoindent
set smartindent
set smarttab
set expandtab
set formatoptions-=t

set textwidth=0
set shiftwidth=2
set tabstop=2

" Line folding
"set foldmethod=indent
"set foldlevel=00

au FileType java setl sw=4 ts=4
au FileType sml setl sw=4 ts=4
au FileType lua setl sw=4 ts=4
au FileType go setl sw=4 ts=4

autocmd BufWritePre * :%s/\s\+$//e " Auto-strip trailing whitespace on write
autocmd VimResized * :wincmd =
autocmd BufRead,BufNewFile *.cljx setfiletype clojure
autocmd FileType text setl formatoptions+=t

source $VIMRUNTIME/ftplugin/man.vim
autocmd FileType man setlocal nolist readonly nomodifiable

""" Maps and Commands

let mapleader = ","
let maplocalleader = ","

" General
nnoremap Y y$
set clipboard=unnamedplus
map <C-N> :bnext<CR>
command Bd bp\|bd \#

" CtrlP
nmap <leader>p :CtrlPBuffer<CR>

" NERDTree
nmap <leader>nt :NERDTreeToggle<CR>

" Fireplace

"" Connecting
command! DroidConnect Connect nrepl://localhost:9999
command! SimpleBrepl Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)
nmap <leader>C :Connect<CR>1<CR><CR>
nmap <leader>cd :DroidConnect<CR><CR>
nmap <leader>cb :SimpleBrepl<CR><CR>

"" Evaluation
nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
nmap <Leader>E :%Eval<CR>

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
