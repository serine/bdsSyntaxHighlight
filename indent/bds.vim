" Vim indent file
" Language: [BigDataScript](http://pcingola.github.io/BigDataScript/) a.k.a bds
" Maintainer: Kirill Tsyganov <kirill.tsyganov@monash.edu>
" Created: 6 July 2015
" Version: 1.0
" Latest Revision: 8 July 2015

" `b:` for local-buffer
" Only load this indent file when no other was loaded
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal indentexpr=BDSindent()

if exists("*BDSindent")
  finish
endif

function! BDSindent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  if previous =~ "{" && previous !~ "}" && line !~ "}" && line !~ ":$"
    return indent(previousNum) + &tabstop
  endif
endfunction
