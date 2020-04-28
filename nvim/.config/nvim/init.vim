" Plugins
" call plug#begin('~/.config/nvim/plugged')
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} 

call plug#end()

" coc config
let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-json',
	\ 'coc-rls'
	\]

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

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
