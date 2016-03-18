
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mattn/emmet-vim'

Plugin 'rbgrouleff/bclose.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'SirVer/ultisnips'
Plugin 'janko-m/vim-test'

Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'machakann/vim-textobj-delimited'
Plugin 'rizzatti/dash.vim'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'AlessandroYorba/Alduin'

" Test Run
Plugin 'terryma/vim-expand-region'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ervandew/supertab'

" Colour Themes
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'lyokha/vim-xkbswitch'

call vundle#end()
filetype plugin indent on
syntax on

runtime macros/matchit.vim

" =============================================================
"                 GENERAL SETTINGS
" =============================================================

set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set showmatch
set nowrap
set autoread
set autowrite
set backupdir=~/.tmp
set directory=~/.tmp
set viminfo+=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set number
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=bash
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
" =============================================================
"                    AUTOCOMMANDS
" =============================================================

if has("autocmd")
  augroup vimrcEx
    au!

    autocmd BufRead *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    autocmd BufRead,BufNewFile *.asc setfiletype asciidoc

    au BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================

let mapleader = ","

" insert mode
imap <c-e> <esc>A

" Quick open most used files
nnoremap <leader>em :!open -a 'Marked 2.app' '%:p'<cr>
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>es :split<cr>:UltiSnipsEdit<cr>

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <space> :nohl<Bar>:echo<CR>
nnoremap <leader>m mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nmap k gk
nmap j gj
nnoremap H ^
nnoremap E $
inoremap <C-n> <C-j>

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" CtrlP plugin
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>w :CtrlP app/assets/javascripts<cr>
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPClearCache<cr>
nnoremap <leader>gc :CtrlP app/controllers<cr>
nnoremap <leader>gv :CtrlP app/views<cr>
nnoremap <leader>gm :CtrlP app/models<cr>
nnoremap <leader>gs :CtrlP app/services<cr>
nnoremap <leader>gr :CtrlP spec<cr>
nnoremap <leader>gt :CtrlP ~/Dropbox/gollum<cr>
nnoremap <leader>gp :CtrlP <C-R>=expand("%:p:h") . "/"<cr><cr>

nnoremap <leader>z :Gstatus<CR><C-w>20+

nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

" Rails plugin navigation
" nnoremap <leader>gc :Econtroller
" nnoremap <leader>gm :Emodel
" nnoremap <leader>gv :Eview
" nnoremap <leader>gr :Espec
" nnoremap <leader>gj :Ejavascript
" nnoremap <leader>gs :Eservice
" nnoremap <leader>gi :Einitializer

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" Markdown
let g:vim_markdown_folding_disabled=1

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
" let g:test#rspec#executable = 'bin/rspec'

" JSX
let g:jsx_ext_required = 0
let javascript_enable_domhtmlcss = 1

let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchIMappingsTr = {
            \ 'ru':
            \ {'<': 'qwfpgjluy;[]arstdhneio''\zxcvbkm,.`/'.
            \       'QWFPGJLUY:{}ARSTDHNEIO"ZXCVBKM<>?~@#$^&|',
            \  '>': 'йцукенгшщзхъфывапролджэячсмитьбюё.'.
            \       'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,Ё"№;:?/'},
            \ }

" =============================================================
"                      APPEARENCE
" =============================================================

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" colorscheme smyck
" colorscheme onedark
colorscheme solarized

if has("gui_running")
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
  set linespace=2
endif

" =============================================================
"                      PROJECTIONS
" =============================================================

let g:rails_projections = {
      \ "app/services/*.rb": {
      \   "command": "service",
      \   "template":
      \     ["class %S", "end"],
      \   "test": [
      \     "test/unit/%s_uploader_test.rb",
      \     "spec/services/%s_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ }}

" =============================================================
"                      CUSTOM FUNCTIONS
" =============================================================

" Create folders on file save
" ===========================

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Remove whitespaces on save saving cursor position
" =================================================

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" set langmap=йцукенгшщзхъфывапролджэячсмитьбю;qwfpgjluy\\;[]arstdhneio'zxcvbkm\\,.
