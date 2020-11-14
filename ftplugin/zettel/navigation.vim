nnoremap <script> <buffer> <silent> [[ <nop>
nnoremap <script> <buffer> <silent> ]] <nop>
nnoremap <script> <buffer> <silent> [] <nop>
nnoremap <script> <buffer> <silent> ][ <nop>

function! s:NextSection(type, backwards)
    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif
    execute 'silent normal! '. dir . '^#' . "\r"
endfunction

nnoremap <script> <buffer> <silent> ]]
            \ :call <SID>NextSection(1, 0)<cr>
nnoremap <script> <buffer> <silent> [[
            \ :call <SID>NextSection(1, 1)<cr>
nnoremap <script> <buffer> <silent> ][
            \ :call <SID>NextSection(2, 0)<cr>
nnoremap <script> <buffer> <silent> []
            \ :call <SID>NextSection(2, 1)<cr>
