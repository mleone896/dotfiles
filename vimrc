source ~/.vim_bundles

filetype plugin indent on
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
set autoindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Auto reload conf
autocmd! bufwritepost .vimrc source %

colo solarized

" quick save
let mapleader = ","
noremap <Leader>s :w<CR>
noremap <Leader>q :quit<CR>


"soloarized shit -- not using it right now back to molokai
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans =  1
let g:solarized_termcolors=16


"set navigation for splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-E> <C-W>=
map <C-B> <C-W><bar>

" Paste shortcuts
map <C-G> :set paste norelativenumber <Return>
map <C-N> :set nopaste relativenumber<Return>

" quickly open a new tab
nnoremap <C-t>     :tabnew<CR>

" run tests !!
nnoremap g<CR> :Dispatch<CR>
augroup Ruby
  autocmd!
  autocmd FileType Ruby let b:dispatch='rspec %'
augroup END


" navigation (from http://statico.github.com/vim.html)
" go up and down one row, not one line (useful for wrapped lines)
:nmap j gj
:nmap k gk

" tab next/prev with shift h and shift l
nnoremap <S-h> gT
nnoremap <S-l> gt

" jump between last opened buffer with Ctrl+E (:b# and :e# do same thing)
:nmap <C-e> :e#<CR>


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
autocmd BufNewFile,BufRead *_foo.rb set syntax=rspec


" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/



" start Airline
set laststatus=2
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" Go syntax 
au FileType go nmap <Leader>i <Plug>(go-info)
let g:go_disable_autoinstall = 1


" ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <Leader>n :lnext <CR>
noremap <Leader>p :lprev <CR>
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

" Projectionist
let g:projectionist_heuristics = {
      \    "manifests/*.pp": {
      \     "type": "spec",
      \     "alternate": "spec/*/{}.rb"
      \   },
      \    "spec/*_spec.rb": {
      \     "type": "spec",
      \     "alternate": "spec/defines/{}.rb"
      \   }
      \ }


" highlight the current line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

function! BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function! BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction

" set the 80 coloumn line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" center after motion
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" quick pairs
imap <Leader>' ''<ESC>i
imap <Leader>" ""<ESC>i
imap <Leader>( ()<ESC>i
imap <Leader>[ []<ESC>i
imap <Leader>{ {}<ESC>i

no <DOWN> ddp
no <UP> ddkP

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
