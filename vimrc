" -file setup
syntax on
set ignorecase
set relativenumber
set mouse=
set hlsearch
set background=dark
set incsearch
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
" tab stuff
set autoindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" auto start nerdTree when vim starts
"autocmd vimenter * NERDTree
" remap a nerdtree toggel
map <C-d> :NERDTreeToggle<CR>
" close nerdtree if its the only tab left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


execute pathogen#infect()




filetype plugin indent on
" Auto reload conf
autocmd! bufwritepost .vimrc source %

" quick save
let mapleader = ","
noremap <Leader>s :update<CR>

" becuase you know have to make sure you're using that 256
set t_Co=256

"soloarized shit -- not using it right now back to molokai
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans =  1
"let g:solarized_termcolors=256
"let g:solarized_termcolors = &t_Co

"set molokai to use 256 colour
let g:rehash256 = 1
colo molokai

"set navigation for splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-E> <C-W>=
map <C-B> <C-W><bar>
map <C-G> :set paste norelativenumber <Return>
map <C-N> :set nopaste relativenumber<Return>
nnoremap <C-t>     :tabnew<CR>

" navigation (from http://statico.github.com/vim.html)
" go up and down one row, not one line (useful for wrapped lines)
:nmap j gj
:nmap k gk

" tab next/prev with shift h and shift l
nnoremap <S-h> gT
nnoremap <S-l> gt

" jump between last opened buffer with Ctrl+E (:b# and :e# do same thing)
:nmap <C-e> :e#<CR>

" title setting
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

" assorted automatic syntax loading. filetype -> syntax
au BufRead *.md set filetype=markdown
au BufRead *.scala set filetype=scala
au BufRead *.pp set filetype=puppet 
au BufRead *.rb set filetype=ruby 
au BufRead *.go set filetype=go 
au BufRead *.sh set filetype=sh
au BufRead *.haml set filetype=haml
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 autoindent
autocmd Filetype puppet  setlocal ts=2 sts=2 sw=2 autoindent 
autocmd Filetype sh setlocal ts=4 sts=4 sw=4 autoindent 
autocmd Filetype go setlocal ts=4 sts=4 sw=4 autoindent 



" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

" i forget why I need this
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif

if &term == "screen" || &term == "xterm" || &term == "xterm-color" || &term == "xterm-256color"
  set title
endif

" start Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



" Go syntax stuff
au FileType go nmap <Leader>i <Plug>(go-info)
let g:go_disable_autoinstall = 1

" tmuxvimline

" ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <Leader>n :lnext <CR>
noremap <Leader>p :lprev <CR>
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function! BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function! BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif
"
"syntastic
let g:syntastic_always_populate_loc_list = 1

