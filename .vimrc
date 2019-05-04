syntax enable "enable syntax processing
set wildmenu
"set tabstop=2
"set softtabstop=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"set expandtab   "tabs are spaces
set number      "show line number
set cursorline  "highlight current line
set wildmenu    " visual autocomplete for command menu
set showmatch   " highlight matching [{()}]

set incsearch   " search as characters are entered
set hlsearch    "   highlight matches

set mouse=a
"   turn off search highlight
nnoremap <leader><space> :nohlsearch <CR>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'bling/vim-airline'

"nerdtree plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'
Plugin 'easymotion/vim-easymotion'
Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'sbdchd/neoformat'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
" Add color_scheme
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'leshill/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'fatih/vim-go'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set backspace=indent,eol,start
set encoding=UTF-8
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



execute pathogen#infect()
syntax on
colorscheme  gruvbox


filetype indent on  "load filetype-specific indent files
execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')
"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG

set t_Co=256

let mapleader = ','
" Babel
let g:javascript_plugin_jsdoc = 1

"Neo format

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--single-quote'],
        \ 'stdin': 1}

"Neo format
"autocmd BufWritePre *.js Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre *.js Neoformat
augroup END
let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--single-quote'],
        \ 'stdin': 1}

let g:neoformat_enabled_javascript = ['prettier']
"Prettier
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"

let g:prettier#autoformat = 0
autocmd BufWritePre *.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier
" max line length that prettier will wrap on
let g:prettier#config#print_width = 80
" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" open a NERDTree automatically when vim starts up if no files were specified

map <C-n> :NERDTreeToggle<CR>

" Nerdtree Tab
" let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autofind=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'



"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
