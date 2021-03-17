" vim: fdm=marker fmr={{{,}}}


" Plugin definitions
call plug#begin('~/.vim/plugged')

" Utilities
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-grepper'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
" **************************************************************************************************

" Editing
Plug 'heavenshell/vim-jsdoc'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
" Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'ThePrimeagen/vim-apm'
" **************************************************************************************************

" Autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install && npm install -g tern' }
" Plug 'ternjs/tern_for_vim', {'for': ['javascript', 'javascript.jsx',  'html', 'css' ]}
Plug 'zxqfl/tabnine-vim'
Plug 'SirVer/ultisnips'
" **************************************************************************************************

" Linting
Plug 'w0rp/ale'
" **************************************************************************************************

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'wesQ3/vim-windowswap'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eugen0329/vim-esearch'
" **************************************************************************************************

" Information
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
" **************************************************************************************************

" Syntax
Plug 'ap/vim-css-color'
Plug 'docunext/closetag.vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'gregsexton/MatchTag'

Plug 'hail2u/vim-css3-syntax'
" Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'mxw/vim-jsx'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'othree/yajs'
Plug 'tpope/vim-jdaddy'
" **************************************************************************************************

" ColorSchemes
Plug 'haishanh/night-owl.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'kaicataldo/material.vim'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/edge'
Plug 'sheerun/vim-polyglot'

Plug 'tsiemens/vim-aftercolors'
Plug 'ryanoasis/vim-devicons'
Plug 'larsbs/vimterial_dark'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
" **************************************************************************************************

" Developement Related
Plug 'eliba2/vim-node-inspect'
" **************************************************************************************************

call plug#end()
" **************************************************************************************************

