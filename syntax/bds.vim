" Vim syntax file
" Language: BigDataScript a.k.a bds
" Maintainer: Kirill Tsyganov <kirill.tsyganov@monash.edu>
" Created: 6 July 2015
" Version: 1.0
" Latest Revision: 9 July 2015

if exists ("b:current_syntax")
  finish
endif

syntax keyword bdsConditional        if else
syntax keyword bdsRepeat             for while
syntax keyword bdsBoolean            true fasle
syntax keyword bdsType               string int bool real contained
syntax keyword bdsSpecialStatement   task sys goal dep par
syntax keyword bdsPrintStatements    print println
syntax keyword bdsStatement          break continue wait exit return
syntax keyword bdsStatement          checkpoint breakpoint
syntax keyword bdsInclude            include
syntax keyword bdsDebug              debug
syntax keyword bdsError              error warning

syntax match   bdsNumbers            /\v<[0-9]*>/
syntax match   bdsNumbers            /\v<[0-9]*.[0-9]*>/

syntax match   bdsComment            /\v#.*$/  contains=bdsTodo
syntax match   bdsComment            /\v\/\/.*$/ contains=bdsTodo

"I'm not sure if I need to include 'skip'. If I do include it then commenting doesn't work
"syntax region  bdsComment            start=/\v\/\*/ skip=/\\./ end=/\v\*\// contains=bdsTodo
syntax region  bdsComment            start=/\v\/\*/ end=/\v\*\// contains=bdsTodo
syntax keyword bdsTodo               FIXME NOTE NOTES TODO XXX contained

syntax match   bdsSpecialOperator    /<-/

syntax region  bdsString             start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region  bdsString             start=/\v'/ skip=/\v\\./ end=/\v'/ 

syntax match   bdsHelpString         /\vhelp\s.*$/ contains=bdsSpecialChar
syntax keyword bdsSpecialChar        help contained

syntax match   bdsStringContainer    /\(string\(\[\]\|{}\)\|string\)/ contains=bdsType
syntax match   bdsNumberContainer    /\(int\(\[\]\|{}\)\|int\)/ contains=bdsType

syntax match   bdsStringFunction           /\(string\(\[\]\|{}\)\|string\)\s[A-Za-z]*(/ contains=bdsType
syntax match   bdsNumberFunction           /\(int\(\[\]\|{}\)\|int\)\s[A-Za-z]*(/ contains=bdsType

highlight link bdsStringContainer    Type
highlight link bdsNumberContainer    Type

highlight link bdsNumbers            Number

highlight link bdsConditional        Conditional
highlight link bdsRepeat             Repeat
highlight link bdsBoolean            Boolean
highlight link bdsType               Type
highlight link bdsSpecialStatement   Function
highlight link bdsPrintStatements    Function
highlight link bdsStatement          Statement
highlight link bdsStatement          Statement
highlight link bdsInclude            Include
highlight link bdsDebug              Debug
highlight link bdsError              Error

highlight link bdsComment            Comment
highlight link bdsTodo               Todo
highlight link bdsSpecialOperator    Operator
highlight link bdsString             String
highlight link bdsHelpOption         String

highlight link bdsHelpString         String
highlight link bdsSpecialChar        SpecialChar

highlight link bdsFunctionStatement  Error
highlight link bdsStringFunction     Function
highlight link bdsNumberFunction     Function

let b:current_syntax = "bds"
