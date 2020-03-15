set nocompatible

syntax enable
filetype plugin on

set clipboard+=unnamedplus

set number relativenumber

set tabstop=4

set listchars=tab:->,trail:~,extends:>,precedes:<,space:.
noremap <F5> :set list!<CR>

set splitbelow splitright

" Make netrw behave like NERDTree
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
