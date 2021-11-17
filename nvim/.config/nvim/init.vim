" Plugins
call plug#begin('~/.config/nvim/plugged')
" call plug#begin(stdpath('data') . '/plugged')

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

" Markdown
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() } }

" LaTeX
Plug 'donRaphaco/neotex', { 'for': 'tex' }

call plug#end()

" coc config
let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-json',
	\ 'coc-rls',
	\ 'coc-python',
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

" Markdown-preview config (github.com/iamcco/markdown-preview.nvim)
" enables nvim to open preview window
let g:mkdp_auto_start = 1

" Browser to start preview in
let g:mkdp_browser = 'firefox'

" Show preview URL after starting
let g:mkdp_echo_preview_url = 1

" LaTeX preview
let g:text_flavor = 'latex'
let g:neotex_delay = 500

set nocompatible

syntax enable
filetype plugin on

set clipboard+=unnamedplus

set number

set tabstop=4
set shiftwidth=4

set listchars=tab:->,trail:~,extends:>,precedes:<,space:.
noremap <F5> :set list!<CR>
"===============================================
" Terminal Mode
"===============================================

tnoremap <Esc> <C-\><C-n>


"===============================================
" Splitting and Tabs
"===============================================

set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes a bit more friendly
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"=============================================
" File Explorer
"=============================================

" Make netrw behave like NERDTree
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
