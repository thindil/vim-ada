filetype plugin indent on                                   " Enable plugins and indentation
syntax enable                                               " Turn on file syntax
set autoread                                                " Auto read file from disk if it was changed somewhere outside editor
set spelllang=en                                            " Set default dictionary for spellchecker as English
set tabstop=3                                               " Number of spaces that Tab in the file counts for
set shiftwidth=3                                            " Number of spaces used for each stem of (auto)indent
set expandtab                                               " Use spaces instead Tab
set smarttab                                                " Insert blanks according to earlier Tab settings
set showcmd                                                 " Show command line
set incsearch                                               " Update search pattern matches when typing
set hlsearch                                                " Highlight all matches for search pattern
set ignorecase                                              " Ignore case in search patterns
set smartcase                                               " Override 'ignorecase' option if search pattern contains upper case characters
set ruler                                                   " Show line and column number
set mouse=a                                                 " Enable mouse in any mode (text, GUI)
set mousehide                                               " Hide mouse pointer when typing
set autoindent                                              " Copy indent from current line to new line
set smartindent                                             " Do smart autoindenting when starting new line
set wrap                                                    " Wrap lines longer than screen width
set nocp                                                    " No compatibility with vi
set browsedir=buffer                                        " Use directory related to buffer for file browser
set directory=~/tmp,/var/tmp,/tmp                           " Directories where swap file will be placed
set encoding=utf-8                                          " Default character encoding for new files
set laststatus=2                                            " Always show status line (for airline)
set noshowmode                                              " Don't show mode in last line
set tags=./tags;/                                           " Where to search for tags file (from current directory up)
set grepprg=grep\ -nre                                      " Show line number for standard :grep command
set updatetime=100                                          " Amount of millisecs between saves of swap file to disk. Needed for some plugins
set cursorline                                              " Highlight line with cursor
let g:gitgutter_signs = 0                                   " Disable gitgutter signs
let g:airline_powerline_fonts = 1                           " Use special patched fonts
let g:airline#extensions#tabline#enabled = 1                " Show list of buffers
let g:airline#extensions#tabline#formatter = "unique_tail"  " Set buffer list formatter for airline
let g:airline#extensions#tabline#buffer_nr_show = 1         " Show number of buffer in buffers list
let g:rainbow_active = 1                                    " Enable colouring brackets
let g:syntastic_ada_compiler = "gnatmake"                   " Set syntastic checker
let g:syntastic_enable_signs = 0                            " Disable syntastic signs
let g:syntastic_enable_balloons = 0                         " Disable syntastic error balloons
let g:syntastic_always_populate_loc_list = 1                " Always update errors list
let g:indentLine_setColors = 0                              " Use default theme color for showing indent level
set background=dark                                         " Set dark background
colorscheme PaperColor                                      " Set color scheme
if has("gui_running")                                       " GUI specific settings
   set guioptions=aegimLt                                   " Show only menu, hide buttons, etc
   nnoremap <F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif
