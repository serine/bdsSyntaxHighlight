" Vim filetype detection file
" Language: BigDataScript a.k.a bds
" Maintainer: Kirill Tsyganov <kirill.tsyganov@monash.edu>
" Created: 6 July 2015
" Version: 1.0
" Latest Revision: 12 July 2015

" apparently it friendlier to use`setfiletype`
" I'll investigate this further
"autocmd BufRead,BufNewFile *.bds setfiletype bds
autocmd BufRead,BufNewFile *.bds set filetype=bds
