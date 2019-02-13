"------------------------------------------------------------------------------
"  Description: Vim Ada/GNAT compiler file
"     Language: Ada (GNAT)
"          $Id: gnat.vim 887 2008-07-08 14:29:01Z krischik $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer:	Martin Krischi <krischik@users.sourceforge.net>k
"		Ned Okie <nokie@radford.edu>
"      $Author: krischik $
"        $Date: 2008-07-08 16:29:01 +0200 (Di, 08 Jul 2008) $
"      Version: 4.6
"    $Revision: 887 $
"     $HeadURL: https://gnuada.svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/autoload/gnat.vim $
"      History: 24.05.2006 MK Unified Headers
"		16.07.2006 MK Ada-Mode as vim-ball
"		05.08.2006 MK Add session support
"               15.10.2006 MK Bram's suggestion for runtime integration
"               05.11.2006 MK Bram suggested not to use include protection for
"                             autoload
"		05.11.2006 MK Bram suggested to save on spaces
"		19.09.2007 NO use project file only when there is a project
"    Help Page: compiler-gnat
"------------------------------------------------------------------------------

if version < 700
    finish
endif

function gnat#Make () dict					     " {{{1
   let &l:makeprg	 = self.Get_Command('Make')
   let &l:errorformat = self.Error_Format
   wall
   make
endfunction gnat#Make						     " }}}1

function gnat#Pretty () dict					     " {{{1
   execute "!" . self.Get_Command('Pretty')
endfunction gnat#Make						     " }}}1

function gnat#Set_Project_File (...) dict			     " {{{1
   if a:0 > 0
      let self.Project_File = a:1

      if ! filereadable (self.Project_File)
	      let self.Project_File = findfile (
	    \ fnamemodify (self.Project_File, ':r'),
	    \ $ADA_PROJECT_PATH,
	    \ 1)
      endif
   elseif strlen (self.Project_File) > 0
      let self.Project_File = browse (0, 'GNAT Project File?', '', self.Project_File)
   elseif expand ("%:e") == 'gpr'
      let self.Project_File = browse (0, 'GNAT Project File?', '', expand ("%:e"))
   else
      let self.Project_File = browse (0, 'GNAT Project File?', '', 'default.gpr')
   endif

   if strlen (self.Project_File) > 0
      let g:syntastic_ada_compiler_options = "-P " . self.Project_File
      let self.Make_Command = '"gnatmake -P " . self.Project_File . "  -F -gnatef"'
      let self.Pretty_Command = '"gnatpp -P " . self.Project_File'
      let &l:makeprg  = "gnatmake -P " . self.Project_File . "  -F -gnatef"
      if exists("g:ada_create_session")
	 call ada#Switch_Session(self.Project_File . '.vim')
      endif
   endif

endfunction gnat#Set_Project_File				     " }}}1

function gnat#Get_Command (Command) dict			     " {{{1
   let l:Command = eval ('self.' . a:Command . '_Command')
   return eval (l:Command)
endfunction gnat#Get_Command					     " }}}1

function gnat#Set_Session (...) dict				     " {{{1
   if argc() == 1 && fnamemodify (argv(0), ':e') == 'gpr'
      call self.Set_Project_File (argv(0))
   elseif  strlen (v:servername) > 0
      call self.Set_Project_File (v:servername . '.gpr')
   endif
endfunction gnat#Set_Session					     " }}}1

function gnat#New ()						     " {{{1
   let l:Retval = {
      \ 'Make'	      : function ('gnat#Make'),
      \ 'Pretty'	      : function ('gnat#Pretty'),
      \ 'Set_Project_File' : function ('gnat#Set_Project_File'),
      \ 'Set_Session'      : function ('gnat#Set_Session'),
      \ 'Get_Command'      : function ('gnat#Get_Command'),
      \ 'Project_File'     : '',
      \ 'Make_Command'     : '"gnatmake -F -gnatef " . expand("%:p")',
      \ 'Pretty_Command'   : '"gnatpp " . expand("%:p")' ,
      \ 'Error_Format'     : '%f:%l:%c: %trror: %m,'   .
			   \ '%f:%l:%c: %tarning: %m,' .
			   \ '%f:%l:%c: (%ttyle) %m'}

   return l:Retval
endfunction gnat#New						  " }}}1

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006  Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=0 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
