" VARIABLE ASSIGNMENTS 
let $MYVIMRC="~/.vimrc"
let $MYVIMDIR="~/.vim"
let $RTP="/usr/local/share/vim/vimfiles/"

" VANILLA VIM SETTINGS
    set nocompatible        "required
    " filetype off            "required


    set history=400		"setting history to 400
    set ruler		"show the cursor position
    " set rnu			"turn relative line numbers on
    set showcmd			"showing incomplete commands
    set wildmenu		"shows a menu when using tab completion
    " set scrolloff=3		"setting the ctrl+z function to have some extra top space	
    set incsearch		"show search matches as you type
    set cursorline		"displays the cursor line off-color scheme for easy reading
    set number			"turn on line numbering	
    set lbr			"setting up a better linewrap
    set spelllang=en_us 	"setting spell check to english
    runtime ftplugin/man.vim "can use the man pages within vim
    set showcmd		"show the command as you're writing
    set ai			"setting up auto indent
    set si			"settin up smart indent
    "set nrformats=		"setting up decimal notation for arithmetic
    set hid			"setting hidden or switch through unsaved buffers
    set complete+=kspell	" Use word completion when spelling is enabled

    set softtabstop=4 	"Number of spaces inserted when inputting tab
    set tabstop=8		
    set shiftwidth=4
    set path+=**
    set wildignore+=**/virtualenv_run/**.*.pyc,*.pyo.__pycache__,*.swp
    "set splitright		"default split is to the right of the file 
    " set noswapfile		"no swap files
    "set belloff=all

    "setting viminfofile (see help viminfo to understand understand pattern)
    set viminfo='100,<1000,s100,!,%,h

    " set foldmethod=indent
    " set foldlevel=1

    set esckeys
    set ttimeoutlen=50	"delay from inputting to enacting a key mapping (50 default)
    set timeoutlen=400

    syntax enable		"use 'syntax on' to lock in default colors
    set bg=dark			"ensuring vim knows the background
    set t_Co=256
    colorscheme solarized
    highlight clear SignColumn
    highlight clear Terminal
    "set g:solarized_termtrans=1

    filetype plugin indent on "To see a customized listing for each detected filetype go to “~/.vim/**/ftplugin/”



    set rtp+=/usr/local/opt/fzf "for fzf
    set shell=/bin/zsh 
    set mouse=a			" enabling mouse for vim
    "modifyOtherKeys (see help for more info) disabled
" NETRW SETTINGS
    let g:netrw_banner = 0		"no header banner
    let g:netrw_liststyle = 3	"default to tree style format
    "let g:netrw_winsize = 20	"default window size
    "let g:netrw_preview = 1	"default for PREVIEW file to be a vertical split (P.S. to close a preview use Ctrl-W,Z)
    "let g:netrw_altv=1		"default window split is to the right
    let g:netrw_list_hide='*.swp,.*\.swp$,.*\.pyc$'  " ,.*.pyc'
    let g:solarized_diffmode="low"
" PLUGINS (MANAGED BY MINPAC) 
    " Try to load minpac.
    packadd minpac

    if !exists('*minpac#init')
      " minpac is not available.

      " Settings for plugin-less environment.
      ...
    else
      " minpac is available.
      call minpac#init()
      call minpac#add('k-takata/minpac', {'type': 'opt'})

      " Additional plugins here.
      call minpac#add('tpope/vim-dispatch')
      call minpac#add('tpope/vim-projectionist')
      call minpac#add('tpope/vim-commentary')
      call minpac#add('tmhedberg/matchit')
      call minpac#add('tpope/vim-capslock')

      call minpac#add('dense-analysis/ale')
      call minpac#add('prettier/vim-prettier', {'type': 'opt'})
      call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
      call minpac#add('tpope/vim-surround')
      call minpac#add('vim-scripts/taglist.vim')
      call minpac#add('sheerun/vim-polyglot', {'type': 'opt'})
      call minpac#add('junegunn/fzf', {'type': 'opt'})
      call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
      call minpac#add('junegunn/vim-easy-align')
      call minpac#add('SirVer/ultisnips')
      call minpac#add('adriaanzon/vim-emmet-ultisnips')
      " call minpac#add('honza/vim-snippets') "Saved in my documents directory files for... 'vImspiration'

      call minpac#add('nelstrom/vim-visual-star-search')
      call minpac#add('michaeljsmith/vim-indent-object')

      call minpac#add('christoomey/vim-tmux-runner')
      call minpac#add('janko/vim-test')
      call minpac#add('vim-airline/vim-airline')
      call minpac#add('tpope/vim-unimpaired')
      call minpac#add('tpope/vim-repeat')
      call minpac#add('habamax/vim-sendtoterm')
      "

      " Plugin settings here.
	  let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
	  let g:VtrOrientation = "h"
    endif

    " FZF mappings
	nnoremap <silent> f :Files<CR>
	nnoremap <silent> f<c-f> :Filetypes<CR>
	nnoremap <silent> f :Buffers<CR>
	nnoremap <silent> f<c-w> :Windows<CR>
	nnoremap <silent> f<c-l> :Lines<CR>
	nnoremap <silent> f<c-l><c-l> :BLines<CR>
	nnoremap <silent> f :Tags<CR>
	nnoremap <silent> f :Btags<CR>
	nnoremap <silent> f<c-h> :History<CR>
	nnoremap <silent> f :Commits<CR>
	nnoremap <silent> f :Bcommits<CR>
	nnoremap f<space>	:Locate 

    " common settings here.
	"  ...
	"  vim-test settings (and mappings)
	 
	    let test#strategy = 'dispatch'
	    let test#python#runner = 'pyunit'
	    let test#python#pyunit#executable = 'python3.8 -m unittest'
	    " let test#python#pyunit#executable = 'python3 -m unittest'
	    " Runners available are 'pytest', 'nose', 'nose2', 'djangotest',
	    "	 'djangonose', 'mamba', and Python's built-in unittest as 'pyunit'
	    " let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
	    nmap <silent> t<C-n> :TestNearest<CR>
	    nmap <silent> t<C-f> :TestFile<CR>
	    nmap <silent> t<C-s> :TestSuite<CR>
	    nmap <silent> t<C-l> :TestLast<CR>
	    nmap <silent> t<C-g> :TestVisit<CR>
	
    


	" Start interactive EasyAlign in visual mode (e.g. vipga)
	    xmap gl <Plug>(EasyAlign)
	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	    nmap gl <Plug>(EasyAlign)
" GLOBAL ALIASES
    command! PackUpdate call minpac#update()
    command! PackClean call minpac#clean()
    command! PackStatus call minpac#status()

" ABBREVATIONS
    ia teh the 
    ia adn and
    cabbrev GC Google\ Chrome


" LEADER KEY SETTINGS
    let maplocalleader = " "
    let mapleader = " "


" MY KEY MAPPINGS
    nnoremap <leader>w :update<cr>
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    " ZOOM A VIM PANE, <C-w>= to re-balance
    nnoremap <silent> <leader>= :wincmd =<cr>
    nnoremap [oa :ALEDisableBuffer<cr>
    nnoremap ]oa :ALEEnableBuffer<cr>

    "Vtr Key Mappings
	nnoremap <leader>atp   :VtrAttachToPane<cr>
	nnoremap <leader>ror  :VtrReorientRunner<cr>
	nnoremap <leader>sc   :VtrSendCommandToRunner<cr>
	nnoremap <leader>sf   :VtrSendFile<cr>
	nnoremap r<C-l>   :VtrSendLinesToRunner<cr>
	xnoremap r<C-l>   :VtrSendLinesToRunner<cr>
	nnoremap <leader>or   :VtrOpenRunner<cr>
	nnoremap <leader>kr   :VtrKillRunner<cr>
	nnoremap <leader>fr   :VtrFocusRunner<cr>
	nnoremap <leader>dr   :VtrDetachRunner<cr>
	nnoremap <leader>cr   :VtrClearRunner<cr>
	nnoremap <leader>fc   :VtrFlushCommand<cr>
	nnoremap <leader>sl   :VtrSendLinesToRunner<cr>
    
    "Netrw quick maps
    nnoremap <leader>e :e.<cr>
    nnoremap <leader>E :Explore<cr>
    nnoremap <leader>r :update<cr> :make %<cr>
    
    "Miscellaneous mappings
    nnoremap <leader>u :UltiSnipsEdit<cr>
    nnoremap  :b#<cr>
    
    

" AUTOCOMMAND MAPPINGS
    autocmd VimResized * :wincmd = "automatically rebalance windows on vim resize


" MISCELLANEOUS NOTES AND VIMRC FLIRTS 
    " Per-directory .vimrc files
    "set exrc
    "set secure
    "loads a vimrc file after your $MYVIMRC (if wanted)
    "hi MatchParen cterm=none ctermbg=black ctermfg=yellow


" " Kill bad habits 
"     noremap h <nop>
"     noremap j <nop>
"     noremap k <nop>
"     noremap l <nop>
"     " inoremap <esc> <nop>
