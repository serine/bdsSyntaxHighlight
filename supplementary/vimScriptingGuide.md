# Vim Scripting guide

## Content

- [House keeping](#house-keeping)
- [Directory hierarchy](#directory-hierarchy)
  - [ftdetect](#ftdetect)
  - [ftplugin](#ftplugin)
  - [indent](#indent)
  - [syntax](#syntax)
- [Writing indent file](#writing-indent-file)
  - [Basic file indentation](#basic-file-indentation)
  - [Other indentation options](#other-indentation-options)
  - [Tabs and Spaces](#tabs-and-spaces)
  - [indent file](#indent-file)
  - [built-in functions](#built-in-functions)
  - [Other](#other)
  - [References](#references)
- [Useful links](#usefuls-links)

## House keeping

- Start by making a `*.vim` file  with your vim code and 'execute' it by opening vim and 'sourcing' your script file in e.g `:source /path/to/your/script.vim`
- To define a function in Vim  use `function` keyword following the function name e.g 
```Vim
function Test()
  echom "Test!"
endfuction
```
**Please note that in Vim function name must start with a capital letter !**

- You can overwrite previously defined or an built-in function using `!` operator e.g 
```Vim
function! Test()
  echom "This function overwrites previously defined Test()"
endfuction
```
- `:onoremap b /return<cr>` The first bit of the mapping is some what irrelevant, but the second part 
says: from `/` which is from cursor to the "return" word, which can really be anything.

- `b:` for local-buffer

- `<cr>` is carriage return: is a control character or mechanism used tto reset a device's position to the 
beginning of a line of text

## Directory hierarchy 

### _ftdetect_

In the nutshell file(s) in this directory enables filetype detection. Good explanation of ftdetect folder
is [here](https://robots.thoughtbot.com/writing-vim-syntax-plugins). Also use `:help ftdetect` for source
of information.

### _ftplugin_

I am still yet to comprehend subtle difference between **ftplugin** and **indent** directories (files)...
My understanding of the  **ftplugin** directory is: It will hold all files that are related to a particular 
plugin. You could place indentation file into this directory as well, but better practice is to place
indentation file into its own directory a.k.a **indent**. I understand you can have you indentation code in
the **ftplugin** file and it will work just fine.

### _syntax_

your syntax file goes into this directory

### _indent_

This directory holds your indent.vim file


## Writing indent file

### Aim

In summary `indent.vim` file returns a numerical value that tells Vim to **indent**, **un-indent** or **keep-the-same** indentation level of the current line by that number of spaces.

### Basic file indentation

There are four main methods available for indentation, each one overrides the previous if it is enable. Three explained below and 'indentexpr' explained in [indent file](#indent-file) section.

- `filetype indent on` enables `cindent` option.this not only enables C and C alike languages indentation, but
also includes other filetypes detection.
- `:let b:did_indent = 1` will disable indentation. You can create a file in the `~/.vim/indent/` directory with your specific file name e.g bds.vim and include `let b:did_indent = 1` which will disable any previous indentation for this file.

### Other indentation options

- `autoindent` boolean (default off) copy indent from the current line when starting a new line. It uses the
indent from the previous line
- `smartindent` is like `autoindent` but also recognizes some C syntax to increase/reduce the indent
  where appropriate
- `cindent` works more cleverly than the other two and is configurable to different indenting styles

### Tabs and Spaces

- `>>` use this key to increase the amount of indent in a line. The amoutn of indent added is specified with
`shiftwidth` value, default [8].
- `tabstop` default [8]. It is not recommended to change default value. Use `softtabstop` instead
- `softtabstop` set this value to the desired number. This will be used when you press <Tab> key. Default for 
<Tab> key is `tabstop`, which is set to default value [8].
- `expandtab` boolean (default off) By setting its 'on' spaces will be used instead of tabs. This options allowsyou to use <Tab> key but have no tabs in your file only spaces.

### indent file

In order to write your own indent file, it must set the `indentexpr` options.

- `indentexpr` is the most flexible of the other three described in [basic file indentation](#basic-file-indentation):
    - when `indentexpr` is non-empty this method overrides the other ones
    - It evaluates an expression to compute the indent for each line
    - It is used when a new line is created
    - The expression must return the number of spcaes worth of indent. If `-1` is returned then current line indent is kept (this means 'autoindent' is used for the indent)

### built-in functions

- `getline({lnum})` Returns a string containing the given line's contents.
- `indent({lnum})` Returns a number of the indentation level of the specified line. The indent is counted in spaces.
- `prevnonblank({lnum})` Returns a number corresponding to the line number of the first line (including and going backwards from the specified line) that isn't merely blank.

- `exists("identifier")` Returns true if this identifier already exists. Handy for checking that we're nott                      about to overwrite something.t                      about to overwrite something.


- `setlocal` Sets the value of a variable, but only within the current scope.
- `indentexpr` Vim calls the function identified by this option to calculate the required indent for a line. 
- `indentkeys` If a line contains any of the strings contained in this option, Vim calls the indent function.
               In other words, this option dictates when the indentation process is performed.
- `shiftwidth` The amount of columns (i.e. the number of spaces, or the equivalent number of tabs) corresponding
              to one indent level. Often set by the user to suit their own taste.

### Other

- `let` command assigns a value to a variable e.g `let {variable} = {expression}`
- `v:lnum` (lnumber-variable) line number for the indentexpr. The `v` prefix means variable predefined by Vim
- `b:did_indent` buffer-local variable indicates that current buffer already has script-based indenting enabled

### References

  - `usr_25.txt` section 25.3
  - [`usr_30.txt` section 30.5](http://vimhelp.appspot.com/usr_30.txt.html#30.5) Tabs and spaces
  - [`usr_41.txt`](http://vimhelp.appspot.com/usr_41.txt.html#usr_41.txt) Write a Vim script
  - `indent.txt`
  - `options.txt`
  - [`eval.txt`](http://vimhelp.appspot.com/eval.txt.html) Expression evaluation
  - [`help indent()`](http://vimhelp.appspot.com/eval.txt.html)
  - [`:help internal-variables`](http://vimhelp.appspot.com/eval.txt.html#internal-variables) explains what are different prefixs to the variable mean

## Useful links

- [Thoughtbot - Syntax plugin](https://robots.thoughtbot.com/writing-vim-syntax-plugins)
- [usevim - Syntax highlight](http://usevim.com/2012/03/07/syntax-highlighting/)
- [Vim wiki - Syntax highlight](http://vim.wikia.com/wiki/Creating_your_own_syntax_files)
- [Vim wiki - Indenting source code](http://vim.wikia.com/wiki/Indenting_source_code)
- [IBM - Vim scripting](http://www.ibm.com/developerworks/library/l-vim-script-1/)
- [How to write indent script vim](http://www.psy.swansea.ac.uk/staff/carter/Vim/vim_indent.htm)
- [Learn vim the hard way](http://learnvimscriptthehardway.stevelosh.com/chapters/43.html)
- [Regex quick start](http://www.rexegg.com/regex-quickstart.html)
- [Regular expression 101](http://vimregex.com/)
- [GO language - syntax highlight plugin](https://github.com/fatih/vim-go)
- [Interesting article that points to useful Vim scripting resources](http://foosoft.net/news/2014-12-07/)
