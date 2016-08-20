"Run pathogen package manager for VIM plugins
execute pathogen#infect()

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
set smartindent

"Install solarized theme
syntax enable 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colorscheme solarized

"Display vim-airline
set laststatus=2
set ttimeoutlen=50

"Set font
set guifont=Monaco:h14

"Enable HTML Autocompletion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Closetag plugin options
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
