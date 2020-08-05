" set VIM to use undo-file
set undofile

""START Vundle - https://github.com/VundleVim/Vundle.vim
" set VIM to use all VIM features (no only VI) - required for Vundle
set nocompatible

" disable VIM filetype detection - 
filetype off                  " required for Vundle
"
"filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

""" All plugins below, will install from GIthub
" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'
" This indentation script for python tries to match more closely what is suggested in PEP 8 (http://www.python.org/peps/pep-0008.html).
" In particular, it handles continuation lines implied by open (parentheses), 
" [brackets] and {braces} correctly and it indents multiline if/for/while statements differently. 
Plugin 'vim-scripts/indentpython.vim'
" Solarized Colorscheme for Vim - https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
" Zenburn is a low-contrast color scheme for Vim. It’s easy for your eyes and
" designed to keep you in the zone for long programming sessions.
Plugin 'jnurmine/Zenburn'
" The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse 
" complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
Plugin 'scrooloose/nerdtree'
" This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plugin 'jistr/vim-nerdtree-tabs'
" Find in files / Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
" comment everithing / comment stuff out
Plugin 'tpope/vim-commentary'
" Repeat commands
Plugin 'tpope/vim-repeat'
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plugin 'pangloss/vim-javascript'
" A very fast, multi-syntax context-sensitive color name highlighter
Plugin 'ap/vim-css-color'
" Vim syntax highlighting for Vue components.
Plugin 'posva/vim-vue'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required for Vundle
filetype plugin on
""STOP Vundle

" Ignore case in search
set ignorecase
" Override the ignorecase if search contains UPPER ???? What???
set smartcase
" when set gdefault, connamds:
" :s/blah/xxx/ used as :s/blah/xxx/g
" :s/blah/xxx/g used as :s/blah/xxx/gg
set gdefault
"Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert	mode.  
set backspace=indent,eol,start

" set encoding of new files, text in buffer, etc
set encoding=utf-8

" Split
" When on, splitting a window will put the new window below the current
"	one. |:split|
set splitbelow
"When on, splitting a window will put the new window right of the
"	current one. |:vsplit|
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

"Enable folding with the spacebar
nnoremap <space> za


"Save fold and position of opened files and then open same file in the same
"position
"https://vim.fandom.com/wiki/Make_views_automatic
"https://vimhelp.org/usr_21.txt.html#21.5
au BufWinLeave * mkview
au BufWinEnter * silent loadview
"Dont save options (use only options from .vimrc) https://vimhelp.org/options.txt.html#%27viewoptions%27
set viewoptions-=options

set t_Co=256

let python_highlight_all=1
set fileformat=unix
" always display status line
set ruler

" python - style tabs
"set sts=4 " softtabstop - Number of spaces that a <Tab> counts
"set ts=4  " tabstop - Number of spaces that a <Tab> in the file counts for.
"set sw=4  " shiftwidth - Number of spaces to use for each step of (auto)indent.
set et    " expandtab - In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set ai    " autoindent - Copy indent from current line when starting a new line 
syn on    " syntax highlighting on according to the current value of the 'filetype' option
"colorscheme desert
colorscheme zenburn
"filetype indent on
" https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste
set pastetoggle=<F2>

"Change leader key
let mapleader = ","
"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Replace all tabs with 4 whitespaces
nnoremap <leader>T :%s/\t/    /g<CR>

"highlight search results (as you type)
set incsearch
set showmatch
set hlsearch
"clear out a search
nnoremap <leader><space> :noh<cr>
"reselect the text that was just pasted
nnoremap <leader>v V`]
"to exit back to normal mode
inoremap jj <ESC>

autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set sts=4


" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

" Python PEP8 https://www.python.org/dev/peps/pep-0008/#maximum-line-length
" http://vimdoc.sourceforge.net/htmldoc/options.html#'textwidth'
set textwidth=72 				" max width for comments
set colorcolumn=+1,+8 	" higlight 73 and 80 column
