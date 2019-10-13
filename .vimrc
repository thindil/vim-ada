" --------------------------------
" General Vim/NeoVim configuration
" --------------------------------
" Enable plugins and indentation
filetype plugin indent on
" Turn on file syntax
syntax enable
" Auto read file from disk if it was changed somewhere outside editor
set autoread
" Set default dictionary for spellchecker as English
set spelllang=en
" Number of spaces that Tab in the file counts for
set tabstop=3
" Number of spaces used for each stem of (auto)indent
set shiftwidth=3
" Use spaces instead Tab
set expandtab
" Insert blanks according to earlier Tab settings
set smarttab
" Show command line
set showcmd
" Update search pattern matches when typing
set incsearch
" Highlight all matches for search pattern
set hlsearch
" Ignore case in search patterns
set ignorecase
" Override 'ignorecase' option if search pattern contains upper case characters
set smartcase
" Show line and column number
set ruler
" Enable mouse in any mode (text, GUI)
set mouse=a
" Hide mouse pointer when typing
set mousehide
" Copy indent from current line to new line
set autoindent
" Do smart autoindenting when starting new line
set smartindent
" Wrap lines longer than screen width
set wrap
" No compatibility with vi
set nocp
" Use directory related to buffer for file browser
set browsedir=buffer
" Directories where swap file will be placed
set directory=~/tmp,/var/tmp,/tmp
" Default character encoding for new files
set encoding=utf-8
" Always show status line (for airline)
set laststatus=2
" Don't show mode in last line
set noshowmode
" Where to search for tags file (from current directory up)
set tags=./tags;/
" Show line number, go recursive and use regular expressions for :grep command
set grepprg=grep\ -nre
" Amount of millisecs between saves of swap file to disk. Needed for some
" plugins
set updatetime=100
" Highlight line with cursor
set cursorline
" Set fold level. All higher level fold that this will be closed.
set foldlevel=99

" ------------------------------------
" General Vim-Ada bundle configuration
" ------------------------------------
" This lines are required to run whole bundle.
"
" Installation part. You can delete it after installing all plugins, except
" setting for g:plug_path.
" Set paths for Vim
if !has("nvim")
   let s:plug_file = '~/.vim/autoload/plug.vim'
   let g:plug_path = '~/.vim/plugged'
" Set paths for NeoVim
else
   let s:plug_file = '~/.local/share/nvim/site/autoload/plug.vim'
   let g:plug_path = '~/.local/share/nvim/plugged'
endif
" Install vim-ada and after it, all others plugins
if empty(glob(s:plug_file))
      silent exe "!curl -fLo " . s:plug_file . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
      autocmd VimEnter * PlugInstall vim-ada --sync
endif
" End of installation part of Vim-Ada.

" ****f* .vimrc/UpdatePlug
" FUNCTION
" Update selected plugin with local changes after installation or upgrade
" SOURCE
function! UpdatePlug(info)
   if a:info.status != "unchanged" || a:info.force
     silent exe "!git apply " . glob(g:plug_path . '/vim-ada/patches/' . a:info.name . ".diff")
   endif
endfunction

" ****f* .vimrc/UpdateAllPlugs
" FUNCTION
" Update all plugins if needed after update vim-ada
" SOURCE
function! UpdateAllPlugs(info)
   if a:info.status != "unchanged"
      PlugInstall! --sync
      silent! source $MYVIMRC
   endif
endfunction

" Set auto-completion to Ale
let g:ale_completion_enabled = 1

" Start Plug
call plug#begin(g:plug_path)
" Vim-ada plugin
Plug 'thindil/vim-ada', { 'do':  function('UpdateAllPlugs')}
" A.vim plugin
Plug 'thindil/a.vim'
" Ada-Bundle plugin
Plug 'thindil/Ada-Bundle'
" Vim-XML plugin
Plug 'thindil/vim-xml'
" Airline plugin
Plug 'vim-airline/vim-airline'
" Anyfold plugin
Plug 'pseewald/vim-anyfold'
" Auto-pairs plugin
Plug 'jiangmiao/auto-pairs'
" Fugitive plugin
Plug 'tpope/vim-fugitive'
" Gitgutter plugin
Plug 'airblade/vim-gitgutter'
" Gutentags plugin
Plug 'ludovicchabant/vim-gutentags'
" indentLine plugin
Plug 'Yggdroot/indentLine'
" MWUTils plugin, needed by Snipmate
Plug 'marcweber/vim-addon-mw-utils'
" Nerdtree plugin
Plug 'scrooloose/nerdtree'
" RainbowParenthesisImproved plugin
Plug 'luochen1990/rainbow'
" Robovim plugin
Plug 'thindil/robovim'
" Snipmate plugin
Plug 'garbas/vim-snipmate'
" Snippets plugin, needed by Snipmate
Plug 'honza/vim-snippets'
" Startify plugin
Plug 'mhinz/vim-startify'
" Vista plugin
Plug 'liuchengxu/vista.vim'
" Tlib plugin, needed by Snipmate
Plug 'tomtom/tlib_vim'
" Zeavim plugin
Plug 'KabbAmine/zeavim.vim'
" Papercolor theme
Plug 'NLKNguyen/papercolor-theme'
" Vim-header plugin with local changes
Plug 'alpertuna/vim-header', { 'do': function('UpdatePlug') }
" Ale plugin with local changes
Plug 'dense-analysis/ale', { 'do': function('UpdatePlug') }
" Gruvbox theme with local changes
Plug 'morhetz/gruvbox', { 'do': function('UpdatePlug') }
" End of Plug configuration
call plug#end()

" Don't go further if plugins are not installed. You can delete this lines
" after installation.
if empty(glob(s:plug_path . '/vim-ada'))
   finish
endif

" --------------------------------------------
" General configurations for installed plugins
" --------------------------------------------
" Disable gitgutter signs
let g:gitgutter_signs = 0
" Use special patched fonts
let g:airline_powerline_fonts = 1
" Show list of buffers
let g:airline#extensions#tabline#enabled = 1
" Set buffer list formatter for airline
let g:airline#extensions#tabline#formatter = "unique_tail"
" Show number of buffer in buffers list
let g:airline#extensions#tabline#buffer_nr_show = 1
" Enable colouring brackets
let g:rainbow_active = 1
" Block ale checking files on text changed (in fly)
let g:ale_lint_on_text_changed = 0
" Block ale checking files on quit Insert mode
let g:ale_lint_on_insert_leave = 0
" Block ale checking files on load file
let g:ale_lint_on_enter = 0
" Set full path to your ada_language_server command for ale
let g:ale_ada_lsp_executable = "ada_language_server"
" Enable gnatmake and adalsp as linters for Ada
let g:ale_linters = {
\   'ada': ['gnatmake', "adalsp"],
\}
" Enable gnatpp for ALEFix
let g:ale_fixers = {
\   'ada': ['gnatpp'],
\}
" Use default theme color for showing indent level
let g:indentLine_setColors = 0
" Add syntax support for GNAT project files
let g:ada_with_gnat_project_files = 1
" Add highlighting for GNAT extensions (attributes, pragmas, etc)
let g:ada_gnat_extensions = 1
" Name used in files headers
let g:header_field_author = 'Your name'
" Email address used in files headers
let g:header_field_author_email = 'your@email.org'
" Disable auto adding headers to new or edited files
let g:header_auto_add_header = 0
" Map some file types to search in specific docsets:
" 1. Search in Vim docset if file type is help
" 2. Search in Ada specification docset if file type is ada
let g:zv_file_types = {
   \   'help' : 'vim',
   \   'ada'  : 'ada',
   \ }
" Generate tags files with additional field language. Additionally, don't
" generate tags for Ada code
let g:gutentags_ctags_extra_args = ['--fields=+l', '--exclude=*.adb', '--exclude=*.ads']
" Don't generate tags when opening Ada files
let g:gutentags_exclude_filetypes = ['ada']
"" Set default vista executive to ale for Ada
let g:vista_executive_for = {
  \ 'ada': 'ale',
  \ }

" ------------------------------
" GVim specific settings
" ------------------------------
if has("gui_running")
   " Show only menu, hide buttons, etc
   set guioptions=aegimLt
   " Hide menu with F11 key
   nnoremap <F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif

" --------------------------------
" NeoVim specific settings
" --------------------------------
if has("nvim")
   " By default, use standard clipboard
   set clipboard+=unnamedplus
   " Go to last visited line in file on load file to NeoVim
   :au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif
endif

" ---------------------------------
" General setting for color schemes
" ---------------------------------
" Set dark background
set background=dark
" Set color scheme
colorscheme PaperColor

" ---------------------
" Commands abbrevations
" ---------------------
" Abbreviation for open/close NERDTree
cnoreabbrev nt NERDTreeToggle
" Abbreviation for open/close Vista
cnoreabbrev tb Vista!!
" No more unknown command during saving files
cnoreabbrev W w
