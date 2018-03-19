" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Vim plugin for the Perl module / CLI script 'ack'
" :Ack 
Plugin 'mileszs/ack.vim'

" Ctrl P for file navigation
Plugin 'kien/ctrlp.vim'

" a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" Comment related stuff
Plugin 'tpope/vim-commentary'

" Undo browser
Plugin 'sjl/gundo.vim'

" solarized Colorsheme
Plugin 'altercation/vim-colors-solarized'

" quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

Plugin 'mattn/emmet-vim'

" Testing Vimscript
Plugin 'junegunn/vader.vim'

" SYNTAX
Plugin 'vim-syntastic/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'leafgarland/typescript-vim'
Plugin 'git://github.com/flowtype/vim-flow.git'
Plugin 'git://github.com/eagletmt/ghcmod-vim.git'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Shougo/vimproc.vim'
Plugin 'elmcast/elm-vim'
Plugin 'hail2u/vim-css3-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.

set completefunc=syntaxcomplete#Complete
runtime macros/matchit.vim        " Load the matchit plugin.
set showcmd                       " Display incomplete commands.
set guifont=Source\ Code\ Pro:h32
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set wildignore=*.scssc,*~,*.log,tmp/*,packages/*,*.pyc,**/node_modules/**/*,*/vendor/**/*,**/modules/member/views

" ignore the duplicate directories in Direct Sight project in CtrlP
let g:ctrlp_custom_ignore =  'application/modules/(member|staff|admin)/*'

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

"set nocursorcolumn                " disable cursorcolumn

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs



set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" set t_ti= t_te=                   " Prevent Vim from clobbering the scrollback buffer.
                                   " See http://www.shallowsky.com/linux/noaltscreen.html

let mapleader=','											 " Map leader to comma
" Leaders

" open CtrlP Buffer
map <leader>b :CtrlPBuffer<cr>

" clear search 
map <leader>c :let @/=''<cr>

" Toggle Gundo
map <leader>g :GundoToggle<cr>

" Open location list
map <leader>l :lopen<cr>

" open current file
map <leader>o :!open %<cr>

" open CtrlP
map <leader>p :CtrlP<cr>

" put a new line between </> and <..>
map <leader>r :%s/>\zs\ze</\r/g<cr>

" run this file in ruby
map <leader>R :!ruby %<cr>

" toggle NERDTree
map <leader>t :NERDTreeToggle<cr>

" close location list
map <leader>x :lclose<cr>

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

cnoreabbrev <expr> Bd ((getcmdtype() is# ':' && getcmdline() is# 'Bd')?('bd'):('Bd'))
cnoreabbrev <expr> B# ((getcmdtype() is# ':' && getcmdline() is# 'B#')?('bd'):('B#'))
cnoreabbrev <expr> Wa ((getcmdtype() is# ':' && getcmdline() is# 'Wa')?('wa'):('W'))

" nmap _ :
imap  
cmap  

nmap <Space> :
imap   
cmap   

" disable arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" Disable entering Ex mode
nnoremap Q <nop>
" auto-insert closing brace/bracket on return
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" spellings
iab backrgound background
iab rbga rgba
iab habtm has_and_belongs_to_many

" ruby test configuration
let g:rubytest_in_quickfix = 1

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_ignore_files = ['*.min.js$']

" elm vim
let g:elm_format_autosave = 0

" enable jsx syntax in .js files
let g:jsx_ext_required = 0

" haskell
:let g:haddock_browser='/Applications/Google\ Chrome.app'

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
	echo '@'.getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction


" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
let &t_Co=256 
set colorcolumn=100
colorscheme solarized
set background=light
