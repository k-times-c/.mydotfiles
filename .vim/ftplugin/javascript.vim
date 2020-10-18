"Javascript.vim filetype preferences

setlocal tabstop=2 softtabstop=2 shiftwidth=2 noet
"setlocal makeprg=eslint\ --format\ compact

" Fix files with prettier, and then ESLint.
" let b:ale_fixers = ['prettier', 'eslint']
let b:ale_fixers = ['prettier']
let b:ale_linters = [ 'eslint']
let b:formatprg = ['prettier']

iabbrev clog console.log
iabbrev docq document.querySelector
