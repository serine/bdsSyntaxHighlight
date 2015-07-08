## BigDataScript Vim syntax highlight plugin

Not sure if I can call it a plugin since there is only one file, but I guess it plugs in..

Okay, It turned out much bigger job to make syntax highlight than I anticipated at the start...
I can call a plugin now !

I understand that all that [pathogen](https://github.com/tpope/vim-pathogen) plugin does is sets the
right `runtimepath` to look in `bundle` direcotry for all other relevant directories. I pretty sure
This plugin is pathoge compatible and therefore:

## Installation

### Pathogen

`git clone https://github.com/serine/bdsSyntaxHighlight.git ~/.vim/bundle/bdsSyntaxHighlight`

And you should get your bds syntax highlighting

### Old school (Vim) way

You need to place all directories under `~/.vim/`. If you already have some or all of those directories simply
move `bds.vim` file into appropriate directory name.

e.g

- `git clone https://github.com/serine/bdsSyntaxHighlight.git ~/tmp/bdsSyntaxHighlight/`

~~~{.bash}
$ ls -1 ~/tmp/bdsSyntaxHighlight
~~~
~~~{.output}
ftdetect
ftplugin
indent
README.md
syntax
vimScriptingGuide.md
~~~

_if none of those directories exist in `~/.vim/`_

~~~{.bash}
$ mv ftdetect ftplugin indent syntax ~/.vim/
~~~

_else_

~~~{.bash}
$ mv ftdetect/bds.vim ~/.vim/ftdetect/
~~~

Repeat for all of bds.vim files.

## Useful links

_this mainly a reminder for myself, but also for other who developing syntax highlight Vim plugins_

[GO-syntax-highlight](https://github.com/fatih/vim-go)
