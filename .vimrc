" Use the Solarized Dark theme
set rtp+=/usr/local/opt/fzf
set background=dark
set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

colorscheme solarized
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Ale
let g:ale_linters = {
\   'go': ['gopls', 'golint', 'go vet'],
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_javascript_eslint_use_global = 0
" let g:airline#extensions#ale#enabled = 1

"----------------------------------------------
" Plugin: Ag
"----------------------------------------------
" Open Ag
nnoremap <leader>a :Ag<space>

" Search
map <space> /


" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Change mapleader
let mapleader=","
" NERDTree
nmap <leader>t :NERDTreeToggle<CR>
" Clear highlight search
map <leader>cs :nohlsearch<CR>
" Close current buffer
map <leader>w :bd<CR>
" [,* ] Search and replace the word under the cursor.
nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>
" [,ss] Strip trailing whitespace.
nmap <leader>ss :call StripTrailingWhitespaces()<CR>
" [,cc] Toggle code comments.
" https://github.com/tomtom/tcomment_vim
map <leader>cc :TComment<CR>
" [,ci] Toggle comment
map <leader>ci :NerdCommenterToggle<CR>
" [,w] Close current buffer
map <leader>w :bdelete<CR>
" [,cs] Clear search
map <leader>cs :nohlsearch<CR>

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set smartindent
"set autoindent
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Nvim release version
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plugin Greer
Plug 'ggreer/the_silver_searcher'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Ale
Plug 'dense-analysis/ale'

" Lightline
Plug 'itchyny/lightline.vim'

" Lightline Ale
Plug 'maximbaz/lightline-ale'

" Initialize plugin system
call plug#end()

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Make `Tab` autocomplete.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Prevent `Enter` to create new line when selecting from omni-completion
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Keep a menu item always highlighted
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Status line for `lightline`
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:rigel_lightline = 1
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'fileformat', 'fileencoding', 'percent', 'filetype', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
			\										 'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
			\	}
let g:lightline.component_function = {
      \     'gitbranch': 'fugitive#head',
			\			'cocstatus': 'coc#status',
			\			'currentfunction': 'CocCurrentFunction'
      \ }
" End status line

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<CR>
