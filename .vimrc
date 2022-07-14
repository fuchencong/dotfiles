"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc
" Description: basic vim configuration
" Author: fuchencong.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General configuration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set vim command history numbers
set history=500


" allow backspace in insert mode
set backspace=indent,eol,start

" Set minimal number of screen lines to keep above and below the cursor.
set so=7

" Set line number
set nu

set wrap
set showcmd
set wildmenu


" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Show the line and column number of the cursor position
set ruler

" Height of the command bar
set cmdheight=1


" Highlight search results
set hlsearch
exec "nohlsearch"
" Makes search act like search in modern browsers
set incsearch 
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


" Enable syntax highlighting
syntax enable 
" set file format
set ffs=unix
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper map
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map R :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper commands
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use vim-plug to manage all vim plugins
call plug#begin('~/.vim/plugged')

"1. code-display related plugins

" Name     : vim-colors-solarized
" Function : precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Name     : vim-one
" Function : Adaptation of one-light and one-dark colorscheme for vim
Plug 'rakr/vim-one'

" Name     : indentline
" Function : Display th indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" Name     : rainbow
" Function : Help you read complex code by showing diff level of parentheses in diff color
Plug 'luochen1990/rainbow'

" Name     : Auto pairs
" Function : insert or delete brackets, pattens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Name     : vim-surround
" Function : quoting/parenthesizing mode simple
Plug 'anyakichi/vim-surround'

" Name     : vim-better-whitespace
" Function : Better whitespace highlighting for vim
Plug 'ntpeters/vim-better-whitespace'


" 2. Integrations related plugins

" Name     : NERDTree
" Function : A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Name     : tagbar
" Function : Vim plugin that displays tags in window, ordered by scope
Plug 'majutsushi/tagbar'

" Name     : vim-airline
" Function : Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" Name     : ctrlp.vim
" Function : Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'kien/ctrlp.vim'

" Name     : ack
" Function : A Vim frontend for the programmer's search tool ack
Plug 'mileszs/ack.vim'


" Name     : nerdcommenter
" Function : Intensely orgasmic commenting
Plug 'ddollar/nerdcommenter'



" 3. Completion/lint related plugins

" Name     : coc.nvim
" Function : Nodejs extensions host for vim & neovim
" Plug 'neoclide/coc.nvim', {'on': []}
Plug 'neoclide/coc.nvim'

" Name     : supertab
" Function : Perform all your vim insert mode completions with tab
Plug 'ervandew/supertab'

" Name     : ale
" Function : ALE (Asynchronous Lint Engine), syntax checking and semantic errors
Plug 'w0rp/ale'

" Name     : tabular
" Function : Vim script for text filting and alignment
" Github   : git clone https://github.com/godlygeek/tabular

" Name     : vim-gutentags
" Function : A Vim plugin that manages your tag files
" Github   : git clone https://github.com/ludovicchabant/vim-gutentags


" 4. language related plugins
" Name     : vim-go
" Function : Go development plugin for vim
Plug 'fatih/vim-go', { 'on': [] }

" Name     : JSON.vim
" Function : A better json for vim
" Github   : git clone https://github.com/elzr/vim-json

" Name     : python-mode
" Function : A Python IDE for Vim
" Github   : git clone --recurse-submodules https://github.com/python-mode/python-mode.git

" Name     : vim-cpp-enhanced-highlight
" Function : Additional Vim syntax hightling for C++
" Github   : git clone https://github.com/octol/vim-cpp-enhanced-highlight


" Name     : vim-autopep8
" Function : autopep8 automatically formats Python code to conform to the PEP 8 style guide.
" Github   : https://github.com/tell-k/vim-autopep8.git


call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin-related configuration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree configuration
"
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" set NERDTree window size
let g:NERDTreeWinSize=20

" solarized colorscheme
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme one


let g:rainbow_active = 1

set conceallevel=1
let g:indentLine_conceallevel=1
" for indentline, better for json format


noremap <c-z> <NOP>


let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" vim-autopep8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

"ale
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'

" supertab
" cycle from top to bottom, like <c-n>
let g:SuperTabDefaultCompletionType = "<c-n>"
"<cr> will cancel completion mode preserving the current text.
let g:SuperTabCrMapping=1
let g:SuperTabLongestHighlight=1
