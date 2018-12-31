call plug#begin('~/.config/nvim/plugged')
" Theme
" regular colorscheme
Plug 'fenetikm/falcon'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'rakr/vim-one'
" Plug 'altercation/vim-colors-solarized'
" high contrast colorscheme
Plug 'agude/vim-eldar'
" white colorscheme
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
" Linting
Plug 'w0rp/ale'
" Other stuff
Plug 'scrooloose/nerdtree' " File explorer
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'airblade/vim-gitgutter' " Git diffs in gutter
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'shime/vim-livedown' " Markdown preview
Plug 'jiangmiao/auto-pairs' " Helps with { } stuff
Plug 'nathanaelkane/vim-indent-guides' " Indent lines
Plug 'easymotion/vim-easymotion' " Makes motion commands better
Plug 'Shougo/neosnippet.vim' " Snippets
Plug 'Shougo/neosnippet-snippets'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'jodosha/vim-godebug'

" Language specific
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'

" JS specific
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'

" Note taking
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc' " required for vim-notes
" Autocompletion

" C#
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-dispatch', {'do': 'make'}

Plug 'johngrib/vim-game-code-break'
Plug 'AndrewRadev/splitjoin.vim'


call plug#end()

" Map the leader key to
let mapleader=","

let g:onedark_lightline = 1

let g:lightline = {
   \ 'colorscheme': 'onedark',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	 \   'right': [ [ 'filetype' ] ]
   \ },
   \ 'inactive': {
	 \    'left': [['filename']],
	 \    'right': [['filetype']]
   \  },
   \ 'component_function': {
   \   'gitbranch': 'fugitive#head'
   \ },
   \ }
let g:lightline.separator = { 'left': '', 'right': '' }
syntax on
"colorscheme one
"set background=dark
"let g:neodark#background = '#202020'
"colorscheme neodark
"syntax enable
set background=dark
"colorscheme solarized
"colorscheme palenight
colorscheme onedark
"colorscheme falcon
" high contrast colorscheme
" colorscheme eldar
" Light colorscheme
" set background=light
" colorscheme PaperColor

" Enables italics
highlight Comment cterm=italic

" Hides regular status bar
set noshowmode
set noruler
set noshowcmd

" Set default clipboard to system clipboard
set clipboard=unnamed

" highlight the 80th column as an indicator
set colorcolumn=80
" Autosave
set autowrite

" disable swapfile usage
set noswapfile

" let vim set the terminal title
set title
set updatetime=100                " redraw the status bar often

" Shows line numbers
set number
set relativenumber
set completeopt-=preview

" Use 24-bit (true-color) mode in Vim/Neovim
set termguicolors

" Makes stuff open to the right and below
set splitright
set splitbelow

" Tab settings - tabs converted to 4 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Go tab settings
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2

" Go tab settings
au FileType js set shiftwidth=2
au FileType js set softtabstop=2
au FileType js set tabstop=2

" yml
au FileType yml set shiftwidth=2

" ignore case when search is lowercase
set smartcase
set ignorecase

" Show type info after 250ms (default 800 ms)
set updatetime=250

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" don't open the preview window
set completeopt-=preview


"----------------------------------------------
"" Navigation
"----------------------------------------------
"" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" fzf
nmap ; :Files<CR>
nmap <leader>t :Buffers<CR>
nmap <leader>fl :BLines<CR>
nmap <leader>fal :Lines<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 's': 'vsplit' }

nnoremap - ;

let NERDTreeWinPos='left'
"
" Close NerDTREE and quit if it is the last thing open when :q
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e"

" leader shortcuts
" Source config
" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
" Shortcut to source (reload) THIS configuration file after editing it:
" (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>
" Write
noremap <leader>w :w<CR>
" Explore
noremap <leader>e :NERDTreeFind<CR>
nnoremap <silent> <Space> :NERDTreeToggle<CR>
" Close
noremap <leader>cl :close<CR>
" Vertical split
noremap <leader>vs :vsp<CR><C-W><C-h>
" Horizontal split
noremap <leader>hs :split<CR>
" Only
noremap <leader>o :only<CR>
" Yank a page
noremap <leader>yp <ESC>gg<bar><S-v><bar>G<bar>"*y
" close a buffer and keep split window open
noremap <leader>cb :b#<bar>bd#<bar>bn<bar>b#<CR>
" close buffer
nnoremap + :bd <CR>
" Play macro from q
noremap <leader>q @q
" syntax json
noremap <leader>json :set syntax=json<CR>:%!python -m json.tool<CR>
" syntax xml
noremap <leader>xml :set syntax=xml<CR>:%!xmllint --format -<CR>
" syntax html
noremap <leader>html :call FormatHTML()<CR>
" jump to the end of yank or paste
noremap <leader>' ']
" jump to next / previous error
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<CR>
" Insert current date
nnoremap <leader>dd :put =strftime('%Y-%m-%d')<CR>
" search for a character
nmap s <Plug>(easymotion-overwin-f)
" next and previous buffer
noremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>
" Switch windows
nnoremap <leader><Tab> <C-W><C-W>
" Close bottom window (quickfix window usually)
nnoremap <leader>cq <C-w><C-j>:close<CR>
" SearchNotes
nnoremap <leader>sn :SearchNotes
" Open up current file in chrome
nmap <silent> <leader>ch :exec 'silent !open -a "Google Chrome" % &'


" Go shortcuts
au FileType go nmap <Leader>gp <Plug>(go-def-pop)
au FileType go noremap <leader>gb :GoBuild<CR>
au FileType go noremap <leader>gr :only<CR> :GoRun<CR>
au FileType go noremap <leader>gn :GoRename<Space>
au FileType go noremap <leader>gef :GoReferrers<CR>
au FileType go noremap <leader>gt :GoTest<CR>
au FileType go noremap <leader>gl :GoLint<CR>
au FileType go noremap <leader>gi :GoInfo<CR>
au FileType go noremap <leader>ga :GoAddTags<CR>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go noremap <leader>gv :GoRemoveTags<CR>
au FileType go nmap <leader>gd <Plug>(go-def-vertical)
" Add a split window and go the current definition
au FileType go nnoremap <leader>vng :vsplit<CR> gd

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_command = "goimports"

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1
" let g:go_gocode_autobuild = 0 "disable vim-go autocompletion
" let g:go_addtags_transform = "snakecase"
let g:go_addtags_transform = "camelcase"

" :ALEFix will try and fix JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint']
\}

let g:ale_linters = {
\ 'go': ['go build', 'golint', 'gofmt', 'go vet', 'go'],
\ 'cs': ['OmniSharp']
\}

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_sign_column_always = 1
hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

" Make `jk` throw you into normal mode
inoremap jk <esc>

