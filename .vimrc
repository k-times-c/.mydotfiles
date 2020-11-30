" SECTION: VARIABLE ASSIGNMENTS 
    let $MYVIMDIR="~/.vim"
    let $RTP=split(&runtimepath, ",")[0]

" SECTION: VANILLA VIM SETTINGS
    set nocompatible            "required
    filetype plugin indent on   "checks ~/.vim/**/ftplugin/
    syntax enable               "use 'syntax on' to lock in default colors
    set history=400             "setting history to 400
    set ruler                   "show the cursor position
    set showcmd                 "showing incomplete commands
    set wildmenu                "shows a menu when using tab completion
    set incsearch               "show search matches as you type
    set cursorline              "displays the cursor line off-color scheme for easy reading
    set number                  "turn on line numbering 
    set lbr                     "setting up a better linewrap
    runtime ftplugin/man.vim "can use the man pages within vim
    packadd matchit             "add matchit.vim
    set autoindent              "setting up auto indent
    set smartindent             "settin up smart indent
    "set nrformats=             "setting up decimal notation for arithmetic
    set hidden                  "setting hidden or switch through unsaved buffers
    set spelllang=en_us         "setting spell check to english
    set complete+=kspell        " Use word completion when spelling is enabled
    set backspace=indent,eol,start
    set wildignore+=**/virtualenv_run/**.*.pyc,*.pyo.__pycache__,*.swp
    "set splitright             "default split is to the right of the file 
    "set noswapfile             "no swap files
    "set belloff=all
    "note: setting viminfofile (see :help viminfo to understand understand pattern)
    set viminfo='100,<1000,s100,!,%,h
    " set esckeys
    " set ttimeoutlen=50        "delay from inputting to enacting a key mapping (50 default)
    " set timeoutlen=400
    set bg=dark                 "ensuring vim knows the background
    set t_Co=256
    colorscheme solarized
    highlight clear SignColumn
    highlight clear Terminal
    "set g:solarized_termtrans=1
    set shell=/bin/zsh 
    set mouse=a                 " enabling mouse for vim
    "modifyOtherKeys (see help for more info) disabled
    set modelineexpr

    if getcwd() ==# expand("~")
        set path+=**2
    else
        set path+=**
    endif

    
    " DEFAULT INDENTS
    set softtabstop=4   "Number of spaces inserted when inputting tab
    set tabstop=8               
    set shiftwidth=4

    " NETRW SETTINGS
    let g:netrw_banner = 0              "no header banner
    let g:netrw_liststyle = 3   "default to tree style format
    "let g:netrw_winsize = 20   "default window size
    "let g:netrw_preview = 1    "default for PREVIEW file to be a vertical split (P.S. to close a preview use Ctrl-W,Z)
    "let g:netrw_altv=1         "default window split is to the right
    let g:netrw_list_hide='.*\.swp$,.*\.pyc$'  " ,.*.pyc'
    let g:solarized_diffmode="low"
    

  " SECTION: PLUGIN SETTINGS HERE.
          let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

        " VIM-TEST SETTINGS (AND MAPPINGS)
         
            let test#strategy = 'vimterminal'
            let test#python#runner = 'pyunit'
            let test#python#pyunit#executable = 'python3.8 -m unittest'
            " let test#python#pyunit#executable = 'python3 -m unittest'
            " Runners available are 'pytest', 'nose', 'nose2', 'djangotest',
            "    'djangonose', 'mamba', and Python's built-in unittest as 'pyunit'
            " let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
            nmap <silent> t<C-n> :TestNearest<CR>
            nmap <silent> t<C-f> :TestFile<CR>
            nmap <silent> t<C-s> :TestSuite<CR>
            nmap <silent> t<C-l> :TestLast<CR>
            nmap <silent> t<C-g> :TestVisit<CR>


" SECTION: ABBREVATIONS
    ia teh the
    ia adn and
    cabbrev GC Google\ Chrome

" SECTION: LEADER KEY SETTINGS
    let maplocalleader = "\<space>"
    let mapleader = "\\"

" SECTION: MY KEY MAPPINGS
    "LEADER KEY MAPPINGS
    nnoremap <C-p> <Up>$
    nnoremap <C-n> <Down>$
    nnoremap <leader>w :update<CR>
    nnoremap <silent> <leader>v :e $MYVIMRC<CR>
    nnoremap <silent> <leader>z :e $HOME/.zshrc<CR>
    nnoremap <leader>r :update<CR> :make %<CR>
    nnoremap <leader>u :UltiSnipsEdit<CR>
    nnoremap <leader>t :filetype detect<CR> " Re-detect filetype*
    nnoremap <leader>f :e <C-R>='$MYVIMDIR/ftplugin/'.&filetype.'.vim'<CR><CR> "*
    nnoremap <leader>i :e <C-R>='$MYVIMDIR/indent/'.&filetype.'.vim'<CR><CR> "*

    nnoremap yoa :ALEToggleBuffer<cr>

    nnoremap <leader>e :e.<cr>
    nnoremap <leader>E :Explore<cr>
    
    "MISCELLANEOUS MAPPINGS
    nnoremap gV `[v`]                   " Visually select pasted or yanked text *
    nnoremap <silent> <BS> :buffer#<cr>
    nnoremap <C-BS> :sbprevious<CR>
    nnoremap ,e :e %:p:h/*              " Faster file / directory navigation
    nnoremap ,g :g//#<Left><Left>       " Fast global commands *
    nnoremap ,m :!mkdir -p %:h<CR> " Make the directory for which the current file should be in

    " command line mappings
    cnoremap <C-y> <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
    " Terminal-mode mappings
    tnoremap jj <C-\><C-n>


" SECTION: MISCELLANEOUS NOTES AND VIMRC FLIRTS 
    " Per-directory .vimrc files
    "set exrc
    "set secure
    "loads a vimrc file after your $MYVIMRC (if wanted)
    "hi MatchParen cterm=none ctermbg=black ctermfg=yellow

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
    augroup END

"tpope refresh mapping
" nmap <Space>r  :so ~/.vimrc<Bar>filetype detect<Bar>doau VimEnter -<CR>
nnoremap Y  y$
" inoremap <C-C> <Esc>`^
" cnoremap <C-R><C-L> <C-R>=substitute(getline('.'), '^\s*', '', '')<CR>

" vim: set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ SECTION\:'?'>1'\:'=':
