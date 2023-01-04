set tabstop=4
set shiftwidth=4

filetype plugin indent on

call plug#begin()
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()