set tabstop=4
set shiftwidth=0
set expandtab

set updatetime=200
set number
set clipboard=unnamedplus
set hlsearch
set hidden
set matchpairs+=<:>
set colorcolumn=80
set wildmode=longest:full,full

let mapleader = "-"
let maplocalleader = "-"

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'lervag/vimtex'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-repeat'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'

call plug#end()

autocmd Filetype tex setlocal spell
colorscheme onedark

" airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

" NERD tree
let g:NERDTreeShowIgnoredStatus = 1
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>ut :UndotreeToggle<CR>

" markdown-preview
let g:mkdp_auto_close = 0

" vim-polyglot
let g:polyglot_disabled = ['latex']

" deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-rust
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/ossi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

autocmd FileType markdown nmap <buffer> <localleader>mv <Plug>MarkdownPreview

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <leader>l :bn<CR>
noremap <leader>h :bp<CR>


