autocmd ColorScheme * highlight Search ctermbg=DarkCyan ctermfg=LightGray
colorscheme slate
syntax enable

set tabstop=3
set shiftwidth=3
set expandtab

set ignorecase
set smartcase

set incsearch
set hlsearch

set nu

if has('persistent_undo')
   set undofile
   set undodir=$HOME/.vim/undo
endif
