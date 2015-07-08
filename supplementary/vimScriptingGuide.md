# Vim Scripting guide

## I want to understand Vim scripting in the context of _indent.vim_ file 

There are four main methods available fo rindentation, each one overrides the previous if it is
enbale, or non-empty for 'indentexpt'

- `autointent` uses the indent from the previous line
- `smartindent` is like autoindent but also recognizes some C syntax to increase/reduce the indent
  where appropriate
- `cindent` works more cleverly than the other two and is configurable to different indenting styles
- `indentexpr` the most flexible of all: Evaluates an expression to compute the indent of a line.
  When non-empty this method overrides the other ones.

- `let` command assigns a value to a variable e.g `let {variable} = {expression}

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

- `v:lnum` (lnumber-variable) line number for the indentexpr. The `v` prefix means variable
           predefined by Vim
