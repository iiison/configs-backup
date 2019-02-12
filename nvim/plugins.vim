" vim: fdm=marker fmr={{{,}}}

" Plugin definitions
" No config here; see settings.vim
call plug#begin('~/.vim/plugged')

" Utilities
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-grepper'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'

" Editing
" Plug 'Raimondi/delimitMate'
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx', 'react', 'html', 'pug']}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript', 'javascript.jsx', 'react']}
" Plug 'scrooloose/nerdcommenter'
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'tomtom/tcomment_vim', {'as': 'tcomment'}
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Autocomplete
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'carlitux/deoplete-ternjs', {'for': ['javascript', 'javascript.jsx', 'vue', 'html', 'pug']}
Plug 'ternjs/tern_for_vim', {'for': ['javascript', 'javascript.jsx', 'vue', 'html', 'pug']}

" Linting
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Navigation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'wesQ3/vim-windowswap'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eugen0329/vim-esearch'

" Information
Plug 'airblade/vim-gitgutter'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'

" Syntax
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade', {'for': ['jade', 'pug']}
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'fleischie/vim-styled-components', {'for': ['javascript', 'javascript.jsx', 'vue']}
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
Plug 'gregsexton/MatchTag', {'for': ['html', 'xml']}
Plug 'hail2u/vim-css3-syntax'
" Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script', {'for': ['coffee', 'litcoffee']}
" Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty', {'for': ['javascript.jsx', 'html']}
Plug 'othree/html5.vim', {'for': 'html'}
" Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" Plug 'othree/yajs.vim', {'for': ['javascript', 'javascript.jsx', 'html']}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx', 'html']}
Plug 'posva/vim-vue', {'for': ['javascript', 'html', 'vue']}
Plug 'tpope/vim-jdaddy', {'for': 'json'}

" Colorschemes
Plug 'ajh17/Spacegray.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'jacoborus/tender'
Plug 'jaromero/vim-monokai-refined'
Plug 'jnurmine/zenburn'
Plug 'junegunn/seoul256.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'mbbill/vim-seattle'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'muellan/am-colors'
Plug 'nanotech/jellybeans.vim'
Plug 'nlknguyen/papercolor-theme'
Plug 'philpl/vim-adventurous'
Plug 'Pychimp/vim-luna'
Plug 'rakr/vim-one'
Plug 'romainl/Apprentice', {'branch': 'fancylines-and-neovim'}
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'trevordmiller/nova-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'whatyouhide/vim-gotham'
Plug 'zeis/vim-kolor'

Plug 'tsiemens/vim-aftercolors'
Plug 'ryanoasis/vim-devicons'

call plug#end()
