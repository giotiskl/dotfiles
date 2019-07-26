if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Add vim-plug itself as a plugin to have docs available
Plug 'junegunn/vim-plug'

""""""""""""""""""""""""""""""""""""""""""
" General environment                    "
""""""""""""""""""""""""""""""""""""""""""
" Fuzzy find support - first line should be changed depending on how you installed fzf
set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'
" Add color themes
Plug 'joshdick/onedark.vim'
Plug 'herrbischoff/cobalt2.vim'
Plug 'altercation/vim-colors-solarized'
" Add a startup screen for vim
Plug 'mhinz/vim-startify'
" Most recently opened files
Plug 'vim-scripts/mru'
" Add Nerdtree (a GUI file explorer)
Plug 'scrooloose/nerdtree'
" Comple completion engine for Vim.
Plug 'neoclide/coc.nvim'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Displays lines indentation
Plug 'Yggdroot/indentLine'
" Comment out code
Plug 'tpope/vim-commentary'
" Dev icons
Plug 'ryanoasis/vim-devicons'
" Syntactic support for different languages
Plug 'sheerun/vim-polyglot'
" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Easy wrap in symbols ("", (), [] etc)
Plug 'tpope/vim-surround'
" Autocompletion for delimiteres (e.g. (), []).
Plug 'Raimondi/delimitMate'


""""""""""""""""""""""""""""""""""""""""""
" JavaScript development related Plugs   "
""""""""""""""""""""""""""""""""""""""""""
" ALE (Asynchronous Lint Engine) is a Plug for providing linting 
" (checking syntax and semantics) in NeoVim 0.2.0+ and Vim 8 
" while you edit your text files
Plug 'w0rp/ale'
" Emmet support (syntax expansion)
Plug 'mattn/emmet-vim'
" Display coloring for hex color codes in CSS
Plug 'gko/vim-coloresque'
" Color picker widget
Plug 'KabbAmine/vCoolor.vim'
" Generate JSDoc
Plug 'heavenshell/vim-jsdoc'
" Autoclose tags
Plug 'alvan/vim-closetag'
" Prettier formatting
Plug 'prettier/vim-prettier'
" Omnicompletion for typescript
Plug 'Quramy/tsuquyomi'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""
" Non plugin config                      "
""""""""""""""""""""""""""""""""""""""""""
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
" set background=dark " Used for solarized theme
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

" CoC Configuration
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Source local .vimlocal if existing
silent! so .vimlocal
