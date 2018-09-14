"------------------------------------------------------------------------------
"  Description: Options setable by the Ada plugin
"	   $Id: ada_options.vim 887 2008-07-08 14:29:01Z krischik $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer:	Martin Krischik
"      $Author: krischik $
"	 $Date: 2008-07-08 16:29:01 +0200 (Di, 08 Jul 2008) $
"      Version: 4.6
"    $Revision: 887 $
"     $HeadURL: https://gnuada.svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/ada_options.vim $
"      History:	24.05.2006 MK Unified Headers
"		16.07.2006 MK Ada-Mode as vim-ball
"		02.10.2006 MK Folding for "gnat pretty"
"		15.10.2006 MK Bram's suggestion for runtime integration
"		05.11.2006 MK Bram suggested to save on spaces
"	 Usage: copy content into your .vimrc and change options to your
"		likeing.
"    Help Page: ft-ada-options
"------------------------------------------------------------------------------

echoerr 'It is suggested to copy the content of ada_options into .vimrc!'
finish " 1}}}

" Section: Ada options {{{1

   let   g:ada_abbrev		       = 1
   let   g:ada_default_compiler	       = 'gnat'
   let   g:ada_extended_tagging	       = 'list'
   let   g:ada_folding		       = 'i'
"  let   g:ada_folding		       = 'gibxp'
"  let   g:ada_folding		       = 'spftc'
   let   g:ada_rainbow_color	       = 1
   let   g:ada_space_errors	       = 1
   let   g:ada_standard_types	       = 1
   let   g:ada_with_gnat_project_files = 1
"  let	 g:ada_extended_completion     = 1
"  let   g:ada_line_errors	       = 1
"  let   g:ada_omni_with_keywords      = 1

   let   g:Tlist_Exit_OnlyWindow       = 1
   let   g:Tlist_File_Fold_Auto_Close  = 1
   let   g:Tlist_Sort_Type	       = "name"

   let   g:NERD_use_ada_with_spaces    = 1

   let   g:backup_directory	       = '.backups'
   let   g:backup_purge		       = 10

   let   g:mapleader		       = "<F12>"

   if &diff
       let   g:Tlist_Auto_Open	       = 0
   else
       let   g:Tlist_Auto_Open	       = 1
   endif

   filetype plugin indent on
   syntax enable

" }}}1

" Section: Vimball options {{{1
:set expandtab fileformat=unix encoding=utf-8
:.+2,.+13 MkVimball ada-4.6.1

ada_options.vim
autoload/ada.vim
autoload/adacomplete.vim
autoload/decada.vim
autoload/gnat.vim
compiler/decada.vim
compiler/gnat.vim
doc/ft_ada.txt
ftdetect/ada.vim
ftplugin/ada.vim
indent/ada.vim
syntax/ada.vim

" }}}1

" Section: Tar options {{{1

tar --create --bzip2	      \
   --file="ada-4.6.1.tar.bz2" \
   autoload/ada.vim	      \
   autoload/adacomplete.vim   \
   autoload/decada.vim	      \
   autoload/gnat.vim	      \
   compiler/decada.vim	      \
   compiler/gnat.vim	      \
   doc/ft_ada.txt	      \
   ftdetect/ada.vim	      \
   ftplugin/ada.vim	      \
   indent/ada.vim	      \
   syntax/ada.vim	      ;

" }}}1

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: textwidth=0 foldmethod=marker foldmethod=marker
