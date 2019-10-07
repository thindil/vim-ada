" Bundle of plugins to change Vim/NeoVim into IDE
" Maintainer: Bartek Jasicki <thindil@laeran.pl>
" Last Change:  2019-10-07
" License: GPLv3

if exists('g:vimada')
   finish
endif
let g:vimada = 1

" ****f* vim-ada/remove_local_changes
" FUNCTION
" Remove local changes to selected plugin
" PARAMETERS
" force      - If true, remove file with changes too
" pluginname - Name of plugin to revert changes
" SOURCE
function s:remove_local_changes(force, pluginname)
" ****
   silent exec "!cd " . glob(g:plug_path) . "/" . a:pluginname " && git checkout ."
   if a:force
      silent exec "!rm " . glob(g:plug_path) . "/vim-ada/patches/"
         \ . a:pluginname . ".diff"
   endif
endfunction

" ****f* vim-ada/append_local_changes
" FUNCTION
" Append local changes to selected plugin
" PARAMETERS
" pluginname - Name of plugin to append local changes
" SOURCE
function s:append_local_changes(pluginname)
" ****
  silent exec "!cd " . glob(g:plug_path) . "/" . a:pluginname " && git checkout ."
  silent exec "!cd " . glob(g:plug_path) . "/" . a:pluginname " && git apply "
      \ . glob(g:plug_path) . "/vim-ada/patches/" . a:pluginname . ".diff"
endfunction

command! -nargs=* -bang RemoveLocalChanges call s:remove_local_changes(<bang>0, <f-args>)
command! -nargs=1 AppendLocalChanges call s:append_local_changes(<f-args>)
