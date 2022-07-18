" Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tomasr/molokai'
call plug#end()

" Basics
colorscheme molokai
hi Comment ctermfg=gray

set number
set noswapfile
set nobackup
set autoread " automatically read editing files.
set cursorline " emphasize the current editing line.
set showmatch " highlight the other parenthesis.
set wildmenu
set textwidth=0
set history=2500

" Moving
nnoremap j gj
nnoremap k gk

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Esc><Esc> :set hlsearch!<CR><Esc>

" Tab, Space, Indent
set wrapscan " arriving at the end of the line, go to the next line.
set expandtab " convert tabs to spaces.
set tabstop=4 
set shiftwidth=4
set autoindent
set smartindent

" Clipboard
set clipboard=unnamed

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:neocomplete#sources#omni#input_patterns = '\h\w\.\w*'
"" When saving a go file, goimport command is automatically executed.
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
            \ 'vars':       'rightbelow 60vnew',
            \ 'stack':      'rightbelow 10new',
            \ }

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Others
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap ` ``<LEFT>

if has('nvim')
  command! -nargs=* Term split | terminal <args>
  command! -nargs=* Termv vsplit | terminal <args>
endif
