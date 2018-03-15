
" =============================================================
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips' 

" emmet
Plugin 'mattn/emmet-vim'
" handlebars
Plugin 'mustache/vim-mustache-handlebars'

" ------------------------------
" Js (React)
" -----------------------------
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" eslint
Plugin 'w0rp/ale'
" prettier
Plugin 'skywind3000/asyncrun.vim'


" Colour Themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'GertjanReynaert/cobalt2-vim-theme'
Plugin 'trevordmiller/nova-vim'


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
set hlsearch!
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=zsh
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
set noesckeys
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list
set complete=.,w,b,u,i
set path+=**

" =============================================================
"                      MAPPINGS
" =============================================================
let mapleader = ","
nnoremap ; :

" move btn windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Exit for insert or visual mode
inoremap <c-t> <ESC>
vnoremap <c-t> <ESC>

" short cut for most common files
nnoremap <leader>ev :tabnew ~/.vimrc<cr>

" short cut for dealing with files, tabs and buf.
nnoremap <leader>et :tabnew<cr>
nnoremap <leader>es :vsplit<cr>

" toggol important submode
nnoremap <leader>v :set paste!<CR>
nnoremap <leader>s :set spell!<CR>
map <C-n> :NERDTreeToggle<CR>

" Git
nnoremap <leader>z :Gstatus<CR><C-w>20+

" move btn tabs
nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>
nnoremap <leader>5 5gt<cr>

" CtrlP
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPClearCache<cr>

" toggle heightlight   
nnoremap <leader><Esc> :set hlsearch!<CR>

 " =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline_powerline_fonts = 2
" let g:airline_solarized_bg='dark'
" let g:ariline_theme='solarized dark'
" let g:airline_theme='papercolor'

" emmet => Note to add , after the keymap
let g:user_emmet_leader_key='<c-y>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" esLinter
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" handlebars 
let g:mustache_abbreviations = 1

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

    " autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    " autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    " prettier
    autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


    autocmd BufRead,BufNewFile *.asc setfiletype asciidoc

    au BufNewFile,BufReadPost *.md set filetype=markdown
  augroup END
endif



" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

" CtrlP plugin
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*


" =============================================================
"                      APPEARENCE
" =============================================================

"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme atom-dark-256
set background=dark

if has("gui_running")
  set guifont=PowerlineSymbols:h14
  " set guifont=Source\ Code\ Pro:h16
  set linespace=2
  set guioptions-=r
endif


" function DeleteHiddenBuffers()
"   let tpbl=[]
"   call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
"   for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
"     silent execute 'bwipeout' buf
"   endfor
" endfunction

