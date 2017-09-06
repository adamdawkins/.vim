" Copy or symlink to ~/.vimrc or ~/_vimrc.

execute pathogen#infect()

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
set completefunc=syntaxcomplete#Complete

runtime macros/matchit.vim        " Load the matchit plugin.


set showcmd                       " Display incomplete commands.
set guifont=Source\ Code\ Pro:h32
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set wildignore=*.scssc,*~,*.log,tmp/*,packages/*,*.pyc,**/node_modules/**/*,*/vendor/**/*

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

let mapleader=","											 " Map leader to comma
" Leaders

" open CtrlP Buffer
map <leader>b :CtrlPBuffer<cr>

" clear search 
map <leader>c :let @/=''<cr>

" Toggle Gundo
map <leader>g :GundoToggle<cr>

" Open location list
map <leader>l :lopen<cr>

" CtrlPModified shows a list of modifed files since last commit
map <Leader>m :CtrlPModified<CR>

" CtrlPBranch shows a list of modifed files on your current branch
map <Leader>M :CtrlPBranch<CR>

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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_w = 1
let g:syntastic_javascript_checkers = ['eslint']

" enable jsx syntax in .js files
let g:jsx_ext_required = 0


" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
let &t_Co=256 
set colorcolumn=100
colorscheme solarized
set background=dark
