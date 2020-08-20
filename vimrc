
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

" Ctrl P
Plugin 'kien/ctrlp.vim'

" EDITOR
" Vim motions on speed!
Plugin 'easymotion/vim-easymotion'

" A scratch file
Plugin 'vim-scripts/scratch.vim'

" Surround
Plugin 'tpope/vim-surround'

" useful pairs of mappings
Plugin 'tpope/vim-unimpaired'

" use CTRL-A/CTRL-X to increment dates, times, and more
Plugin 'tpope/vim-speeddating'

" Better matching
Plugin 'adelarsq/vim-matchit'

" Comments
Plugin 'tomtom/tcomment_vim'

"Emmet
Plugin 'mattn/emmet-vim'


" GIT
Plugin 'tpope/vim-fugitive'

" SYNTAXES

"       CoffeeScript
" Plugin 'kchmck/vim-coffee-script'

"      elixir
" Plugin 'elixir-editors/vim-elixir'

"      elm
" Plugin 'ElmCast/elm-vim'

"      Erlang
" Plugin 'vim-erlang/vim-erlang-omnicomplete'

"      GraphQL
" Plugin 'jparise/vim-graphql'
"      Handlebars
" Plugin 'mustache/vim-mustache-handlebars'
"      Haskell
" Plugin 'alx741/vim-stylishask'
" Plugin 'lukerandall/haskellmode-vim'

"      Javascript
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'pangloss/vim-javascript'

"      Markdown
Plugin 'plasticboy/vim-markdown'

"      PHP
" Plugin '2072/PHP-Indenting-for-VIm'
" Plugin 'lumiliet/vim-twig'

"      Python
" Plugin 'vim-scripts/indentpython.vim'

"      Ruby
Plugin 'joker1007/vim-ruby-heredoc-syntax'

"       TypeScript
" Plugin 'leafgarland/typescript-vim'


""     TOOLS
Plugin 'AndrewRadev/splitjoin.vim' " Switch between single-line and multiline forms of code
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise' " better `end` inserts for ruby etc
" Plugin 'ycm-core/YouCompleteMe' " A code-completion engine for Vim
Plugin 'tpope/vim-abolish' " Working with words
" Plugin 'ternjs/tern_for_vim' " JS autocomplete


" Syntax Checking
Plugin 'dense-analysis/ale'

" tmux intexgration
Plugin 'christoomey/vim-tmux-runner'


" " Undo History
Plugin 'sjl/gundo.vim'

Plugin 'jpo/vim-railscasts-theme'

call vundle#end()
filetype plugin indent on


" END PLUGINS

" Key mappings
let mapleader=',' " map leader to comma
let maplocalleader='\'

" Vtr config
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

" map spacebar to :
nmap <Space> :

" map leader 3 to b#, buffer switch
nmap <leader>3 :b#<cr>

" map ,. to switch between test/production
nmap <leader>. :A<cr>

" ctrl p for current buffers
map <leader>b :CtrlPBuffer<cr>

map <leader>B :wa\|execute ':silent !npm run build' \| execute ':redraw!' \| :silent !reload-chrome<cr>

nnoremap <leader>e :call SelectaFile(expand('%:h'), "*", ":edit")<cr>

" gundo
map <leader>gu :GundoToggle<CR>

nnoremap <leader>gv :call SelectaFile("app/views", "*", ":edit")<cr>
nnoremap <leader>gc :call SelectaFile("app/controllers", "*", ":edit")<cr>
nnoremap <leader>gm :call SelectaFile("app/models", "*", ":edit")<cr>
nnoremap <leader>gh :call SelectaFile("app/helpers", "*", ":edit")<cr>
nnoremap <leader>gl :call SelectaFile("lib", "*", ":edit")<cr>
nnoremap <leader>gp :call SelectaFile("public", "*", ":edit")<cr>
nnoremap <leader>gs :call SelectaFile("app/assets/stylesheets", "*.sass", ":edit")<cr>
nnoremap <leader>gt :call SelectaFile("app/spec", "*", ":edit")<cr>

map <leader>j :wa\|execute ':silent !npm run webpack --mode production' \| execute ':redraw!' \| :silent !reload-chrome<cr>

:map <leader>l :PromoteToLet<cr>

map <leader>m :call MkDir()<cr>

" Open the current file (in whatever it normally opens in)
map <leader>o :!open %<cr>

" Open CtrlP
" map <leader>p :CtrlP<cr>
" force selecta instead of CtrlP for a bit
nnoremap <leader>p :call SelectaFile(".", "*", ":edit")<cr>

" Reload chrome
map <leader>r :w\|:silent !reload-chrome<cr>

" spell check
map <leader>s ]s

" <leader>T mapped by Testing (line #204)

" tags
nmap <leader>f <C-]><cr>

nnoremap <leader>v :call SelectaFile(expand('%:h'), "*", ":view")<cr>

" Open ~/.vimrc
map <leader>vi :e ~/.vimrc<cr>


command Noswaps execute "!rm %:h/.%:t.sw*"

map <C-l> <C-w><C-l>
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>

" ignore some stuff always
set wildignore=**/node_modules?**,**/tmp/**,**/vendor/bundle/**,**/fixtures/vcr_cassettes/**/*

" ALE Syntax checker setup
" "
let g:ale_javascript_prettier_use_global = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'ruby': ['standardrb'],
\}

let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': [],
\   'ruby': ['standardrb', 'rubocop'],
\   'scss': [],
\}

let g:ale_fix_on_save = 1

set omnifunc=syntaxcomplete#Complete


" CTRL-P Setup
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'r'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'

" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_rails = 1

" Gundo Python setup
let g:gundo_prefer_python3 = 1


let g:haddock_browser="/usr/bin/firefox"

" Ruby setup
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" window and buffery stuff

" Allow new buffers to open with unsaved buffers behind
set hidden

" search settings
set ignorecase
set smartcase " searches case insensitive with lower-case letters, but sensitive with uppercase

" automatically rebalance windows on vim resize
" autocmd VimResized * :wincmd =
" set winwidth=100


" make directory for current file
function MkDir()
  exe '!mkdir -p %:h'
endfunction


""" TESTING (from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
"
" Test running here is contextual in two different ways:
"
" 1. It will guess at how to run the tests. E.g., if there's a Gemfile
"    present, it will `bundle exec rspec` so the gems are respected.
"
" 2. It remembers which tests have been run. E.g., if I'm editing user_spec.rb
"    and hit enter, it will run rspec on user_spec.rb. If I then navigate to a
"    non-test file, like routes.rb, and hit return again, it will re-run
"    user_spec.rb. It will continue using user_spec.rb as my 'default' test
"    until I hit enter in some other test file, at which point that test file
"    is run immediately and becomes the default. This is complex to describe
"    fully, but simple to use in practice: always hit enter to run tests. It
"    will run either the test file you're in or the last test file you hit
"    enter in.
"
" 3. Sometimes you want to run just one test. For that, there's <leader>T,
"    which passes the current line number to the test runner. RSpec knows what
"    to do with this (it will run the first test it finds at or below the
"    given line number). It probably won't work with other test runners.
"    'Focusing' on a single test in this way will be remembered if you hit
"    enter from non-test files, as described above.
"
" 4. Sometimes you don't want contextual test running. In that case, there's
"    <leader>a, which runs everything.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
	nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
	if a:0
		let command_suffix = a:1
	else
		let command_suffix = ""
	endif

	" Are we in a test file?
	let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\|test_.*\.py\|_test.py\|Test.hs\)$') != -1

	" Run the tests for the previously-marked file (or the current file if
	" it's a test).
	if in_test_file
		call SetTestFile(command_suffix)
	elseif !exists("t:grb_test_file")
		return
	end
	call RunTests(t:grb_test_file)
endfunction

function! RunNearestTest()
	let spec_line_number = line('.')
	call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile(command_suffix)
	" Set the spec file that tests will be run for.
	let t:grb_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
	" Write the file and run tests for the given filename
	if expand("%") != ""
		:w
	end
	" The file is executable; assume we should run
	if executable(a:filename)
		exec ":call Fifo('./')" . a:filename
		" Project-specific test script
	elseif filereadable("bin/test")
		exec ":call Fifo('bin/test " . a:filename . "')"
		" Rspec binstub
	elseif filereadable("bin/rspec")
		exec ":call Fifo('bundle exec rspec --format documentation --fail-fast " . a:filename . "')"
	elseif filereadable("script/cucumber")
		exec ":call Fifo('bundle exec script/cucumber " . a:filename . "')"
		" Fall back to the .test-commands pipe if available, assuming someone
		" is reading the other side and running the commands
	elseif filewritable(".test-commands")
		let cmd = 'bundle exec rspec --color --format documentation --require "~/lib/vim_rspec_formatter" --format VimFormatter --fail-fast --out tmp/quickfix'
		exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

		" Write an empty string to block until the command completes
		sleep 100m " milliseconds
		:!echo > .test-commands
		redraw!
		" Fall back to a blocking test run with Bundler
	elseif filereadable("bin/rspec")
		exec ":call Fifo('bin/rspec --color --fail-fast " . a:filename . "')"
	elseif filereadable("Gemfile") && strlen(glob("spec/**/*.rb"))
		exec ":call Fifo('bundle exec rspec --format documentation --color --fail-fast " . a:filename . "')"
	elseif filereadable("Gemfile") && strlen(glob("test/**/*.rb"))
		exec ":call Fifo('bin/rails test " . a:filename . "')"
	end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given
" shell command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " .  a:selecta_args)
    " Escape spaces in the file name. That ensures that it's a
    " single argument
    " when concatenated with vim_command and run with exec.
    let selection = substitute(selection, ' ', '\\ ', "g")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " .  selection
endfunction

function! SelectaFile(path, glob, command)
  call SelectaCommand("find " . a:path . "/* -type f -and -not -path '*/node_modules/*' -and -not -path '*/_build/*' -and -not -path '*/build/*' -and -iname '" . a:glob . "' -and -not -iname '*.pyc' -and -not -ipath '*/tmp/*' -and -not -ipath '*/.meteor/*' -and -not -iname '*.png' -and -not -iname '*.jpg' -and -not -iname '*.eps' -and -not -iname '*.pdf' -and -not -iname '*.svg' -and -not -iname '*.ttf'", "", a:command)
endfunction

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  " autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  " autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! BufReadPost quickfix nnoremap <CR> <CR>
  autocmd! CmdwinLeave * :call MapCR()

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=

  " indent slim two spaces, not four
  autocmd! FileType slim set sw=2 sts=2 et
augroup END


map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

function! Fifo(cmd)
  :silent! exe '!echo "clear; cd ' . getcwd() . ' && ' . a:cmd . '" > /tmp/cmds'
  :redraw!
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()


" editor settings
set shiftwidth=2
set tabstop=2
set expandtab

set number
" set winwidth=79

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3

set showtabline=2

" Python indentation
au BufNewFile,BufRead *.py
      \:set tabstop=4
      \:set softtabstop=4
      \:set shiftwidth=4
      \:set textwidth=79
      \:set expandtab
      \:set autoindent
      \:set fileformat=unix

" close fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Haskell soft tabs
autocmd Filetype hs setlocal ts=2 sw=2 expandtab
autocmd Filetype cabal setlocal ts=2 sw=2 expandtab

" Turn off folds in Markdown files
au FileType markdown setlocal nofoldenable

au BufRead,BufNewFile *.pcss set filetype=css

:set tags=tags
:set tags^=./.git/tags;

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:set diffopt=vertical

" COLORS

:set t_Co=256 " 256 colors
:set cursorline
:set colorcolumn=100
:set cursorcolumn
:set background=dark
colorscheme railscasts
