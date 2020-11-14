command! ZettelTagAdd :call s:TagAdd()

function! s:TagAdd()
    let l:tagname = input("Tag: ")
    execute 'silent normal! Go['. l:tagname.']: <no-file>'
endfunction
