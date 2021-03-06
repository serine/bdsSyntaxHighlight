# BigDataScript Vim syntax highlight plugin

_Have you got big data..? Well you are better get the right script for it then --> [BigDataScript](http://pcingola.github.io/BigDataScript/)_

- [Thus far - plugin](#thus-far-plugin)
- [Installation](#installation)
  * [Pathogen](#pathogen)
  * [Old school](#old-school)
- [Usage](#usage)
- [Vim syntax plugin guide](supplementary/vimScriptingGuide.md)

## Thus far - plugin:

I thought to give a quick break down of the syntax highlighting

- `break continue wait exit return checkpoint breakpoint goal` are all Statements
- `print println` are highlighted as functions (just like `print` in python)
- `task sys dep par` are also highlighted as functions...
- `local ssh cluster moab pbs sge generic mesos` are Constant
- `cpus allowEmpty canFail timeout node queue retry taskName` are task's Identifiers
- `mem node queue retry system timeout walltimeout taskShell sysShell` are Identifiers

This is colors look for me using `molokai` colorsheme ![vimSyntaxKeywords-molokai](supplementary/vimSyntaxKeywords-molokai.png)

So if you have any suggestions and/or other comments on the plugin please don't hesitate to raise an issue
or flick me email. 

----------------------------------------------------------------------------------------------------

Okay, It turned out much bigger job to make syntax highlight than I anticipated at the start...

I understand all [pathogen](https://github.com/tpope/vim-pathogen) plugin does is it sets the
right `runtimepath` to look in `bundle` directory for all other relevant directories and I am pretty
sure than my plugin is pathogen compatible and therefore:

## Installation

### Pathogen

`git clone https://github.com/serine/bdsSyntaxHighlight.git ~/.vim/bundle/bdsSyntaxHighlight`

And you should get your bds syntax highlighting

### Old school

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
supplementary
syntax
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

## Usage

By default `error` and `warning` area set to `Error` syntax higlight, which in moloaki colorsheme
colored with red highlight e.g ![bdsErrorError](supplementary/bdsErrorError.png)<br>
However users might wish to change `error` and `warning` to `Keyword` instead, which in molokai colorsheme
is colored with magenta red e.g ![bdsErrorKeyword](supplementary/bdsErrorKeyword.png)

Add those two lines to your `~/.vimrc`
```
" Interpret BDS error and warning command as Keyword instead of Error
let bdsErrorAsKeyword = 1
```
