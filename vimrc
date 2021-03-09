" Powerline Configuration
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
let g:powerline_pycmd = "py3"
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

set nocompatible              " required
filetype off                  " required
set encoding=utf-8
let python_highlight_all=1
syntax on
set nu
set clipboard=unnamed
set laststatus=2

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Make folding work better in Vim
Plugin 'tmhedberg/SimpylFold'
" Code completion
Bundle 'Valloric/YouCompleteMe'
" Check syntax
Plugin 'vim-syntastic/syntastic'
" Check PIP8
Plugin 'nvie/vim-flake8'
" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" File Search
Plugin 'ctrlpvim/ctrlp.vim'
" Git Integration
Plugin 'tpope/vim-fugitive'
Plugin 'mobiushorizons/fugitive-stash.vim'
" Powerline Awesomeness
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Search Plugin
Plugin 'mileszs/ack.vim'
" Markdown Plugin
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Terraform Plugins
Plugin 'hashivim/vim-terraform'

Plugin 'python-mode/python-mode', {'for': 'python'}
" All of your Plugins must be added before the following line
call vundle#end()            " required

" Config for fugitive-stash
" Fix next line. Maybe for Github account
" let g:fugitive_stash_domains = ['http://bitbucket.bbvacompass.com'] 
filetype plugin indent on    " required
set modeline

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" Mark bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Some modifications for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" HTML Autocomplete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" Color Scheme Configuration
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F5>")

" Hide .pyc files in NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" The Silver Searcher(ag)
let g:ackprg = 'ag --vimgrep'

" Pymode Setup
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_virtualenv = 1
au BufNewFile,BufRead Jenkinsfile setf groovy

" Search settings
set ignorecase
set smartcase
