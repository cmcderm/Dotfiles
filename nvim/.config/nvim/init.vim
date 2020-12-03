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

set splitbelow splitright

" Make netrw behave like NERDTree
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
