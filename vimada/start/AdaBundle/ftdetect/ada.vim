"------------------------------------------------------------------------------
"  Description: Vim Ada detection file
"     Language: Ada (2005)
"	   $Id: ada.vim 887 2008-07-08 14:29:01Z krischik $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer: Martin Krischik <krischik@users.sourceforge.net>
"      $Author: krischik $
"	 $Date: 2008-07-08 16:29:01 +0200 (Di, 08 Jul 2008) $
"      Version: 4.6
"    $Revision: 887 $
"     $HeadURL: https://gnuada.svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/ftdetect/ada.vim $
"      History: 24.05.2006 MK Unified Headers
"		16.07.2006 MK Ada-Mode as vim-ball
"		15.10.2006 MK Bram's suggestion for runtime integration
"		05.11.2006 MK Bram suggested to save on spaces
"    Help Page: ft-ada-plugin
"------------------------------------------------------------------------------

if exists("s:loaded_ftdetect_ada")
    finish
endif

let s:loaded_ftdetect_ada=45

if has("vms")
   autocmd BufNewFile,BufRead *.gpr,*.ada_m,*.adc setfiletype ada
else
   autocmd BufNewFile,BufRead *.gpr setfiletype ada
endif

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
