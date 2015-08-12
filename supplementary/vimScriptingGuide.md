# Vim Scripting guide

## _ftdetect_

In the nutshell file(s) in this directory enables filetype detection. Good explanation of ftdetect folder
is [here](https://robots.thoughtbot.com/writing-vim-syntax-plugins). Also use `:help ftdetect` for source
of information.

## _ftplugin_

I am still yet to comprehend subtle difference between **ftplugin** and **indent** directories (files)...
My understanding of the  **ftplugin** directory is: It will hold all files that are related to a particular 
plugin. You could place indentation file into this directory as well, but better practice is to place
indentation file into its own directory a.k.a **indent**. I understand you can have you indentation code in
the **ftplugin** file and it will work just fine.

## Vim basics

- To define a function in Vim  use `function` keyword following the function name e.g 
```Vim
function Test()
  echom "Test!"
endfuction
```
Please note that in Vim function name must start with a capital letter !
You can overwrite previously defined or an built-in function using `!` e.g 
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

- `'cpoptions' ('cpo')` for more info `:help options.txt`
 'cpoptions' 'cpo'	string	(Vim default: "aABceFs",
>				 Vi default:  all flags)
>			global
>			{not in Vi}
>	A sequence of single character flags.  When a character is present
>	this indicates Vi-compatible behavior.  This is used for things where
>	not being Vi-compatible is mostly or sometimes preferred.
>	'cpoptions' stands for "compatible-options".
>	Commas can be added for readability.
>	To avoid problems with flags that are added in the future, use the
>	"+=" and "-=" feature of ":set" |add-option-flags|.
>	NOTE: This option is set to the Vi default value when 'compatible' is
>	set and to the Vim default value when 'compatible' is reset.
>	NOTE: This option is set to the POSIX default value at startup when
>	the Vi default value would be used and the $VIM_POSIX environment
>	variable exists |posix|.  This means Vim tries to behave like the
>	POSIX specification.

- `search-range`
> You can limit the search command "/" to a certain range of lines by including
> \%>l items.  For example, to match the word "limit" below line 199 and above
> line 300: >
> 	/\%>199l\%<300llimit
> Also see |/\%>l|.

----------------------------------------------------------------------------------------------------

- `expandtab` boolean (default off) By setting its 'on' spaces will be used instead of tabs
- `autoindent` boolean (default off) copy indent from the current line when starting a new line

_Reference_

1. Vim help `options.txt`

## How to write an _indent.vim_ file ..?

There are four main methods available for indentation, each one overrides the previous if it is
enable, or non-empty for 'indentexpt'

- `autointent` uses the indent from the previous line
- `smartindent` is like autoindent but also recognizes some C syntax to increase/reduce the indent
  where appropriate
- `cindent` works more cleverly than the other two and is configurable to different indenting styles
- `indentexpr` the most flexible of all: Evaluates an expression to compute the indent of a line.
  When non-empty this method overrides the other ones.

- `let` command assigns a value to a variable e.g `let {variable} = {expression}`

## Special functions, variables (options), and commands that we need to use for Vim script

- `exists("identifier")` Returns true if this identifier already exists. Handy for checking that we're not
                         about to overwrite something.
- `getline(line number)` Returns a string containing the given line's contents.
- `prevnonblank(line number)` Returns a number corresponding to the line number of the first line
                             (including and going backwards from the specified line) that isn't merely blank.
- `indent(line number)` Returns the indentation level of the specified line
- `setlocal` Sets the value of a variable, but only within the current scope.
- `indentexpr` Vim calls the function identified by this option to calculate the required indent for a line. 
- `indentkeys` If a line contains any of the strings contained in this option, Vim calls the indent function.
               In other words, this option dictates when the indentation process is performed.
- `shiftwidth` The amount of columns (i.e. the number of spaces, or the equivalent number of tabs) corresponding
              to one indent level. Often set by the user to suit their own taste.

## Other

- `v:lnum` (lnumber-variable) line number for the indentexpr. The `v` prefix means variable predefined by Vim
- `b:did_indent` buffer-local variable indicates that current buffer already has script-based indenting enabled

## Useful links

- [Syntax highlight thoughtbot](https://robots.thoughtbot.com/writing-vim-syntax-plugins)
- [Syntax highlight](http://usevim.com/2012/03/07/syntax-highlighting/)
- [Syntax highlight Intro Guide](http://vim.wikia.com/wiki/Creating_your_own_syntax_files)
- [GO language - syntax highlight plugin](https://github.com/fatih/vim-go)
- [How to write indent script vim](http://www.psy.swansea.ac.uk/staff/carter/Vim/vim_indent.htm)
- [Learn vim the hard way](http://learnvimscriptthehardway.stevelosh.com/chapters/43.html)
- [Regex quick start](http://www.rexegg.com/regex-quickstart.html)
- [Regular expression 101](http://vimregex.com/)
- [Good explanation of indentation options](http://vim.wikia.com/wiki/Indenting_source_code)
- [Interesting article that points to useful Vim scripting resources](http://foosoft.net/news/2014-12-07/)
