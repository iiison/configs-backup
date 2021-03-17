" vim: fdm=marker fmr={{{,}}}

" Vim Doc - 
" http://vimdoc.sourceforge.net/htmldoc/options.html
" https://stackoverflow.com/questions/962064/unable-to-understand-a-line-in-vimrc
" https://github.com/Gonzih/vim-keymap/blob/master/keymap.md

set encoding=UTF-8
" set guifont=Sauce_Code_Pro_Light_Nerd_Font_Complete_Mono_Light:h12
" set guifont=Source\ Code\ Pro\ ExtraLight:h12
set guifont=SauceCodePro\ Nerd\ Font\ ExtraLight:h12

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
let &showbreak = 'â†³ '

set breakindent
set linebreak
"set listchars=eol:$,tab:â†’\ ,space:Â·,trail:_,extends:Â»,precedes:Â«,nbsp:â€»
set smartindent
" set autoindent
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

if (has("termguicolors"))
  set termguicolors
endif
" }}}

" Folds {{{
let g:xml_syntax_folding=1
let g:perl_fold=1

set foldlevelstart=99
" }}}

" Auto-Load new changes out of vim {{{
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
"}}}

" General keymaps and custom commands {{{
command! CDhere call ChangeCurrDir()

" Open Explore {{{
vnoremap <leader>, :Explore<cr>
nnoremap <leader>, :Explore<cr>
" }}}

" Custom keymaps {{{ 
vnoremap <leader>k :w<cr>
nnoremap <leader>k :w<cr>

vnoremap <leader>n :q<cr>
nnoremap <leader>n :q<cr>

vnoremap <leader>q :q!<cr>
nnoremap <leader>q :q!<cr>

vnoremap <leader>m :BD<cr>
nnoremap <leader>m :BD<cr>
" }}}

" Close window or delete buffer
"noremap <silent> <leader>q :call CloseWindowOrKillBuffer()<CR>
" noremap <silent> <leader>q <C-W>c
" noremap <silent> <leader>dd :bdelete<CR>

" Duplicate current line
nnoremap <M-d> YPj$

" Open/close folds
nnoremap <silent> + zo
nnoremap <silent> - zc

" Quickly sort selection
vnoremap <leader>s :sort i<CR>
vnoremap <leader>S :sort<CR>

" Buffers - previous/next: S-F12, F12
nnoremap <silent> <leader>[ :bp<CR>
nnoremap <silent> <leader>] :bn<CR>

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
" function! <SID>SynStack()
"     if !exists('*synstack')
"         return
"     endif
"     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunction
" nnoremap <M-u> :call <SID>SynStack()<CR>

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
autocmd FileType javascript setl foldmethod=indent
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


" ***********************************************
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
" let g:airline_theme = 'hybrid'
let g:airline_theme = 'distinguished'
" let g:airline_theme = 'distinguished'
" let g:airline_theme = 'deep_space'
let g:one_allow_italics = 1
" ***********************************************

syntax enable
set background=dark
set t_Co=256
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set termguicolors


colorscheme night-owl
let g:lightline = { 'colorscheme': 'nightowl'  }

" Enable italics {{{
" call s:h("jsFuncArgRest", { "format": "italic" })                                 
" call s:h("jsFuncArgs", { "format": "italic" })
" call s:h("jsDocTags", { "format": "italic" })
" }}}

" colorscheme hybrid_material
" colorscheme dracula
" colorscheme cosmic_latte
" }}}

" Plugin settings {{{

" Utilities {{{

" MarcWeber/vim-addon-local-vimr
let g:local_vimrc = {'names': ['.vimlocal'], 'hash_fun': 'LVRHashOfFile'}


" editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*', 'term://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" mhinz/startify
" https://github.com/mhinz/vim-startify/blob/master/doc/startify.txt
" ASCII Source - https://www.text-image.com/convert/ascii.html
let g:avengers_ascii = [
\ "           o                                                         ",
\ "                                                                     ",
\ "              o                                                      ",
\ "                                                                     ",
\ "                  o                                                  ",
\ "                                                                     ",
\ "                       o                                             ",
\ "                                     `/////:                         ",
\ "                                     `dMMMMMd                        ",
\ "                                    `dMMMMMMd                        ",
\ "                             .:/+ooodMMMMMMMd                        ",
\ "                         :ohNMMMMMMMMMMMMMMMd                        ",
\ "                      -sNMMMNho+:/NMMMNMMMMMMNs-                     ",
\ "                    -hMMMdo-    `dMMMN+NMMMMMMMMh-                   ",
\ "                   oNMMh:      `dMMMM+ NMMMMd:hMMNo                  ",
\ "                 `hMMN/       `dMMMMo  NMMMMd  /NMMh`                ",
\ "                 hMMN-       `dMMMMs   NMMMMd   -NMMh                ",
\ "                /MMM:       `dMMMMy    NMMMMd    :MMM/               ",
\ "                dMMd       `dMMMMh     :yNMMd     dMMd               ",
\ "                NMMo      `mMMMMd`     No-yNd     oMMN               ",
\ "                NMMs     .mMMMMMmddddddMMNo-o     sMMN               ",
\ "                hMMd    .mMMMMMMMMMMMMMMMMMN/     dMMh               ",
\ "                :MMM+  .mMMMMMMMMMMMMMMMMMd::    +MMM:               ",
\ "                 sMMm .mMMMMM+`````````Nd:+md   :NMMs                ",
\ "                  sm..mMMMMMo          :+mMMd `oNMMs                 ",
\ "                   `.mMMMMMy           -/////+mMMN/                  ",
\ "                   .mMMMMMy `            `/yNMMNs`                   ",
\ "                  .mMMMMMh`oMmhso+//+oshmMMMNd+`                     ",
\ "                 .mMMMMMd``sdNMMMMMMMMMMNds/`                        ",
\ "                 -//////`     `-:://::-`                             ",
\ "",
\ "",
\]

let g:ironMan_ascii = [
  \ "   o",
  \ "",
  \ "     o",
  \ "",
  \ "       o",
  \ "         ",
  \ "               ██████████████████       ",
  \ "            ████▓▓▓█▓▓▓▓▓▓▓▓█▓▓▓███     ",
  \ "           ██▓▓█▓▓▓█▓▓▓▓▓▓▓▓█▓▓▓█▓▓█    ",
  \ "          ██████████▓▓▓▓▓▓▓▓██████████  ",
  \ "          ██──────███████████───────██  ",
  \ "         ███───────██▓▓▓▓▓▓█────────███ ",
  \ "         ████───────█▓▓▓▓▓▓█───────████ ",
  \ "         █▓██───────█▓▓▓▓▓▓█───────██▓█ ",
  \ "         ██▓█───────█▓▓▓▓▓▓█───────█▓██ ",
  \ "        ████▓█──────█▓▓▓▓▓▓█──────█▓████",
  \ "        █▓██▓█──────▀██████▀──────█▓██▓█",
  \ "        █▓██▓█────────────────────█▓██▓█",
  \ "        █▓████────────────────────████▓█",
  \ "        █▓██▀──────────────────────▀██▓█",
  \ "        █▓██──█▀▀▀▀▄▄──────▄▄▀▀▀▀█──██▓█",
  \ "        ███───█─────▀██▄▄██▀─────█───███",
  \ "         ██───▀█▄▄▄▄█▀────▀█▄▄▄▄█▀───██ ",
  \ "         ███────────────────────────███ ",
  \ "          █▓█──────────────────────█▓█  ",
  \ "          █▓▓█────────────────────█▓▓█  ",
  \ "          █▓▓▓█──────────────────█▓▓▓█  ",
  \ "          █▓▓▓█──────────────────█▓▓▓█  ",
  \ "          █▓▓▓▓█▄──────────────▄█▓▓▓▓█  ",
  \ "           █▓▓█▀█──▄▀▀▀▀▀▀▀▀▄──█▀█▓▓█   ",
  \ "            █▓█─▀▄▄▀────────▀▄▄▀─█▓█    ",
  \ "             █▓█─────▄▄▄▄▄▄─────█▓█     ",
  \ "              █▓█▄▄▄██▓▓▓▓██▄▄▄█▓█      ",
  \ "               █▓▓▓█▓▓▓▓▓▓▓▓█▓▓▓█       ",
  \ "                ████████████████        ",
  \ "                                        ",
  \]

"let g:startify_custom_header = map(g:startify_ascii, '"     ".v:val')  + startify#fortune#boxed()
"let g:startify_custom_header = map(g:startify_ascii + startify#fortune#boxed(), '"   ".v:val')
let g:startify_custom_header = map(startify#fortune#boxed() + g:avengers_ascii, '"   ".v:val')
let g:startify_session_dir = '~/.config/nvim/.cache/startify'
let g:startify_list_order = [
  \ ['Sessions'],
  \ 'sessions',
  \ ['Recently opened files'],
  \ 'files',
  \ ['Commands'],
  \ 'commands',
  \ ['Bookmarks'],
  \ 'bookmarks',
  \ ]
let g:startify_bookmarks =[{ 'con': '~/Documents/visa/consumer-app/consumer' }, { 'rxo': '~/Documents/visa/checkout-widget/rxo' }, { 'nv': '~/.config/nvim/' }, { 'z': '~/.zshrc' }]
" let g:startify_custom_indices = ['M', 'N', 'Z']
let g:startify_commands = [{ 'pu': ':PlugUpdate' }, { 'pi': ':PlugInstall' }, { 'pc': ':PlugClean' }]
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
let g:startify_padding_left = 5
let g:startify_relative_path = 1
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_vcs_root = 1

let g:startify_update_oldfiles = 1
let g:startify_use_env = 1

hi! link StartifyHeader Normal
hi! link StartifyFile Directory
hi! link StartifyPath LineNr
hi! link StartifySlash StartifyPath
hi! link StartifyBracket StartifyPath
hi! link StartifyNumber Title

autocmd User Startified setlocal cursorline
nnoremap <C-S> :Startify<CR>

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

" heavenshell/vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
nnoremap <silent> <leader>J :JsDoc<CR>

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" scrooloose/nerdcommenter
" let g:NERDSpaceDelims = 1

" tomtom/tcomment
" let g:tcomment_maps = 0
" let g:tcomment#filetype#guess = 0

" nmap <leader>cc :TComment<CR>
" nmap <leader>cm :TCommentBlock<CR>
" nmap <leader>ci :TCommentInline<CR>
" nmap <leader>cr :TCommentRight<CR>

" vmap <leader>cc :TComment<CR>
" vmap <leader>cm :TCommentBlock<CR>
" vmap <leader>ci :TCommentInline<CR>
" vmap <leader>cr :TCommentRight<CR>

" tpope/vim-commentary
nmap <leader>cc :Commentary<CR>
nmap <leader>cm :Commentary<CR>

vmap <leader>cc :Commentary<CR>
vmap <leader>cm :Commentary<CR>


" shime/vim-livedown
let g:livedown_autorun = 1
let g:livedown_port = 8999
let g:livedown_open = 0
let g:livedown_browser = "chrome"
nnoremap <leader>md :LivedownToggle<CR>

" ThePrimeagen/vim-apm
" set kscb
" }}}


" " Autocomplete {{{
" " Shougo/deoplete.nvim
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1

" function! s:check_backspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" call deoplete#custom#source('_', 'matchers', ['matcher_length', 'matcher_full_fuzzy'])

" " carlitux/deoplete-ternjs

" " ternjs/tern_for_vim
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']

" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns',{})
" let g:tern_request_timeout = 1
" let g:tern_request_timeout = 6000
" " }}}

" Linting {{{
" " w0rp/ale
let g:ale_sign_warning = ' '
let g:ale_sign_error = ' '
let g:ale_echo_msg_warning_str = ' '
let g:ale_echo_msg_error_str = ' '
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

let g:ctrlp_prompt_mappings = {
    \ 'PrtInsert("c")':       ['<c-v>', '<insert>'],
    \ }

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
" }}}

" Information {{{

" airblade/vim-gitgutter
" let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 1
let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = 'ﮥ' 
let g:gitgutter_sign_modified_removed = ''

" let g:gitgutter_sign_modified = 'Â±'
" let g:gitgutter_sign_modified_removed = 'â'

" nathanaelkane/vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" vim-airline/vim-airline

" Bharat Commeted this To test something
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'bufs'
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1

let g:airline#extensions#bufferline#enabled = 1


let g:airline#extensions#tabline#buffer_idx_format = { 
  \ '0': '0 ',
  \ '1': '1 ',
  \ '2': '2 ',
  \ '3': '3 ',
  \ '4': '4 ',
  \ '5': '5 ',
  \ '6': '6 ',
  \ '7': '7 ',
  \ '8': '8 ',
  \ '9': '9 '
\}


" Bharat Commeted this To test something
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap <leader>+ <Plug>AirlineSelectNextTab
" nmap <leader>b <Plug>XTablineSelectBuffer
" nmap <leader>tr <Plug>XTablineReopen


" Bharat Commeted this To test something
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s?'
let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline#extensions#hunks#hunk_symbols = ['+', '±', '-']

" let g:airline_section_c = '%{FilenameOrTerm()}'

" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#tab_nr_type = 1

" let g:airline#extensions#ale#warning_symbol = 'â ï¸'
" let g:airline#extensions#ale#error_symbol = 'â'
"
" let g:airline_symbols = {}

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.crypt = ''
" let g:airline_symbols.readonly = '﫸'
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '練'
" let g:airline_symbols.paste = '𧻓'
" let g:airline_symbols.spell = ''
" let g:airline_symbols.notexists = ''
" let g:airline_symbols.whitespace = '﬍'

" Bharat Commeted this To test something
" let g:airline_section_c = '%{FilenameOrTerm()}'

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
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦']
let g:indentLine_color_gui = '#7A7A7A'

nnoremap <leader>il :IndentLinesToggle<CR>
" }}}

" Syntax {{{

" gabrielelana/vim-markdown
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_input_abbreviations = 0

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" }}}

" MaxMEllon/vim-jsx-pretty
" let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'js']
" let g:vim_jsx_pretty_colorful_config = 1
" }}}

" ColorSchemes {{{
" colorscheme hybrid_material
" colorscheme dracula

" let g:molokai_original = 0
" colorscheme molokai

" Change serach colors
hi Search guibg=DarkOrchid2 guifg=GhostWhite

" set background=dark
" colorscheme solarized
" }}}
" }}}

""" Hide Tmux status bar if vim is opened {{{
" autocmd VimEnter,VimLeave * silent !tmux set status
" }}}
