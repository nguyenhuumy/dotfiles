call plug#begin()
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

let mapleader = ","

"clipboard
set clipboard=unnamed

" Indentation {{{
" " ====================================================================
set expandtab     " replace <Tab with spaces
set tabstop=4 " number of spaces that a <Tab> in the file counts for
set softtabstop=4 " remove <Tab> symbols as it was spaces
set shiftwidth=4  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
set number

" theme settings
set termguicolors
syntax on
autocmd vimenter * colorscheme gruvbox

" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>t :GFiles<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

" coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <plug>(coc-format-selected)
nmap <leader>f  <plug>(coc-format-selected)
" Format file
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" NERDTree show current file
map <leader>r :NERDTreeFind<cr>
