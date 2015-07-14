" Vim syntax file
" Language: BigDataScript a.k.a bds
" Maintainer: Kirill Tsyganov <kirill.tsyganov@monash.edu>
" Created: 6 July 2015
" Version: 1.0
" Latest Revision: 14 July 2015

if exists ("b:current_syntax")
  finish
endif

" function that check if settings exist or not
function! s:Enable(name)
  return exists(a:name) && {a:name}
endfunction

syntax keyword bdsConditional        if else
syntax keyword bdsRepeat             for while
syntax keyword bdsBoolean            true false
syntax keyword bdsType               string int real
syntax keyword bdsBoolType           bool
syntax keyword bdsSpecialStatement   task sys dep par
syntax keyword bdsPrintStatements    print println
syntax keyword bdsStatement          break continue wait exit return
syntax keyword bdsStatement          checkpoint breakpoint goal
syntax keyword bdsInclude            include
syntax keyword bdsDebug              debug
syntax keyword bdsTaskIdentifier     cpus allowEmpty canFail timeout node queue retry taskName
syntax keyword bdsIdentifier         mem node queue retry system timeout walltimeout taskShell sysShell
syntax keyword bdsConstant           local ssh cluster moab pbs sge generic mesos

syntax match   bdsNumbers            /\v<[0-9]*>/
syntax match   bdsNumbers            /\v<[0-9]*.[0-9]*>/

syntax region  bdsString             start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region  bdsString             start=/\v'/ skip=/\v\\./ end=/\v'/ 

syntax match   bdsSpecialOperator    /<-/

"look like there are multiple ways to match bdsCommnet
"syntax region  bdsComment            start=/\v\/\*/ end=/\v\*\// contains=bdsTodo
syntax keyword bdsTodo               FIXME NOTE NOTES TODO XXX contained
syntax region  bdsComment            start="/\*" end="\*/" contains=bdsTodo
syntax match   bdsComment            /\v#.*/  contains=bdsTodo
syntax match   bdsComment            /\v\/\/.*/ contains=bdsTodo

syntax keyword bdsError              error warning

syntax keyword bdsHelpUnsorted       helpUnsorted
syntax keyword bdsHelpKeyword        help contained
"syntax match   bdsHelpString         /\vhelp\s.*$/ contains=bdsSpecialChar
syntax region  bdsHelpString         start="\vhelp\s" skip="\v\\"  end="\v\n" contains=bdsHelpKeyword

" no corresponding highlight link
syntax keyword bdsContainerString    string int real contained
syntax match   bdsContainer          /[A-Za-z]*\[\]\|{}/ contains=bdsContainerString

" \@= is a look ahead Vim regex
"syntax match   bdsStringFunction     /[A-Za-z]*\(\[\]\|{}\)\s*[A-Za-z]*\((\)\@=/ contains=bdsContainerString
syntax match   bdsFunction           /[A-Za-z]*\(\[\]\|{}\)\s*[A-Za-z]*\((\)\@=/ contains=bdsContainer

"------------------------------
" higlighting
"------------------------------
highlight link bdsConditional        Conditional
highlight link bdsRepeat             Repeat
highlight link bdsBoolean            Boolean
highlight link bdsType               Type
highlight link bdsBoolType           Type
highlight link bdsSpecialStatement   Function
highlight link bdsPrintStatements    Function
highlight link bdsStatement          Statement
highlight link bdsStatement          Statement
highlight link bdsInclude            Include
highlight link bdsDebug              Debug
highlight link bdsTaskIdentifier     Identifier
highlight link bdsIdentifier         Identifier
highlight link bdsConstant           Constant

highlight link bdsNumbers            Number

highlight link bdsString             String

highlight link bdsSpecialOperator    Operator

highlight link bdsTodo               Todo
highlight link bdsComment            Comment

" Highlight error and warning as syntax Error OR Keyword
" Default error and warning are highlighted as syntax Error
" let bdsErrorAsKeyword = 1 
" to enable error and warning to be highlighted as Keyword
if !s:Enable("g:bdsErrorAsKeyword")
  highlight link bdsError Error
else
  highlight link bdsError Keyword
endif

highlight link bdsHelpUnsorted       Keyword
highlight link bdsHelpKeyword        Keyword
highlight link bdsHelpString         String

highlight link bdsContainer          Type

highlight link bdsFunction           Function

let b:current_syntax = "bds"
