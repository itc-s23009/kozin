set nu
set hlsearch
set incsearch
set smartcase
set autoindent
filetype plugin indent on
set showcmd
set ruler
set ts=2
set wrap
set ignorecase
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=[ENC=%{&fileencoding}]
set statusline+=[LOW=%l/%L]
set laststatus=2
set mouse=
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-u> <Up>
inoremap <C-d> <Down>
nnoremap <C-o> o<Esc>
inoremap <C-o> <Esc>o
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'windwp/nvim-autopairs'
call plug#end()

lua << EOF
require'nvim-autopairs'.setup{}
EOF

nmap <silent> <space><space> :<C-u>CocList<cr>
nmap <silent> <space>h :call CocActionAsync('doHover')<cr>
nmap <silent> <space>df <Plug>(coc-definition)
nmap <silent> <space>rf <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>fmt <Plug>(coc-format)

" スニペット関連のキーマッピング
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x <Plug>(coc-convert-snippet)

" <Tab>キーの設定
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-Space> coc#refresh()

" coc.nvimのグローバル拡張機能の設定
let g:coc_global_extensions = ['coc-java', 'coc-snippets']

" CheckBackspace関数の定義
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.java :call CocAction('format')

inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
set completeopt=menuone,noinsert

