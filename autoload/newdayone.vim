"=============================================================================
" File        : newdayone.vim
" Author      : Akira Maeda <glidenote@gmail.com>
" WebPage     : http://github.com/glidenote/newdayone.vim
" Version     : 0.0.1
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be
"     included in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
"     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
"     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
"     LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
"     OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
"     WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

let s:save_cpo = &cpo
set cpo&vim

function! newdayone#NewDayone(count, line1, line2, ...)
  let s:dayone_cmd = 'dayone new'

  let content      = join(getline(a:line1, a:line2), "\n")
  let content      = substitute(content, '"', '\\"', "g")

  let confirm = input("Are you sure to create new entry? (y/n [n]): ")
  if confirm != "y"
    echo ""
    return
  endif
  let cmd = 'echo "' . content . '" | ' . s:dayone_cmd

  echon ' Creating new Day One entry... '
  let res = system(cmd)

  if res == 0
    redraw
    echon 'Done.'
  else
    redraw | echohl ErrorMsg | echo v:exception | echohl None
  endif

endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__
" vim: set et:
" vim: foldmethod=marker
