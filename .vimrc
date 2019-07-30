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
set grepprg=grep\ -nre                                      " Show line number, go recursive and use regular expressions for :grep command
set updatetime=100                                          " Amount of millisecs between saves of swap file to disk. Needed for some plugins
set cursorline                                              " Highlight line with cursor
" This lines are required to run whole bundle. They will install (if needed) Plug
" and all required plugins
if !has("nvim")                                             " Install Plug for Vim
   if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall vim-ada --sync |PlugInstall --sync | source $MYVIMRC
   endif
   let s:plug_path = '~/.vim/plugged'                       " Set Plug path for Vim
   call plug#begin(s:plug_path)                             " Start Plug for Vim
else                                                        " Install Plug for NeoVim
   if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/.share/nvim/site/plug.vim --create-dirs
               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall vim-ada --sync |PlugInstall --sync | source $MYVIMRC
   endif
   let s:plug_path = '~/.local/share/nvim/plugged'          " Set Plug path for neovim
   call plug#begin(s:plug_path)                             " Start Plug for NeoVim
endif
function! UpdatePlug(info)
   if a:info.status != "unchanged" || a:info.force
     silent exe "!git apply " . glob(s:plug_path . '/vim-ada/patches/' . a:info.name . ".diff")
   endif
endfunction
Plug 'thindil/a.vim'                                        " A.vim plugin
Plug 'thindil/Ada-Bundle'                                   " Ada-Bundle plugin
Plug 'thindil/vim-xml'                                      " Vim-XML plugin
Plug 'vim-airline/vim-airline'                              " Airline plugin
Plug 'pseewald/vim-anyfold'                                 " Anyfold plugin
Plug 'jiangmiao/auto-pairs'                                 " Auto-pairs plugin
Plug 'tpope/vim-fugitive'                                   " Fugitive plugin
Plug 'airblade/vim-gitgutter'                               " Gitgutter plugin
Plug 'ludovicchabant/vim-gutentags'                         " Gutentags plugin
Plug 'Yggdroot/indentLine'                                  " indentLine plugin
Plug 'marcweber/vim-addon-mw-utils'                         " MWUTils plugin, needed by Snipmate
Plug 'scrooloose/nerdtree'                                  " Nerdtree plugin
Plug 'luochen1990/rainbow'                                  " RainbowParenthesisImproved plugin
Plug 'thindil/robovim'                                      " Robovim plugin
Plug 'garbas/vim-snipmate'                                  " Snipmate plugin
Plug 'honza/vim-snippets'                                   " Snippets plugin, needed by Snipmate
Plug 'mhinz/vim-startify'                                   " Startify plugin
Plug 'majutsushi/tagbar'                                    " Tagbar plugin
Plug 'tomtom/tlib_vim'                                      " Tlib plugin, needed by Snipmate
Plug 'KabbAmine/zeavim.vim'                                 " Zeavim plugin
Plug 'NLKNguyen/papercolor-theme'                           " Papercolor theme
Plug 'alpertuna/vim-header', { 'do': function('UpdatePlug') } " Vim-header theme with local changes
Plug 'vim-syntastic/syntastic', { 'do': function('UpdatePlug') } " Syntastic theme with local changes
Plug 'morhetz/gruvbox', { 'do': function('UpdatePlug') }    " Gruvbox theme with local changes
call plug#end()                                             " End of Plug configuration
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
let g:ada_with_gnat_project_files = 1                       " Add syntax support for GNAT project files
let g:ada_gnat_extensions = 1                               " Add highlighting for GNAT extensions (attributes, pragmas, etc)
let g:header_field_author = 'Your name'                     " Name used in files headers
let g:header_field_author_email = 'your@email.org'          " Email address used in files headers
let g:header_auto_add_header = 0                            " Disable auto adding headers to new or edited files
let g:zv_file_types = {                                     " Map some file types to search in specific docsets
   \   'help' : 'vim',                                      " Search in Vim docset if file type is help
   \   'ada'  : 'ada',                                      " Search in Ada specification docset if file type is ada
   \ }
let g:gutentags_ctags_extra_args = ['--fields=+l']          " Generate tags files with additional field language. Can boost loading Ada tags
if has("gui_running")                                       " GUI specific settings
   set guioptions=aegimLt                                   " Show only menu, hide buttons, etc
   nnoremap <F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif
if has("nvim")                                              " Neovim specific settings
   set clipboard+=unnamedplus                               " By default, use standard clipboard
   :au BufReadPost *                                        " Go to last visited line in file
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif
endif
set background=dark                                         " Set dark background
colorscheme PaperColor                                      " Set color scheme
" Abbreviation for open/close NERDTree
cnoreabbrev nt NERDTreeToggle
" Abbreviation for open/close TagBar
cnoreabbrev tb TagbarToggle
" No more unknown command during saving files
cnoreabbrev W w
