" Ada 2012 specification for Vim
" Maintainer: Bartek Jasicki <thindil@laeran.pl>
" Last Change:  2018-03-26
" License: GPLv3
if exists('g:adaspec')
   finish
endif
let g:adaspec = 1
let s:plugindir = expand('<sfile>:p:h:h')

function AdaGrep(searchpattern)
   let v:errmsg = ""
   silent! execute "vimgrep '".a:searchpattern."' ".s:plugindir."/doc/rm-toc.txt"
   if v:errmsg != ""
      let v:errmsg = ""
      silent! execute "vimgrep '".a:searchpattern."' ".s:plugindir."/doc/rm-idx.txt"
   endif
   if v:errmsg != ""
      execute "vimgrep '".a:searchpattern."' ".s:plugindir."/doc/*.txt"
   endif
endfunction AdaGrep

command! -nargs=1 Adasearch call AdaGrep(<f-args>)
