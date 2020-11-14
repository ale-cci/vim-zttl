command! ZettelCreateNote :call s:CreateNewNote()

function! s:CreateNewNote()
    let l:title = input("Title: ")
    let l:filename = strftime('%y%m%d%H%M%S') . '.ztt'
    let l:notepath = '~/notes/'
    execute 'silent normal! :e '.l:notepath.l:filename."\r"
    execute 'silent normal! i# '.l:title."\r"
endfunction
