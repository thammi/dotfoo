" from:
" http://vim.wikia.com/wiki/Copy_C%2B%2B_function_declaration_into_implementation_file
"
" modified to match my coding style

:nmap <F3> :CopyDefinition<CR>
:nmap <F4> :ImplementDefinition<CR>
 
:command! CopyDefinition :call s:GetDefinitionInfo()
:command! ImplementDefinition :call s:ImplementDefinition()
 
function! s:GetDefinitionInfo()
  exe 'normal ma'

  " Get class
  call search('^\s*\<class\>', 'b')
  exe 'normal ^w"aye'
 
  let s:class = @a
  let l:ns = search('^\s*\<namespace\>', 'b')

  " Get namespace
  if l:ns != 0
    exe 'normal ^w"ayw'
    let s:namespace = @a
  else
    let s:namespace = ''
  endif

  " Go back to definition
  exe 'normal `a'
  exe 'normal "aY'
 
  let s:defline = substitute(@a, ';\n', '', '')
 
endfunction
 
function! s:ImplementDefinition()
  call append('.', s:defline)
  exe 'normal j'

  " Remove keywords
  s/\<virtual\>\s*//e
  s/\<static\>\s*//e
 
  if s:namespace == ''
    let l:classString = s:class . "::"
  else
    let l:classString = s:namespace . "::" . s:class . "::"
  endif

  " Remove default parameters
  s/\s\{-}=\s\{-}[^,)]\{1,}//e

  " Add class qualifier
  exe 'normal ^f(bi' . l:classString

  " Add brackets
  exe "normal $A {\<CR>}\<CR>\<ESC>kk"

  " Fix indentation
  exe 'normal =2j^'
 
endfunction
