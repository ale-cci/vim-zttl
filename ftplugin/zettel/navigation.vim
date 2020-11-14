nnoremap <script> <buffer> <silent> [[ <nop>
nnoremap <script> <buffer> <silent> ]] <nop>
nnoremap <script> <buffer> <silent> [] <nop>
nnoremap <script> <buffer> <silent> ][ <nop>
nnoremap <buffer> <silent> <C-]>
            \ :call <SID>OpenLink()<cr>

function! s:NextSection(type, backwards)
    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif
    execute 'silent normal! '. dir . '^#' . "\r"
endfunction

function! s:OpenLink()
    let attr = synIDattr(synID(line("."), col("."), 1), "name")

    let l:cmd = ""
    if attr == "zettelLinkParen"
        let l:cmd='f(l'
    elseif attr == "zettelLinkBodyContent"
        let l:cmd='f(l'
    elseif attr == "zettelLinkRef"
        let l:cmd='F]f(l'
    endif

    if l:cmd != ""
        echo "contained in cmd". l:cmd
        execute 'silent normal! '. l:cmd . ':tabe <cfile>'. "\r"
    endif
endfunction

nnoremap <script> <buffer> <silent> ]]
            \ :call <SID>NextSection(1, 0)<cr>
nnoremap <script> <buffer> <silent> [[
            \ :call <SID>NextSection(1, 1)<cr>
nnoremap <script> <buffer> <silent> ][
            \ :call <SID>NextSection(2, 0)<cr>
nnoremap <script> <buffer> <silent> []
            \ :call <SID>NextSection(2, 1)<cr>
