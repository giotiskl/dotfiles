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

"Run pathogen package manager for VIM plugins
call pathogen#infect('bundle/*')

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
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx"

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
set rtp+=~/.fzf
nnoremap <C-P> :FZF<CR>

"DevIcons fix spacing
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

"Source local .vimlocal if existing
silent! so .vimlocal

":ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
"Run ALE linters only on file save, not as text is typed
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
