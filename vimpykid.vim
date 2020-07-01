" Vim global plugin for turning print statements into descriptive print statements for debugging purposes
" Last Change:  2020 June 29
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
    map <unique> <Leader>a  <Plug>VimpyKidFed
endif

map <unique> <Leader>fs  <Plug>VimpyKidFed <SID>Fed

noremenu <script> Plugin.Fed\ Fstring      <SID>Fed

noremap <SID>Fed  :call <SID>Fed(getline('.'))<CR>

function s:Fed(str)
    if str =~ "print("
        echo "str contains print("
    endif
endfunction 


let &cpo = s:save_cpo
unlet s:save_cpo
