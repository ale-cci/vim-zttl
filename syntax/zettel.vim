" Custom syntax file
" Language: zttl
" Maintainer: ale-cci
" Latest Revision: Today

if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "zettel"


" Single title
syn match zettelH1 '^#\s.*$' contains=headerHashHidden
syn match zettelH2 '^##\s.*$' contains=headerHashHidden
syn match zettelH3 '^###\s.*$' contains=headerHash
syn match zettelH4 '^####\s.*$' contains=headerHash
syn match zettelH5 '^#####\s.*$' contains=headerHash
syn match zettelH6 '^######\s.*$' contains=headerHash

syn match headerHashHidden '^#\{1,6\} ' conceal cchar= contained
syn match headerHash '^#\{1,6\}' conceal cchar=▷ contained


" Markdown quote >
syn match zettelQuoteStart '\s*> ' skipwhite contains=zettelQuoteArrow nextgroup=zettelQuote
syn match zettelQuoteArrow ">" containedin=startQuote contained conceal cchar=│
syn match zettelQuote '.*' contained contains=zettelPre,zettelLinkRef


" Lists
syn match zettelDotStart '^\s*\(\*\|-\|+\) ' skipwhite contains=zettelDot nextgroup=zettelList

syn match zettelDot '\*' containedin=zettelDotStart contained conceal cchar=∘
syn match zettelDot '-' contained containedin=zettelDotStart
syn match zettelDot '+' contained containedin=zettelDotStart

syn match zettelList '.*' contained

" Numbered lists
syn match zettelNumberedListStart '^\s*\d\+\.' skipwhite contains=zettelNumberedListHeader nextgroup=zettelList
syn match zettelNumberedListHeader '\d\+\.' contained

" References
syn match zettelReference '!\?\[.*\](.*)' contains=zettelLinkRef,zettelLinkBody keepend
syn match zettelLinkRef '(.*)' containedin=zettelReference contained conceal cchar=¹ containedin=zettelReference
syn match zettelLinkBody '!\?\[.*\]' contained contains=zettelLinkParen,zettelLinkBodyContent
syn match zettelLinkBodyContent '!\?[^\]\[]*' contained contains=zettelLinkParen,zettelLinkBodyContent
syn match zettelLinkParen '\(!\?\[\|\]\)' conceal contained

" Zettel tags
syn match zettelTag '^\s*\[.*\]: .*$' contains=zettelTagName
syn match zettelTagRef '\(\]:\s\)\@<=.*' contained conceal cchar=… containedin=zettelTagName keepend
syn match zettelTagName '\[.*\]:' contained containedin=zettelTag nextgroup=zettelTagRef skipwhite

" Zettel checklist
syn match zettelCheckboxHead '^\s*-\s\[.\]\s' nextgroup=zettelCheckboxTextFilled contains=zettelCheckBox
syn match zettelCheckBox '-\s\[.\]' contains=zettelCheckChar contained
syn match zettelCheckChar 'x' conceal cchar=✓ contained
syn match zettelCheckChar 'v' conceal cchar=✓ contained

syn match zettelCheckboxTextFilled '.*' contained

syn match zettelEmptyCheckbox '^\s*-\s\[\s\]\s' contains=zettelCheckBox

syn region zettelPre start='```' end='```'
syn region zettelPre start='`' end='`'

syn match zettelBold '__[a-zA-Z\s'"`*_]\+__'  contains=zettelBoldMark keepend
syn match zettelBold '\*\*[a-zA-Z\s'"`*_]\+\*\*' contains=zettelBoldMark keepend
syn match zettelBoldMark '__' contained containedin=zettelBold cchar= conceal
syn match zettelBoldMark '\*\*' contained containedin=zettelBold cchar= conceal

syn match zettelCoursive '_[a-zA-Z\s'"`]\+_'  contains=zettelCoursiveMark keepend
syn match zettelCoursive '\*[a-zA-Z\s'"`]\+\*' contains=zettelCoursiveMark keepend
syn match zettelCoursiveMark '_' contained containedin=zettelCoursive conceal cchar="
syn match zettelCoursiveMark '\*' contained containedin=zettelCoursive conceal cchar="

" Table matching
syn match zettelTableRow '^\s*|\([^|]*|\)\+' keepend contains=zettelTable,zettelPre,zettelTableColumn
syn match zettelTable '^\s*|\(\s\?:\?-\{3,}:\?\s\?|\)\+' keepend contains=zettelTableColumn,zettelTableLine
syn match zettelTableColumn '|' contained conceal cchar=│
syn match zettelTableColumn '|\(-\)\@=' contained containedin=zettelTableRow,zettelTable  conceal cchar=├
syn match zettelTableColumn '\(-\)\@<=|' contained containedin=zettelTableRow,zettelTable  conceal cchar=┤
syn match zettelTableColumn '\(-\)\@<=|\(-\)\@=' contained containedin=zettelTableRow,zettelTable  conceal cchar=┼
syn match zettelTableLine '-' contained containedin=zettelTable conceal cchar=─

" Separators
syn match zettelSep '^-\{3,\}' keepend contains=zettelSepChar
syn match zettelSep '^\*\{3,\}' keepend contains=zettelSepChar
syn match zettelSep '^_\{3,\}' keepend contains=zettelSepChar
syn match zettelSepChar '-' contained conceal cchar=─
syn match zettelSepChar '*' contained conceal cchar=─
syn match zettelSepChar '_' contained conceal cchar=─

set conceallevel=2
hi Conceal gui=none guifg=#767676
hi link zettelH1 htmlH1
hi link zettelH2 htmlH2
hi link zettelH3 htmlH3
hi link zettelH4 htmlH4
hi link zettelH5 htmlH5
hi link zettelH6 htmlH6
hi link zettelQuote Comment
hi link zettelDot Conceal
hi link zettelNumberedListHeader zettelDot
hi link zettelLinkBodyContent htmlTagName
hi link zettelLinkRef htmlLink
hi link zettelLinkParen Conceal
hi link zettelTagName htmlTagName
hi link zettelTagRef htmlLink
hi link zettelCheckBox Conceal
hi link zettelCheckChar Conceal
hi link zettelCheckboxTextFilled Comment
hi link zettelPre String
hi link zettelTable Conceal
hi link zettelTableColumn Conceal
hi link zettelCoursieve htmlItalic
hi link zettelBold htmlBold

set ts=2 sw=2
set expandtab
