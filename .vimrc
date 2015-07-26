set nocompatible
syntax enable
colorscheme molokai

"Get rid of tabs, they're the devils work
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

"set title to show in console title bar
set title
"Do not keep a backup file!
set nobackup

set cindent

set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

set nu

set ruler     
set showcmd 

if &term=="xterm"
	set t_Co=8
	set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif

nmap <F12> :NERDTree  <CR>

" autocmd VimEnter * NERDTree 
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

nmap <F4> :Tlist <CR>

let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

set hlsearch
set nobackup
set nowb
set noswapfile

set magic

set hid
set incsearch
set ignorecase
set smartcase

set mouse=a

source $VIMRUNTIME/mswin.vim
behave mswin

execute pathogen#infect()

:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
:nmap j gj
:nmap k gk
:nmap \q :nohlsearch<CR>
:nmap <C-e> :e#<CR>

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

let g:vim_markdown_folding_disabled=1
set clipboard=unnamed

set listchars=tab:»■,trail:■
set list

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Disable the arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"Move Between Splits Easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Open new split panes to right and bottom
set splitbelow
set splitright

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
