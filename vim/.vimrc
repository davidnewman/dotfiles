set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" color schemes
Plugin 'flazz/vim-colorschemes'

" javascript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

" Dash documentation manager
Plugin 'rizzatti/dash.vim'

" tmux vim integration
Bundle 'christoomey/vim-tmux-navigator'

" file/navigation
Plugin 'wincent/command-t'

" word navigation
Plugin 'Lokaltog/vim-easymotion'

" python auto-completion and stuff
Bundle 'klen/python-mode'

" python autocomplete
Bundle 'davidhalter/jedi-vim'

" php syntax highlighting
Plugin '2072/vim-syntax-for-PHP.git'

" php indenting
Plugin '2072/PHP-Indenting-for-VIm'

" helps with php autocomplete
" Bundle 'ervandew/supertab'

" php autocompletion
" Bundle 'shawncplus/phpcomplete.vim'

" dbgp integration
Bundle 'joonty/vdebug.git'

" tags
Plugin 'majutsushi/tagbar'

" git integration
Plugin 'tpope/vim-fugitive'

" SASS syntax
Plugin 'cakebaker/scss-syntax.vim'

" auto-completion
Plugin 'Valloric/YouCompleteMe'

" golang support
Plugin 'fatih/vim-go'

" elixir support
Plugin 'elixir-lang/vim-elixir'

" ag support
Plugin 'rking/ag.vim'

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
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

" Set basic color support and scheme
" set t_Co=256
syntax on
" set background=light
set background=dark
colorscheme solarized
let g:solarized_termcolors = 256

" Make the clipboard work
set clipboard=unnamed

" Set basic programming settings
set expandtab
set number
set mouse=a
set backspace=2

" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The
" highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen"
" colors.
highlight! link DiffText MatchParen

" ignore whitespace in vimdiff
if &diff
    set diffopt+=iwhite
endif

" Start NERDTree by default
" autocmd VimEnter * NERDTree

" Command-T settings
let g:CommandTTraverseSCM='pwd'
let g:CommandTMaxDepth=30
let g:CommandTFileScanner='ruby'
let g:CommandTWildIgnore='.git,**/node_modules,**/bin,*.png,*.jpg,*.jpeg,*.gif,*.o,*.obj,*.pyo,*.pyc,*.ttf,*.otf,*.woff,*.eot,**/venv,**/virtualenvs,**/*.egg-info'
let g:CommandTAcceptSelectionSplitCommand='sp'
let g:CommandTAcceptSelectionSplitMap='<C-g>'

" Treat .json files as javascript for highlighting.
autocmd BufNewFile,BufRead *.json set ft=javascript
" .sh is bash scripts
autocmd BufNewFile,BufRead *.sh set ft=sh
" .make is a Makefile
autocmd BufNewFile,BufRead *.make set ft=make
autocmd FileType make setlocal noexpandtab

" Mapping for pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" configuration for easy motion
let g:EasyMotion_do_mapping = 0

nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" Functions to move windows around
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

nmap <F8> :TagbarToggle<CR>

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" set wildignore=
let g:CommandTWildIgnore=&wildignore . ",*.o,*.obj,.git,*.class,*.jar,node_modules/**,bower_components/**,**/node_modules/**,_build/**,deps/**,**/vendor/**,**/dist/**"

" ag.vim configuration
let g:ag_working_path_mode="r"

" Default tabstops
setlocal tabstop=4 softtabstop=4 shiftwidth=4
