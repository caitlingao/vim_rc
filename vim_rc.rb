" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
set nocompatible               " be iMproved
set encoding=utf8
"filetype off

call plug#begin('~/.vim/plugged')

" 1 tab to 2 space for ruby
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" number line show
set nu

" Swich windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" input source improve for gui vim
if has("gui_running")
  set noimdisable
  set imi=2
  set ims=2
endif

set noswapfile
"in order to switch between buffers with unsaved change
set hidden

" heigh selected
set hls

" hightlight col and line
"set cursorline
"set cursorcolumn

"if has("gui_running")
"  colorscheme desert
"  set bs=2
"  set ruler
"  set gfn=Monaco:h16
"  set shell=/bin/bash
"endif

syntax enable
set background=dark
colorscheme solarized

if has('gui_running')
    set background=light
else
    set background=dark
endif

let mapleader= ","
" EasyMotion_leader_key .
" Make sure you use single quotes

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 代码检测, 代码对其，格式化
" Plug 'w0rp/ale'
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \}
" JavaScript
Plug 'pangloss/vim-javascript'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plug 'godlygeek/tabular' " older
Plug 'plasticboy/vim-markdown'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" golang
Plug 'fatih/vim-go', { 'tag': '*' }
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'dgryski/vim-godef'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'rogpeppe/godef'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" quickly search file(s), use ctrl+p, F5 refresh
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules)$'
map <c-o> :CtrlPBuffer<CR>
" The silver searcher
Plug 'rking/ag.vim'
let g:ackprg = 'ag --nogroup --nocolor --column --ignore=db --ignore=log --ignore=tmp --ignore=test'
" grep
Plug 'mileszs/ack.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
" ruby command for rvm
Plug 'tpope/vim-rvm'
" 快速跳转
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" quickly write HTML, just like zencoding but simple engough
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"let g:sparkupNextMapping= "<c-m>"
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
let g:user_emmet_mode='iv'
autocmd FileType html,css,eruby EmmetInstall
au BufNewFile,BufRead *.ejs set filetype=html
" power vim plugin for rails
Plug 'tpope/vim-rails'
" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete
" quickly comment your code, try ,cc on selected line
"Plugin 'vim-scripts/The-NERD-Commenter'
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" indent guides
let g:indent_guides_guide_size = 1
Plug 'nathanaelkane/vim-indent-guides'
" indent guides shortcut
map <silent><F7>  <leader>ig

" file tree like something called IDE
Plug 'scrooloose/nerdtree'
"map <silent><F8> :NERDTree<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeMirror<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" coffeescript
Plug 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" basic dependence
Plug 'vim-scripts/L9'
" hack filetype for slim
autocmd BufNewFile,BufRead *.slim set filetype=slim

Plug 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
  \ }

Plug 'bogado/file-line'

filetype plugin indent on     " required!
syntax on

" sass highlight
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'

Plug 'bling/vim-airline'

Plug 'szw/vim-tags'

Plug 'slim-template/vim-slim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" fastfold
Plug 'konfekt/fastfold'
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
let g:fastfold_savehook = 1
set foldmethod=manual
set foldlevel=99

Plug 'leafgarland/typescript-vim'

" Vim syntax highlighting for Vue components.
Plug 'posva/vim-vue'


" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" let g:rustfmt_autosave = 1
set hidden
let g:racer_experimental_completer = 1

" Initialize plugin system
call plug#end()

" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-

" vim 7.4 backspace fix
set backspace=indent,eol,start
set t_Co=256
" colorscheme, read here: http://vim.wikia.com/wiki/Change_the_color_scheme
" colorscheme molokai
" clear trailing spaces when u save
autocmd BufWritePre * :%s/\s\+$//e

" 参考：https://zhuanlan.zhihu.com/p/24742679
" https://vimawesome.com
" vim search: https://github.com/BurntSushi/ripgrep
" https://github.com/junegunn/vim-plug
