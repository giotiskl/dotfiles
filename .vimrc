"Set font
set encoding=utf8
set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete:h16

"Add key bindings
"jj for ESCAPE
imap jj <Esc>

"Display line numbers
set number

"Set soft tab to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

"Indent files
filetype indent on
set autoindent
set smartindent
imap <C-Return> <CR><CR><C-o>k<Tab>

"Install solarized theme
syntax enable 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colorscheme solarized
set background=dark

"Run pathogen package manager for VIM plugins
execute pathogen#infect()

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
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

"Set NERDTree Toggle keymapping
map <C-n> :NERDTreeToggle<CR>

"Reduce gitgutter's update time
set updatetime=250

"Key bindings for ":Unite file" to <Leader>f
nnoremap <Leader>f :Unite file<CR>

"Bind <Leader>m to :MRU
nnoremap <Leader>m :MRU<CR>

"Remap Emmet to <C-e>
imap <c-e> <C-Y>,
