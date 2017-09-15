if &compatible
    set nocompatible
endif

filetype plugin on

set encoding=utf-8
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set termguicolors

" --- Plugins ------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" --- Editor stuff
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'

" --- IDE stuff
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'Numkil/ag.nvim'

" Tags
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'craigemery/vim-autotag'
Plug 'ternjs/tern_for_vim'

" Fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" Syntax plugins
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" Autocomplete
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Quramy/tsuquyomi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" --- Eye candy
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'jnurmine/Zenburn'
Plug 'mhartington/oceanic-next'
Plug 'trevordmiller/nova-vim'
Plug 'Drogglbecher/vim-moonscape'

call plug#end()

" --- Interface ----------------------------------------------------------------
colorscheme zenburn

" --- Visual
" Show line numbers
set number
" Highlight current line by showing horizontal cursorline
set cursorline
" Show vertical cursorline for cursor crosshair
set cul cuc
" Highlight matching bracket
set showmatch
" Expected pairs
set matchpairs=(:),[:],{:}
" Show the leading whitespaces"
set list listchars=tab:»·,trail:·,nbsp:+
" Show unprintables as <xx>
set display+=uhex
" Show as much as possible of the last line
set display+=lastline

" --- Scroll & split behaviour
" Keep at least 5 lines above/below
set scrolloff=7
" Keep at least 7 lines left/right
set sidescrolloff=7
" Do not jump to first character with page jumps
set nostartofline
" Split right instead of left
set splitright
" Split below
set splitbelow

" --- Whitespace behaviour
" Soft wrapping, without changing text
set nowrap
" Only break on characters in 'breakat'
set linebreak
" Use fancy symbols to indicate linebreak
if has('multi_byte')
  let &showbreak = '↳ '
else
  let &showbreak = '> '
endif
" Use indent from previous line
set autoindent
set smartindent
" TODO find out what that setting does
set smarttab
" Default tab stops
set tabstop=2
" Default auto indent
set shiftwidth=2
set softtabstop=2
" Use spaces instead of tabs
set expandtab
" If backspace was any smarter it'd send a terminator back in time
set backspace=indent,eol,start

" --- Search options
set ignorecase    " Ignore case when searching
set smartcase     " Except when uppercase is used
set incsearch     " Show matches live while typing
set hlsearch      " Highlight all search matches, turn off with :noh

" --- Auto complete options
set wildmode=list:longest,full  " TODO document the awesomeness of this
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.pyo,*.pyd,*.class,*.lock
set wildignore+=*.png,*.gif,*.jpg,*.ico
set wildignore+=',.svn,.hg
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem

" --- Shortcuts ----------------------------------------------------------------
" Remap leader to the easier reachable ,
let mapleader=","

" Make copy & paste from clipboard easier
nmap <Leader>p "+p
nmap <Leader>y "+yy

" Clear search highlight
nmap <Leader>q :nohlsearch<CR>

" Search for word under cursor in CWD
nnoremap <Leader>s :exec "Ag  -f ".expand("<cword>")<cr>

" Refactor names easily: hit <leader>[ with cursor on the word you'd like to rename
nnoremap <leader>[ :%s/<c-r><c-w>//g<left><left>

" Toggle Tagbar
nnoremap <leader>; :TagbarToggle<cr>

" Toggle Nerdtree
nnoremap <leader>, :NERDTreeToggle<cr>

" Toggle Undotree
nmap <Leader>u :UndotreeToggle<CR>

" Jump to current file in Nerdtree
nmap <leader>N :NERDTreeFind<cr>

" Easier buffer switching
nmap <C-e> :b#<CR>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprev<CR>
nnoremap <silent> <tab> :wincmd l<CR>
nnoremap <silent> <S-tab> :wincmd h<CR>

" CtrlP
nmap ; :CtrlPBuffer<CR>

" nvim-typescript
au filetype typescript nnoremap <buffer> gd :TSDef<CR>
au filetype typescript nnoremap <buffer> gr :TSRefs<CR>
au filetype typescript nnoremap <buffer> K :TSDefPreview<cr>
au filetype typescript nnoremap <buffer> D :TSDoc<cr>
au filetype typescript nnoremap <buffer> R :TSRename<cr>
au filetype typescript nnoremap <buffer> I :TSImport<cr>
au filetype typescript nnoremap <buffer> <leader>d :TSTypeDef<cr>

" --- Plugin config ------------------------------------------------------------
" ---- CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1 " 0 - Search by full path, not just filename
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules|CVS|tmp|Library|Applications|dist|build|docs|Music|[^\/]*-store)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \
    \ }
if executable('ag')
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  "let g:ctrlp_user_command = 'ag  --ignore tags --ignore /cache/ %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = {
        \ 'types' : {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \
        \ }
        \ }
endif

" --- Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_menu_width = -1
" let g:deoplete#sources = get(g:, 'deoplete#sources', {})
" let g:deoplete#sources._ = ['omni', 'buffer']
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" LanguageClient-neovim
set hidden
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
"     \ 'typescript': ['~/bin/javascript-typescript-langserver/lib/language-server-stdio.js'],
"     \ }

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
" nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" --- nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" --- tagbar
" let g:tagbar_type_typescript = {
"   \ 'ctagsbin' : 'tstags',
"   \ 'ctagsargs' : '-f-',
"   \ 'kinds': [
"     \ 'e:enums:0:1',
"     \ 'f:function:0:1',
"     \ 't:typealias:0:1',
"     \ 'M:Module:0:1',
"     \ 'I:import:0:1',
"     \ 'i:interface:0:1',
"     \ 'C:class:0:1',
"     \ 'm:method:0:1',
"     \ 'p:property:0:1',
"     \ 'v:variable:0:1',
"     \ 'c:const:0:1',
"   \ ],
"   \ 'sort' : 1
" \ }
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:const:0:1',
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions:0:1',
    \ 'm:method:0:1',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" --- ag.nvim
let g:ag_highlight=1

" --- ysuqoyomi
" let g:tsuquyomi_disable_default_mappings = 1
" let g:tsuquyomi_completion_detail = 1

" nvim-typescript
let g:nvim_typescript#default_mappings = 0
let g:nvim_typescript#loc_list_item_truncate_after=-1
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1

" --- Helpers ------------------------------------------------------------------
" --- Always jump to last known position if valid
if has ("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" --- Strip trailing whitespace
function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction
if has("autocmd")
  autocmd BufWritePre *  call StripTrailingWhite()
endif

" --- Syntax specific settings -------------------------------------------------
" --- JavaScript/Typescript
if has("autocmd")
  " Enable ES2016 Template String HTML highlighting
  autocmd FileType javascript JsPreTmpl html

  autocmd FileType typescript JsPreTmpl html
  autocmd FileType typescript syn clear foldBraces

  autocmd BufNewFile,BufRead *.ejs set filetype=html
  " au filetype javascript LanguageClientStart
  " au filetype typescript LanguageClientStart

  " Highlighting inside JSDoc
  "let g:javascript_plugin_jsdoc = 1
endif
