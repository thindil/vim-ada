filetype plugin indent on
syntax enable
set autoread
set spelllang=en
set tabstop=3
set shiftwidth=3
set expandtab
set smarttab
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set ruler
set mouse=a
set mousehide
set autoindent
set smartindent
set wrap
set nocp
set browsedir=buffer
set directory=~/tmp,/var/tmp,/tmp
set encoding=utf-8
set laststatus=2
set noshowmode
set tags=./tags;/
set grepprg=grep\ -nre
set updatetime=100
let g:gitgutter_signs = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:rainbow_active = 1
let g:syntastic_ada_compiler = "gnatmake"
let g:synstatic_enable_signs = 0
let g:syntastic_enable_balloons = 0
set background=dark
colorscheme PaperColor
if has("gui_running")
   set guioptions=aegimLt
   set guiheadroom=0
   nnoremap <F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif
