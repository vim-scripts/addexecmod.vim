" Vim plugin for add execute permission automatically at saving file
"
" Author: Jiro Nishiguchi (jiro@cpan.org)
" Last Change:  Sep 01, 2006
" Version: 1.0
"
" Installation instructions: Just drop into ~/.vim/plugin

if exists('loaded_addexecmod')
    finish
endif
let loaded_addexecmod = 1

let s:savecpo = &cpo
set cpo&vim

autocmd BufWritePost * :call AddExecMod()
function AddExecMod()
    let line = getline(1)
    if strpart(line, 0, 2) == "#!"
        call system("chmod +x ". expand("%"))
    endif
endfunction

let &cpo = s:savecpo
unlet s:savecpo
