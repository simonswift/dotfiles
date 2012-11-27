set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="phaedrus"
hi Normal guifg=#cccccc guibg=#222222
hi Comment guifg=#666666 guibg=NONE
hi Constant guifg=#70ff63 guibg=NONE
hi String guifg=#ffffff guibg=NONE
hi htmlTagName guifg=#f6fa7d guibg=NONE
hi Identifier guifg=#ffaa00 guibg=NONE
hi Statement guifg=#aa4444 guibg=NONE
hi PreProc guifg=#ff7070 guibg=NONE
hi Type guifg=#ffaa00 guibg=NONE
hi Function guifg=#ffaa00 guibg=NONE
hi Repeat guifg=#000000 guibg=NONE
hi Operator guifg=#ff0000 guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special