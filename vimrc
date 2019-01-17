
set nocompatible              " be iMproved, required
filetype off                  " required

" PLUGINS
" set the runtime path to inclued Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim defaults everyone can agree on
Plugin 'tpope/vim-sensible'

" NAVIGATION
" NerdTree file explorer
Plugin 'scrooloose/nerdtree'

" Ctrl P
Plugin 'kien/ctrlp.vim'

" EDITOR
" Vim motions on speed!
Plugin 'easymotion/vim-easymotion'

" Surround
Plugin 'tpope/vim-surround'

" useful pairs of mappings
Plugin 'tpope/vim-unimpaired'

" closing pairs
" Plugin 'cohama/lexima.vim'

" Better matching
Plugin 'adelarsq/vim-matchit'

" Comments
Plugin 'tomtom/tcomment_vim'

"Emmet
Plugin 'mattn/emmet-vim'

" Statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" COLORSCHEMES
Plugin 'flazz/vim-colorschemes'
Plugin 'kadekillary/subtle_solo'
Plugin 'aradunovic/perun.vim'

"" GIT
Plugin 'tpope/vim-fugitive'

" SYNTAXES
Plugin 'kchmck/vim-coffee-script'
Plugin 'jparise/vim-graphql'
Plugin 'pangloss/vim-javascript'
Plugin 'ElmCast/elm-vim'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-rails'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'plasticboy/vim-markdown'

"Working with words
Plugin 'tpope/vim-abolish'

" Vim JS Autocompletion with type hints
" Plugin 'marijnh/tern_for_vim'
" Plugin 'Valloric/YouCompleteMe'

" Syntax Checking
Plugin 'vim-syntastic/syntastic'

" Undo History
Plugin 'sjl/gundo.vim'

call vundle#end()
filetype plugin indent on


" END PLUGINS

" Key mappings
let mapleader=',' " map leader to comma

" map spacebar to :
nmap <Space> :

" map ,. to switch between test/production
nmap <leader>. :A<cr>

" ctrl p for current buffers
map <leader>b :CtrlPBuffer<cr>

" class= -> className=
map <leader>c :%s/class=/className=/g<cr>

" run deploy command
map <leader>d :w<cr> \|:!npm run deploy<cr>

" run the Syntastic Check
map <leader>l :SyntasticCheck<cr>

" Toggle NERDTree
map <leader>n :NERDTreeToggle<cr>

" Open the current file (in whatever it normally opens in)
map <leader>o :!open %<cr>

" Open CtrlP 
map <leader>p :CtrlP<cr>

" Reload chrome
map <leader>r :w\|:silent !reload-chrome<cr>

" spell check
map <leader>s ]s

" <leader>T mapped by Testing (line #204)

" tags
nmap <leader>t <C-]><cr>


" Open ~/.vimrc
map <leader>v :e ~/.vimrc<cr>

map <C-l> <C-w><C-l>
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>

" ignore some stuff always
set wildignore=**/node_modules?**


" CTRL-P Setup
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'r'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'


" Syntastic Check setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }

" window and buffery stuff

" Allow new buffers to open with unsaved buffers behind
set hidden

" search settings
set ignorecase
set smartcase " searches case insensitive with lower-case letters, but sensitive with uppercase


" editor settings
set shiftwidth=2
set tabstop=2

set guifont=Fira\ Code\ Regular:18

set number

" COLORS
let g:airline_theme='seagull'
colorscheme railscasts
