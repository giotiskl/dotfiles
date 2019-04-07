set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""
" General environment                    "
""""""""""""""""""""""""""""""""""""""""""
" Fuzzy find support - first line should be changed depending on how you installed fzf
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
" Add a startup screen for vim
Plugin 'mhinz/vim-startify'
" Most recently opened files
Plugin 'vim-scripts/mru'
" Add Nerdtree (a GUI file explorer)
Plugin 'scrooloose/nerdtree'
" Fuzzy-search code completion engine for Vim.
Plugin 'Valloric/YouCompleteMe'
" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
" Easy motion
Plugin 'easymotion/vim-easymotion'
" Displays lines indentation
Plugin 'Yggdroot/indentLine'
" Comment out code
Plugin 'tpope/vim-commentary'
" Dev icons
Plugin 'ryanoasis/vim-devicons'
" Syntactic support for different languages
Plugin 'sheerun/vim-polyglot'
" Markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Interactive command execution within vim
Plugin 'Shougo/vimproc.vim'
" Autocompletion for delimiteres (e.g. (), []).
Plugin 'Raimondi/delimitMate'


""""""""""""""""""""""""""""""""""""""""""
" JavaScript development related plugins "
""""""""""""""""""""""""""""""""""""""""""
" ALE (Asynchronous Lint Engine) is a plugin for providing linting 
" (checking syntax and semantics) in NeoVim 0.2.0+ and Vim 8 
" while you edit your text files
Plugin 'w0rp/ale'
" Emmet support (syntax expansion)
Plugin 'mattn/emmet-vim'
" Display coloring for hex color codes in CSS
Plugin 'gko/vim-coloresque'
" Color picker widget
Plugin 'KabbAmine/vCoolor.vim'
" Generate JSDoc
Plugin 'heavenshell/vim-jsdoc'
" Autoclose tags
Plugin 'alvan/vim-closetag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Nerd overriden Inconsolata font for DevIcons support
set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete:h16

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"Add key bindings
"jj for ESCAPE
imap jj <Esc>

"Display line numbers
set number

"Enable ttyfast for faster rendering
set ttyfast

"Set soft tab to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

"Highlight search results and ignore case by default
set hlsearch
set ignorecase
"Map ESC to clear last search
nnoremap <silent> <leader>/ :nohlsearch <cr>

"Set breakindent on by default
set breakindent
set showbreak=.. 

"Indent files
filetype indent on
set autoindent
set smartindent
imap <C-Return> <CR><CR><C-o>k<Tab>

"Install Atom-like Dark One theme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
colorscheme onedark

"Expand return functionality with DelimitMate
"Prevent <> autoclosing to prevent clashing with vim-closetag
let delimitMate_expand_cr=1
let delimitMate_matchpairs = "(:),[:],{:}"

"Display vim-airline
set laststatus=2
set ttimeoutlen=50
"Use vim-airline with devicons
let g:airline_powerline_fonts=1

"Enable omnicomplete and set ctrl+space key binding
filetype plugin on
set omnifunc=syntaxcomplete#Complete
imap aa <c-x><c-o>

"Enable syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

"Closetag plugin options
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"

"Set NERDTree Toggle keymapping
map <C-n> :NERDTreeToggle<CR>

"Reduce gitgutter's update time
set updatetime=250

"Bind <Leader>m to :MRU
nnoremap <Leader>m :MRU<CR>

"Remap Emmet to <C-e>
imap <c-e> <C-Y>,
"Set javascript.jsx ft to behave like jsx so as to expand to className
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

"Configure Fuzzyfinder
nnoremap <C-P> :FZF<CR>

" Make indent line display more beautiful indentation
let g:indentLine_char = '│'

"DevIcons fix spacing
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

":ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}

"Source local .vimlocal if existing
silent! so .vimlocal
