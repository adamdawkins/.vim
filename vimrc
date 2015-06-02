" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

execute pathogen#infect()

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
set completefunc=syntaxcomplete#Complete

runtime macros/matchit.vim        " Load the matchit plugin.

let mapleader = ","               " map leader to comma

set showcmd                       " Display incomplete commands.
set guifont=Source\ Code\ Pro:h20
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set wildignore=*.scssc,*~,*.log,tmp/*,packages/*,*.pyc,node_modules/**/*,*/vendor/**/*

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
set expandtab                    " Use spaces instead of tabs

" open current file
map <leader>o :!open %<cr>


set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P



" leader c: clear search 
map <leader>c :let @/=''<cr>

map <leader>r :%s/>\zs\ze</\r/g<cr>

map <leader>p :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

map <leader>i :!coffee -c %<cr>

vmap <leader>a :SCSSA<cr>

" leader g = gundo

map <leader>g :GundoToggle<cr>

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

cnoreabbrev <expr> Bd ((getcmdtype() is# ':' && getcmdline() is# 'Bd')?('bd'):('Bd'))
cnoreabbrev <expr> B# ((getcmdtype() is# ':' && getcmdline() is# 'B#')?('bd'):('B#'))
cnoreabbrev <expr> Wa ((getcmdtype() is# ':' && getcmdline() is# 'Wa')?('wa'):('W'))
cnoreabbrev <expr> bda ((getcmdtype() is# ':' && getcmdline() is# 'bda')?('1,2000bd'):('bda'))
cnoreabbrev <expr> bda! ((getcmdtype() is# ':' && getcmdline() is# 'bda!')?('1,2000bd!'):('bda!'))

nmap _ :
imap  
cmap  

nmap \ :
imap   
cmap   

" Search for selected text, forwards or backwards.
 vnoremap <silent> * :<C-U>
 \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
 \gvy/<C-R><C-R>=substitute(
 \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
 \gV:call setreg('"', old_reg, old_regtype)<CR>
 vnoremap <silent> # :<C-U>
 \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
 \gvy?<C-R><C-R>=substitute(
   \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
 \gV:call setreg('"', old_reg, old_regtype)<CR>

" disable arrow keys
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" nnoremap <Left>  <NOP>
" nnoremap <Right> <NOP>
" nnoremap <Up>    <NOP>
" nnoremap <Down>  <NOP>

" auto-insert closing brace/bracket on return
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" spellings
iab mulitplayer multiplayer
iab backrgound background
iab EXECTUE EXECUTE
iab exectue execute
iab rbga rgba


" ruby test configuration
let g:rubytest_in_quickfix = 1

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
let &t_Co=256 
set colorcolumn=80
colorscheme solarized
set background=dark
