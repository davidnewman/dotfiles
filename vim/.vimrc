" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" color/style
Bundle 'altercation/vim-colors-solarized'

" navigation plugins
Bundle 'scrooloose/nerdtree'

" Bundle 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'easymotion/vim-easymotion'

" debugging support
" Bundle 'joonty/vdebug.git'

" Python
" Bundle 'klen/python-mode'
" Bundle 'davidhalter/jedi-vim'
" End Python

" autocomplete
Plugin 'Valloric/YouCompleteMe'

" ctag integration
Plugin 'majutsushi/tagbar'

" golang
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
" end golang

" Git support
Plugin 'tpope/vim-fugitive'

" Elixir support
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'slashmili/alchemist.vim'

" Search integration
Plugin 'rking/ag.vim'

" Hashicopr tools
Plugin 'hashivim/vim-terraform'
" lldb support
" Plugin 'gilligan/vim-lldb'

" PHP
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'xolox/vim-misc'
Plugin 'davidnewman/vim-easytags'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Put swap files and undo in a central location
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Style Settings
" set t_Co=256
syntax enable
set background=dark
" set background=light
colorscheme solarized

" Command-T Settings
" let g:CommandTMaxDepth=30
" let g:CommandTFileScanner='ruby'
" let g:CommandTWildIgnore='.git,**/node_modules/**,**/bin,*.png,*.jpg,*.jpeg,*.gif,*.o,*.obj,*.pyo,*.pyc,*.ttf,*.otf,*.woff,*.eot,*.out,*.gch,node_modules/**,bower_components/**,_build/**,build/**,deps/**'
" let g:CommandTAcceptSelectionSplitCommand='sp'
" let g:CommandTAcceptSelectionSplitMap='<C-g>'

" CtrlP Settings
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$|[\/](node_modules|bin|automated_tests\/_output)$',
  \ 'file': '\v\.(png|jpg|jpeg|gif|obj|o|pyo|pyc|ttf|otf|woff|eot|out|gch)$'
  \ }

" EasyMotion Bindings
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" " `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
"
" HJKL motions: Line motions
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" keep cursor column when JK motion
" let g:EasyMotion_startofline = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" enable tagbar window
" nmap <F8> :TagbarToggle<CR>

" Clipboard shared with system.
set clipboard=unnamedplus

" ag.vim
let g:ag_working_path_mode="r"

" quickfix window shortcuts
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Autocompletion options
let g:ycm_autoclose_preview_window_after_completion = 1

set tabstop=4 softtabstop=4 shiftwidth=4
