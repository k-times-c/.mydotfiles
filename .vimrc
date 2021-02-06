" SECTION: VARIABLE ASSIGNMENTS 
    let $MYVIMDIR="~/.vim"
    let $RTP=split(&runtimepath, ",")[0]

" SECTION: VANILLA VIM SETTINGS
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim

    set nocompatible            "required
    filetype plugin indent on   "checks ~/.vim/**/ftplugin/
    syntax enable               "use 'syntax on' to lock in default colors
    set number
    set backspace=indent,eol,start
    set hidden                  "setting hidden or switch through unsaved buffers
    set history=800             "setting history to 400
    " all the following (commented) are set in the defaults.vim
    " set ruler                   "show the cursor position
    " set showcmd                 "showing incomplete commands
    " set wildmenu                "shows a menu when using tab completion
    " set incsearch               "show search matches as you type
    set cursorline              "displays the cursor line off-color scheme for easy reading
    runtime ftplugin/man.vim    "can use the man pages within vim
    packadd matchit             "add matchit.vim
    set autoindent              "setting up auto indent
    set smartindent             "settin up smart indent
    "set nrformats=             "setting up decimal notation for arithmetic
    set spelllang=en_us         "setting spell check to english
    set complete+=kspell        " Use word completion when spelling is enabled
    set wildignore+=*.swp
    set noswapfile             "no swap files
    "note: setting viminfofile (see :help viminfo to understand understand pattern)
    set viminfo='100,<1000,s100,!,%,h
    " set esckeys
    set bg=dark                 "ensuring vim knows the background
    set t_Co=256
    colorscheme solarized
    highlight clear SignColumn
    highlight clear Terminal
    "set g:solarized_termtrans=1
    set shell=/bin/zsh 
    set mouse=a                 " enabling mouse for vim
    "modifyOtherKeys (see help for more info) disabled
    setlocal modelineexpr
    unmap Q

    setglobal path=.,,
    if getcwd() ==# expand("~")
        set path+=**2
    else
        set path+=**4
    endif

    
    " DEFAULT INDENTS
    set softtabstop=4   "Number of spaces inserted when inputting tab
    set tabstop=8               
    set shiftwidth=4

" SECTION: ABBREVATIONS
    ia teh the
    ia adn and
    cabbrev GC Google\ Chrome

" SECTION: PLUGIN SETTINGS

    " LSP SETTINGS
    let my_sourcekit_lsp = '"' . 
                        \ substitute(system("xcrun --find sourcekit-lsp"),
                                    \ "[ \n]", "", "g"
                                    \) 
                        \ . '"'  
    if executable(my_sourcekit_lsp)
          au User lsp_setup call lsp#register_server({
                  \ 'name': 'sourcekit-lsp',
                  \ 'cmd': {server_info->[my_sourcekit_lsp]},
                  \ 'whitelist': ['swift'],
                  \ })
        endif

    " NETRW SETTINGS
    let g:netrw_banner = 0              "no header banner
    let g:netrw_liststyle = 3   "default to tree style format
    "let g:netrw_winsize = 20   "default window size
    "let g:netrw_preview = 1    "default for PREVIEW file to be a vertical split (P.S. to close a preview use Ctrl-W,Z)
    "let g:netrw_altv=1         "default window split is to the right
    let g:netrw_list_hide='.*\.swp$,.*\.pyc$'
    let g:solarized_diffmode="low"
    

    " VIM-TEST SETTINGS (AND MAPPINGS)
         
    nmap <silent> t<C-n> :TestNearest<CR>
    nmap <silent> t<C-f> :TestFile<CR>
    nmap <silent> t<C-s> :TestSuite<CR>
    nmap <silent> t<C-l> :TestLast<CR>
    nmap <silent> t<C-g> :TestVisit<CR>


" SECTION: LEADER KEY SETTINGS
    let maplocalleader = "\\"
    let mapleader = "\<Space>"

" SECTION: MY KEY MAPPINGS
    "LEADER KEY MAPPINGS
    nnoremap <C-p> <Up>$
    nnoremap <C-n> <Down>$
    nnoremap <leader>w :update<CR>
    nnoremap <silent> <leader>v :e $MYVIMRC<CR>
    nnoremap <silent> <leader>z :e $HOME/.zshrc<CR>
    nnoremap <leader>r :update<CR> :make %<CR><CR>
    nnoremap <leader>u :UltiSnipsEdit<CR>
    nnoremap <leader>t :filetype detect<CR> " Re-detect filetype*
    nnoremap <leader>af :e <C-R>='$MYVIMDIR/after/ftplugin/'.&filetype.'.vim'<CR><CR> "*
    nnoremap <leader>ai :e <C-R>='$MYVIMDIR/after/indent/'.&filetype.'.vim'<CR><CR> "*
    nnoremap <leader>f :e <C-R>='$MYVIMDIR/ftplugin/'.&filetype.'.vim'<CR><CR> "*
    nnoremap <leader>i :e <C-R>='$MYVIMDIR/indent/'.&filetype.'.vim'<CR><CR> "*


    nnoremap <leader>e :e.<cr>
    nnoremap <leader>E :Explore<cr>
    
    "MISCELLANEOUS MAPPINGS
    nnoremap gV `[v`]                   | " Visually select pasted or yanked text *
    nnoremap <silent> <BS> :buffer#<cr>
    nnoremap ,e :e %:p:h/*              | " Faster file / directory navigation
    nnoremap ,g :g//#<Left><Left>       | " Fast global commands *
    nnoremap ,m :!mkdir -p %:h<CR>      | " Make the directory for which the current file should be in
    nnoremap g/ /%V
    vnoremap g/ /%V

    " command line mappings
    cnoremap <C-_> <C-r>=setcmdpos(1)<CR><BS>
    " Terminal-mode mappings
    tnoremap jj <C-\><C-n>



" SECTION: AUTOCOMMAND MAPPINGS
    augroup AutoResizing
        autocmd!
        autocmd VimResized * :wincmd = "automatically rebalance windows on vim resize
    augroup END

    " Create file-markers for commonly edited file types *
    augroup FileMarks
      autocmd!
      autocmd BufLeave *.html normal! mH
      autocmd BufLeave *.snippets normal! mS
      autocmd BufLeave *.js   normal! mJ
      autocmd BufLeave *.vim  normal! mV
      autocmd BufLeave *.py  normal! mP
    augroup END
    " TODO: create a vimscript mapping that creates a mark for a mapping, and then
    " if you leave and it conflicts with another filetype, confirm once for
    " the duration of the setting

nnoremap Y  y$
noremap <Up> gk
noremap <Down> gj
cnoremap <C-R><C-L> <C-R>=substitute(getline('.'), '^\s*', '', '')<CR>
" inoremap <C-C> <Esc>`^
" SECTION: MISCELLANEOUS NOTES AND VIMRC FLIRTS 
    "hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" vim: set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ SECTION\:'?'>1'\:'=':
