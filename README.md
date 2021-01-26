## General Information

Vim-Ada is ready to deploy set of plugins and settings which helps write
programs in various programming languages. As name of bundle says, it is
focused mainly on the Ada programming language, but it has support for
other programming languages too. See "Installation" section for detailed
instructions how to install it and "Plugins" section for information
about included plugins and changes (if any) to them. If you need more
plugins, you can visit [Vim Awesome](https://vimawesome.com/) or the
project wiki [Recommended plugins](https://github.com/thindil/vim-ada/wiki/Recommended-plugins)
page.

All changes to plugins are under the respective plugin license which can be
found in plugins directory. If the plugin don't have license info included,
then all my changes are in public domain.

If you are new to Vim and you want to have more user-friendly experience with
this editor, I recommend to use [SpaceVim](https://spacevim.org/). Main
differences between vim-ada and SpaceVim:

* Design in **Keep It Simple Stupid** principle: Vim-ada is just a bundle of
  plugins which can be easily added, removed or locally edited to suit your
  needs.
* No changes to core systems of Vim: All keyboard shortcuts are that same,
  thus, Vim-ada require less learning for experienced Vim/NeoVim users.
* Easy to deploy: just download the configuration file and replace your
  config, rest will be done after first start of Vim/NeoVim.
* Much younger, less polished than SpaceVim.

**Important:** This version of README.md is about current version of Vim-Ada.
Earlier versions of Vim-Ada may have different requirements or contents.
Please read README.md included in the release to get information about other
releases.

## Screenshots

![Papercolor - dark background](screens/dark.png)

![Papercolor - light background with opened vista and nerdtree](screens/light.png)

## Installation

Set included `.vimrc` file as your configuration file (or
source it from your configuration file). Since version 8.0 of vim-ada it is
required, because all plugins are managed by Plug plugin which must be
installed first. For upgrade, use Plug commands.

### Additional steps

To enable all options, you have been need to install:

* Universal Ctags from https://ctags.io for generating *tags* files needed for
  Vim auto-completion.
* Ada Language Server from https://github.com/AdaCore/ada_language_server for
  full support of the code completion, tags list, etc. for Ada language.
* Other dependency is Zeal from https://zealdocs.org/. Additionally, for Ada
  documentation, you will be needed to download Ada specification docset. You
  can do this in two ways:

    a) Download Docset Feed from https://zealusercontributions.now.sh/
    (recommended way). There you will find detailed information how to install
    docset.

    b) Build it alone: look at https://github.com/thindil/ada-docset for
    instructions and code needed to build Ada docset.

* Optional, but highly recommended: ROBODoc from https://rfsber.home.xs4all.nl/Robo/
  for generating a code documentation. For generating a documentation from Ada
  code, you may need the file *robodocada.rc* from https://github.com/thindil/roboada
* Optional: If you want to use Grammarous plugin you will download the
  LanguageTool (website: https://languagetool.org) program at the first run of
  plugin. This program requires Java 8+ to work.

## Plugins

### A.vim

Webpage: https://github.com/thindil/a.vim

Allow fast switch between spec (.ads) and body (.adb) files (works with C,
C++ headers files too). This plugin wasn't modified.

### AdaBundle

Webpage: https://github.com/thindil/Ada-Bundle

This is modified version of standard Ada support for Vim/Neovim. This plugin
wasn't modified but have some custom configuration in `.vimrc` file.

### Airline

Webpage: https://github.com/vim-airline/vim-airline

Status bar and buffer list for Vim. This plugin wasn't modified but have some
custom configuration in `.vimrc` file.

### Ale

Webpage: https://github.com/dense-analysis/ale

ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking
and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your text files,
and acts as a Vim Language Server Protocol client. This plugin has added
Ada support for gnatmake for support for GNAT Project files (.gpr). Gnatmake
linter can be used only on save file. Thus, it is recommended to use custom
configuration from `.vimrc` file.

### AnyFold

Webpage: https://github.com/pseewald/vim-anyfold

Generic folding mechanism and motion based on indentation. Fold anything that
is structured into indented blocks. Quickly navigate between blocks. This plugin
wasn't modified but have some custom configuration in `.vimrc` file.

### Auto-pairs

Webpage: https://github.com/jiangmiao/auto-pairs

Insert or delete brackets, quotes in pair. This plugin wasn't modified.

### Grammarous

Webpage: https://github.com/rhysd/vim-grammarous

vim-grammarous is a powerful grammar checker for Vim. Simply do :GrammarousCheck
to see the powerful checking. This plugin automatically downloads LanguageTool,
which requires Java 8+. This plugin wasn't modified.

### GutenTags

Webpage: https://github.com/ludovicchabant/vim-gutentags

Gutentags is a plugin that takes care of the much-needed management of tags
files in Vim. It will (re)generate tag files as you work while staying
completely out of your way. It will even do its best to keep those tag files
out of your way too. It has no dependencies and just works. This plugin wasn't
modified but have some custom configuration in `.vimrc` file.

### Header

Webpage: https://github.com/alpertuna/vim-header

Easily adds brief author info and license headers. This plugin has added Ada
and Tcl support plus have some custom configuration in `.vimrc` file.

### IndentLine

Webpage: https://github.com/Yggdroot/indentLine

This plugin is used for displaying thin vertical lines at each indentation
level for code indented with spaces. This plugin wasn't modified but have some
custom configuration in `.vimrc` file.

### MW-Utils

Webpage: https://github.com/marcweber/vim-addon-mw-utils

vim: interpret a file by function and cache file automatically. This plugin
wasn't modified. This plugin is required for SnipMate plugin to work.

### NERDTree

Webpage: https://github.com/scrooloose/nerdtree

The NERDTree is a file system explorer for the Vim editor. Using this plugin,
users can visually browse complex directory hierarchies, quickly open files
for reading or editing, and perform basic file system operations. This plugin
can also be extended with custom mappings using a special API. This plugin
wasn't modified but have some custom configuration in `.vimrc` file.

### Plug

Webpage: https://github.com/junegunn/vim-plug

A minimalist Vim plugin manager. This wasn't modified. This plugin is
required to load other plugins included in bundle. Required configuration
of this plugin is in `.vimrc` file.

### Rainbow Parentheses Improved

Webpage: https://github.com/luochen1990/rainbow

Updated version of Rainbow Parenthesis. Help you read complex code by showing
diff level of parentheses in diff color. This plugin wasn't modified but have
some custom configuration in `.vimrc` file.

### Robovim

Webpage: https://github.com/thindil/robovim

Robovim is simple Vim plugin which allow easier add Robodoc formatted
documentation to source code. This plugin wasn't modified.

### Signify

Webpage: https://github.com/mhinz/vim-signify

Signify (or just Sy) uses the sign column to indicate added, modified and
removed lines in a file that is managed by a version control system (VCS).
This plugin wasn't modified but have some custom configuration in `.vimrc`
file.

### SnipMate

Webpage: https://github.com/garbas/vim-snipmate

SnipMate aims to provide support for textual snippets, similar to TextMate or
other Vim plugins like UltiSnips. This plugin wasn't modified.

### Snippets

Webpage: https://github.com/honza/vim-snippets

This repository contains snippets files for various programming languages.
It is community-maintained and many people have contributed snippet files and
other improvements already.

### Startify

Webpage: https://github.com/mhinz/vim-startify

This plugin provides a start screen for Vim. It provides dynamically created
headers or footers and uses configurable lists to show recently used or
bookmarked files and persistent sessions. All of this can be accessed in a
simple to use menu that even allows to open multiple entries at once. This
plugin wasn't modified.

### Tlib

Webpage: https://github.com/tomtom/tlib_vim

This library provides some utility functions. This plugin wasn't modified. This
plugin is required by SnipMate to work.

### Todo.txt

Webpage: https://github.com/dbeniamine/todo.txt-vim

Todo.txt-vim is a plugin to manage todo.txt files it was initially designed by
Freitass then forked and improved by David Beniamine. This plugin wasn't
modified.

### Vista

Webpage: https://github.com/liuchengxu/vista.vim

View and search LSP symbols, tags in Vim/NeoVim. This plugin wasn't modified
but have some custom configuration in `.vimrc` file.

### Xml

Webpage: https://github.com/thindil/vim-xml

This is just one line setting to enable spellchecking in XML files too.

### Zeavim

Webpage: https://github.com/KabbAmine/zeavim.vim

Zeavim allows to use the offline documentation browser [Zeal](http://zealdocs.org/)
from Vim. This plugin wasn't modified but have some custom configuration in
`.vimrc` file.

### PaperColor

Webpage: https://github.com/NLKNguyen/papercolor-theme

Used as default theme for Vim/NeoVim. Comes in two versions: dark (default if
you use included `.vimrc` configuration file) and light (default for no
configuration). This version has a bit better support for the Ada and Tcl
syntax, also some custom configuration is in `.vimrc` file.

### Gruvbox

Webpage: https://github.com/morhetz/gruvbox

Another theme available with this pack. More information about this theme,
configuring and enabling it, you can find at its webpage. This version of
Gruvbox have added support for Ada syntax.

-------

That's probably all, feel free to use project Issues if you have any
problems, questions, ideas or bug reports about this pack.

Bartek thindil Jasicki
