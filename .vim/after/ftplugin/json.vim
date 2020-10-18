function! CollapseBracesAndParens()
    let line = getline(v:lnum)
    if line=~"[\[\{]"
	return "a1"
    elseif line=~"[\]\}]"
	return "s1"
    else
	return "="
    endif
endfunction
setlocal foldmethod=expr
" setlocal foldexpr=CollapseBracesAndParens()

" function! PullDescriptionsAndKeyCodes()
"     let n_lns_in_fold = (v:foldend-v:foldstart)
"     echom n_lns_in_fold
"     let s:lnum = v:foldstart
"     if n_lns_in_fold > 20
" 	return getline(v:foldstart+1).' ('.n_lns_in_fold.')'
"     while s:lnum < v:foldend
" 	let s:line = getline(lnum)
" 	if line~="\\(description\\|key_code\\)"
" 	    return line.' ('.n_lns_in_fold.')'
" 	s:lnum = (lnum + 1)
"     endwhile
"     return getline(v:foldstart+1).' ('.n_lns_in_fold.')'
" endfunction
	
" setlocal foldtext=PullDescriptionsAndKeyCodes()
