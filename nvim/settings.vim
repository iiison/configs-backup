" vim: fdm=marker fmr={{{,}}}

set encoding=utf8
" set guifont=Fira\ Code:h11
" set guifont=icomoon:h11
" set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11
" set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h11
set guifont=Sauce_Code_Pro_Light_Nerd_Font_Complete_Mono_Light:h12

" Basic editor prefs {{{
set clipboard+=unnamedplus
set errorbells
set diffopt+=vertical
set hidden
set inccommand=nosplit
set keymodel=startsel,stopsel
set mousemodel=popup
set ruler
set scrolloff=3
set showcmd
set nostartofline
set viewoptions=folds,options,cursor,unix,slash
set whichwrap=b,s,<,>,[,]
" }}}

" Whitespace {{{
let &showbreak = '↳ '

set breakindent
set linebreak
set listchars=eol:$,tab:→\ ,space:·,trail:_,extends:»,precedes:«,nbsp:※
set smartindent
" }}}

" Spaces, no tabs {{{
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
" }}}

" Searching {{{
set keywordprg=:help
set smartcase

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
endif
" }}}

" Persistent undo {{{
if exists('+undofile')
  set undofile
  set undodir=~/.config/nvim/.cache/undo
endif
" }}}

" Backups and swap {{{
set backup
set backupcopy=yes
set backupdir=~/tmp
set directory=~/.config/nvim/.cache/swap//

call EnsureExists('~/.config/nvim/.cache')
call EnsureExists(&undodir)
call EnsureExists(&backupdir)
call EnsureExists(&directory)
" }}}

" Wildignore {{{
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll
set wildignore+=.git/*,.bzr/*,.hg/*,.svn/*
set wildignore+=.DS_Store,__MACOSX/*,Thumbs.db
set wildignore+=.sass-cache/*,.cache/*,.tmp/*,*.scssc
set wildignore+=node_modules/*,jspm_modules/*,bower_components/*
" }}}

" Leader {{{
let mapleader=","
let g:mapleader=","
" }}}

" Visual config {{{
if has("nvim")
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

  autocmd VimLeave * set guicursor=a:block-blinkon0
endif

set mouse=a
set nocursorcolumn
set nocursorline
set number
set showmatch
if ($TERMINOLOGY != 1)
  set termguicolors
endif
" }}}

" Folds {{{
let g:xml_syntax_folding=1
let g:perl_fold=1

set foldlevelstart=99
" }}}

" General keymaps and custom commands {{{
command! CDhere call ChangeCurrDir()

" Close window or delete buffer
"noremap <silent> <leader>q :call CloseWindowOrKillBuffer()<CR>
noremap <silent> <leader>q <C-W>c
" noremap <silent> <leader>dd :bdelete<CR>

" Backspace in visual mode deletes selection
vnoremap <BS> d

" Duplicate current line
nnoremap <M-d> YPj$

" Open/close folds
nnoremap <silent> + zo
nnoremap <silent> - zc

" Quickly sort selection
vnoremap <leader>s :sort i<CR>
vnoremap <leader>S :sort<CR>

" Buffers - previous/next: S-F12, F12
nnoremap <silent> <leader>{ :bp<CR>
nnoremap <silent> <leader>} :bn<CR>

" Reselect block after indenting
vnoremap < <gv
vnoremap > >gv

" Smart home
" http://vim.wikia.com/wiki/Smart_home
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
imap <Home> <C-O><Home>

" Quickly toggle list
nnoremap <leader>l :set list!<CR>

" Clear search highlight
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Saner n/N behaviour
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" Command-line history
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Saner redraw
nnoremap <leader>r :nohlsearch<CR>:diffupdate<CR>:syntax sync fromstart<CR><C-L>

" Exit out of terminal mode on double esc
if has("nvim")
  tnoremap <Esc><Esc> <C-\><C-N>
endif

" Show syntax highlighting group for word under cursor
function! <SID>SynStack()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
nnoremap <M-u> :call <SID>SynStack()<CR>

" }}}

" General autocmds {{{

" Easily close HTML tags
" http://vim.wikia.com/wiki/Auto_closing_an_HTML_tag
"autocmd FileType html,xml inoremap <buffer> </ </<C-X><C-O><C-N><Esc>a
"autocmd FileType html,xml inoremap <buffer> <<kDivide> </<C-X><C-O><C-N><Esc>a

" Toggle cursorline on entering insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave *  set nocursorline

autocmd FileType coffee setl foldmethod=indent
autocmd FileType markdown setl nolist textwidth=0
autocmd FileType python setl foldmethod=indent
autocmd FileType text setl textwidth=78
autocmd FileType vim setl foldmethod=indent

" Set *.vue files as html
" autocmd BufRead,BufNewFile *.vue set filetype=html

" Set *scss files as scss.css
autocmd BufRead,BufNewFile *.scss set filetype=scss.css

" Go back to previous cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe 'normal! g`"zvzz' |
  \ endif

" }}}

" Colorscheme {{{
" source ~/.config/nvim/fixcolors.vim

let g:seoul256_background = 235
" let g:tender_airline = 1
let g:wwdc16_term_italics = 1
let g:wwdc16_term_trans_bg = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 0
let g:neodark#use_256color = 1
let g:neodark#terminal_transparent = 1
let g:quantum_black = 1
let g:quantum_italics = 1
let g:spacegray_italicize_comments = 1
let g:airline_theme = 'one'
" let g:airline_theme = 'deep_space'
let g:one_allow_italics = 1

set background=dark

colorscheme one
" }}}

" Plugin settings {{{

" Utilities {{{

" MarcWeber/vim-addon-local-vimrc
let g:local_vimrc = {'names': ['.vimlocal'], 'hash_fun': 'LVRHashOfFile'}

" editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', 'term://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" mhinz/startify
let g:startify_session_dir = '~/.config/nvim/.cache/startify'
let g:startify_list_order = [
  \ ['Recently opened files'],
  \ 'files',
  \ ['Sessions'],
  \ 'sessions',
  \ ['Bookmarks'],
  \ 'bookmarks',
  \ ['Commands'],
  \ 'commands',
  \ ]
let g:startify_bookmarks = ['~/Documents/redmart-repo/Partner-Portal-V2', '~/Documents/redmart-repo/partner-portal', '~/.config/nvim/', '~/.zshrc', '~/.config/alacritty/alacritty.yml']
let g:startify_commands = [':PlugUpdate', ':PlugInstall']
let g:startify_update_oldfiles = 1
let g:startify_session_before_save = [
  \ 'echo "Cleaning up before saving..."',
  \ 'silent! NERDTreeTabsClose'
  \ ]
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 0
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 0
let g:startify_enable_special = 0
let g:startify_session_sort = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
" let g:startify_custom_header = []
let g:startify_show_sessions = 1
" nnoremap <M-F1> :Startify<CR>

" mhinz/vim-grepper
let g:grepper = {}
let g:grepper.dir = 'repo,cwd'
nnoremap <leader>ag :Grepper -tool ag -grepprg ag --vimgrep --ignore \(node_modules\\|bower_components\)<CR>
nnoremap <leader>af :Grepper -buffers<CR>

" qpkorr/vim-bufkill
nmap <silent> <leader>dd :BD<CR>

" tpope/vim-fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gx :Gremove<CR>
nnoremap <silent> <leader>ga :Git add -- .<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" }}}

" Editing {{{

" Raimondi/delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
autocmd FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"

" heavenshell/vim-jsdoc
let g:jsdoc_enable_es6 = 1
nnoremap <silent> <C-CR> :JsDoc<CR>

" jiangmiao/auto-pairs
let g:AutoPairsShortcutToggle = ''

" junegunn/goyo.vim

" junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" mattn/emmet-vim
" let g:user_emmet_leader_key = '<Tab>'
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 1
let g:emmet_html5 = 1
" let g:user_emmet_expandabbr_key = '<C-E>'
" let g:user_emmet_expandword_key = '<C-S-E>'

" let g:user_emmet_leader_key = '<Tab>'
" let g:user_emmet_settings = {
"       \ 'javascript.jsx' : {
"       \ 'extends' : 'jsx',
"       \ },
"       \}

" scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1

" shime/vim-livedown
let g:livedown_autorun = 1
let g:livedown_port = 8999
let g:livedown_open = 0
nnoremap <leader>md :LivedownToggle<CR>

" tomtom/tcomment
let g:tcomment_maps = 0
let g:tcomment#filetype#guess = 0

nmap <leader>cc :TComment<CR>
nmap <leader>cm :TCommentBlock<CR>
nmap <leader>ci :TCommentInline<CR>
nmap <leader>cr :TCommentRight<CR>

vmap <leader>cc :TComment<CR>
vmap <leader>cm :TCommentBlock<CR>
vmap <leader>ci :TCommentInline<CR>
vmap <leader>cr :TCommentRight<CR>

" tpope/vim-commentary
" nmap <leader>cc gcc
" nmap <leader>ca gcgc
" vmap <leader>cc gc

" tpope/vim-repeat

" tpope/vim-speeddating

" tpope/vim-surround

" tpope/vim-unimpaired
nmap <M-S-Up> [e
nmap <M-S-K> [e
nmap <M-S-Down> ]e
nmap <M-S-J> ]e
vmap <M-S-Up> [egv
vmap <M-S-K> [egv
vmap <M-S-Down> ]egv
vmap <M-S-J> ]egv

" }}}

" Autocomplete {{{

" Shougo/context_filetype.vim

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1

function! s:check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

call deoplete#custom#source('_', 'matchers', ['matcher_length', 'matcher_full_fuzzy'])

" carlitux/deoplete-ternjs

" ternjs/tern_for_vim
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" }}}

" Linting {{{

" neomake/neomake
let g:neomake_html_enabled_makers = []
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_open_list = 2
let g:neomake_list_height = 2
let g:neomake_warning_sign = {
  \ 'text': '',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '',
  \ 'texthl': 'ErrorMsg',
  \ }
" autocmd! BufWritePost * Neomake

" w0rp/ale
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%severity%][%linter%] %s'
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 0

let g:ale_linters = {
  \ 'css': ['stylelint'],
  \ 'html': [],
  \ 'sass': ['stylelint'],
  \ 'scss': ['stylelint']
  \ }

" }}}

" Navigation {{{

" junegunn/fzf

" junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -l --hidden --ignore .git -g ""'
nmap <M-p> :FZF<CR>
nmap <M-P> :Buffers<CR>

" scrooloose/nerdtree
let NERDTreeBookmarksFile = '~/.config/nvim/.cache/NERDTreeBookmarks'
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeChDirMode = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let g:NERDTreeFileExtensionHighlightFullName = 1

nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>

" ctrlpvim/ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  'git\svn\|node_modules\|dist\|build\|DS_Store\|coverage',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_mruf_save_on_update = 0
let g:ctrlp_mruf_relative = 0
let g:ctrlp_max_files = 0

nnoremap <C-p> :CtrlP<CR>
nnoremap <C-P> :CtrlPLine<CR>

" eugen0329/vim-esearch
let g:esearch = {
  \ 'adapter': 'ag',
  \ 'backend': 'nvim',
  \ 'out': 'win',
  \ 'batch_size': 2000,
  \ 'use': ['visual', 'hlsearch', 'last', 'word_under_cursor'],
  \ }

" Keymappings for eugen0329/vim-esearch
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<leader>ff', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<leader>fw', 'esearch-word-under-cursor')

call esearch#out#win#map('t',       'tab')
call esearch#out#win#map('i',       'split')
call esearch#out#win#map('s',       'vsplit')
call esearch#out#win#map('<Enter>', 'open')
call esearch#out#win#map('o',       'open')

" Open silently (keep focus on the results window)
call esearch#out#win#map('T', 'tab-silent')
call esearch#out#win#map('I', 'split-silent')
call esearch#out#win#map('S', 'vsplit-silent')

" Move cursor with snapping
call esearch#out#win#map('<C-n>', 'next')
call esearch#out#win#map('<C-j>', 'next-file')
call esearch#out#win#map('<C-p>', 'prev')
call esearch#out#win#map('<C-k>', 'prev-file')

call esearch#cmdline#map('<C-o><C-r>', 'toggle-regex')
call esearch#cmdline#map('<C-o><C-s>', 'toggle-case')
call esearch#cmdline#map('<C-o><C-w>', 'toggle-word')
call esearch#cmdline#map('<C-o><C-h>', 'cmdline-help')

" Colors
hi ESearchMatch ctermfg=black ctermbg=white guifg=#000000 guibg=#E6E6FA



" junegunn/limelight.vim
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.8

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Goyo Integration
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" vim-ctrlspace/vim-ctrlspace
" let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

" if executable('ag')
"   let g:CtrlSpaceGlobCommand = 'ag -l --hidden --no-color -g ""'
" endif

" nnoremap <silent><C-Space> :CtrlSpace<CR>
" nnoremap <silent><C-P> :CtrlSpace O<CR>

" wesQ3/vim-windowswap

" }}}

" Information {{{

" airblade/vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_modified_removed = '∓'

" nathanaelkane/vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'bufs'
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s?'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '�', '-']
" let g:airline#extensions#ale#warning_symbol = '⚠️'
" let g:airline#extensions#ale#error_symbol = '❌'
"
" let g:airline_symbols = {}
"
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.crypt = '🔑'
" let g:airline_symbols.readonly = '⛔'
" let g:airline_symbols.linenr = '📄'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '🔀'
" let g:airline_symbols.paste = '📋'
" let g:airline_symbols.spell = '🔤'
" let g:airline_symbols.notexists = '❎'
" let g:airline_symbols.whitespace = '⚪'
"
let g:airline_section_c = '%{FilenameOrTerm()}'

function! FilenameOrTerm()
  return exists('b:term_title') ? b:term_title : expand('%:t')
endfunction

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

" yggdroot/indentline
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'

nnoremap <leader>il :IndentLinesToggle<CR>

" }}}

" Syntax {{{

" ap/vim-css-color

" digitaltoad/vim-jade

" docunext/closetag.vim

" gabrielelana/vim-markdown
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_input_abbreviations = 0

" gregsexton/MatchTag

" jelera/vim-javascript-syntax

" kchmck/vim-coffee-script

" mxw/vim-jsx
" let g:jsx_ext_required = 0

" MaxMEllon/vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

"othree/html5.vim

"othree/javascript-libraries-syntax
" let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,jasmine,ramda'

" othree/yajs.vim

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" posva/vim-vue

" }}}

" }}}


" Don't copy deleted value:
vnoremap r “_dP

" upgrading to python3
" source: https://ricostacruz.com/til/neovim-with-python-on-osx
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

