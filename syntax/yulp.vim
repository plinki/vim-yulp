" Vim syntax file
" Language:     Yul+
" Maintainer:   plinki
" URL: https://github.com/plinki/vim-yulp

if exists("b:current_syntax")
  finish
endif

" basic
" contract, library and event are defined at bottom of file
syn keyword yulpKeyword           break case catch const continue default
syn keyword yulpKeyword           delete do else enum for if import in
syn keyword yulpKeyword           interface let new of private public
syn keyword yulpKeyword           return static throw try typeof
syn keyword yulpKeyword           var while keccak256
syn keyword yulpConstant          true false
syn keyword yulpConstant          this super

hi def link yulpKeyword           Keyword
hi def link yulpConstant          Constant
hi def link yulpBuiltinType       Type

syn match   yulpOperator          /\(!\|&\|+\|-\|<\|>\|:=\|%\|\/\|*\|\~\|\^\)/
syn match   yulpNumber            /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syn match   yulpFloat             /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syn region  yulpString            start=+"+  skip=+\\\\\|\\$"+  end=+"+
syn region  yulpString            start=+'+  skip=+\\\\\|\\$'+  end=+'+

hi def link yulpOperator          Operator
hi def link yulpNumber            Number
hi def link yulpFloat             Float
hi def link yulpString            String

" Function
syn match   yulpFunction          /\<function\>/ nextgroup=yulpFuncName skipwhite
syn match   yulpFuncName          contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=yulpFuncArgs skipwhite
syn region  yulpFuncArgs          contained matchgroup=yulpFuncParens start='(' end=')' contains=yulpFuncArgCommas,yulpEventArgSpecial skipwhite skipempty
syn match   yulpFuncArgCommas     contained ','
syn match   yulpEventArgSpecial   contained 'indexed'

hi def link yulpFunction          Type
hi def link yulpFuncName          Function
hi def link yulpFuncArgs          Type

" Comment
syn keyword yulpCommentTodo       TODO FIXME XXX TBD contained
syn region  yulpLineComment       start=+\/\/+ end=+$+ contains=yulpCommentTodo,@Spell
syn region  yulpLineComment       start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ contains=yulpCommentTodo,@Spell fold
syn region  yulpComment           start="/\*"  end="\*/" contains=yulpCommentTodo,@Spell fold

hi def link yulpCommentTodo       Comment
hi def link yulpLineComment       Comment
hi def link yulpComment           Comment
