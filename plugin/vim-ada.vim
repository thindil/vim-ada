" Bundle of plugins to change Vim/NeoVim into IDE
" Maintainer: Bartek Jasicki <thindil@laeran.pl>
" Last Change:  2019-08-01
" License: GPLv3

if exists('g:vimada')
   finish
endif
let g:vimada = 1

fun s:remove_local_changes(force, pluginname)
   silent exec "!cd " . glob(g:plug_path) . "/" . a:pluginname " && git checkout ."
   if a:force
      silent exec "!rm " . glob(g:plug_path) . "/vim-ada/patches/" . a:pluginname . ".diff"
   endif
endfun

command! -nargs=* -bang RemoveLocalChanges call s:remove_local_changes(<bang>0, <f-args>)
