" Vim global plugin for turning print statements into descriptive print statements for debugging purposes
" Last Change:  2020 July 1
" Maintainer:   akakream <https://github.com/akakream>
" License:      This file is placed in the public domain.

if exists("g:loaded_vimpykid")
    finish
endif
let g:loaded_vimpykid = 1

let s:save_cpo = &cpo
set cpo&vim

"Turn print() statements into f-strings
if !hasmapto('<Plug>VimpyKidFed')
    map <unique> <Leader>fs  <Plug>VimpyKidFed
endif

noremap <unique> <script> <Plug>VimpyKidFed  <SID>Fed

noremenu <script> Plugin.Fed\ Fstring      <SID>Fed

noremap <SID>Fed  :call <SID>Fed(getline('.'))<CR>

" TODO: Match the beginning of line with print( and end of line with )
function s:Fed(line)
    if a:line =~ "print("
        let s:matchedStr = matchstr(a:line, '(.*)')
        let s:subStr = substitute(a:line, '(.*)', '(f"' . s:matchedStr[2:-3] . ': ' . '{' . s:matchedStr[2:-3] . '}")', '')
        exe "normal V R" . s:subStr
    endif
endfunction 

let &cpo = s:save_cpo
unlet s:save_cpo

