"""""""""""""""""""""""""""""""""""""
" VIMRC
" Full-color terminal vim, by hozza 
" for IDE-like web-stack development
" Specifically for tmux over ssh.
"""""""""""""""""""""""""""""""""""""
set nocompatible				" be iMproved, required


"""""""""""""""""""""""""""""""""""""
" init vim-plug
"""""""""""""""""""""""""""""""""""""
" auto install if required
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle') " not `~/.vim/plugged`, migration from Vundle
Plug 'junegunn/vim-plug' " vim-plug manages vim-plug

Plug 'tpope/vim-sensible' " defaults everyone can agree on

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

" Environment
Plug 'tpope/vim-tbone' " non-GUI tmux copy/paste
Plug 'christoomey/vim-tmux-navigator' " split nav consistency
Plug 'mbbill/undotree'

" WARNING: install the fzf go application outside vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim' " fzf (CtrlP replacement)
Plug 'airblade/vim-rooter' " guess the projects path, for NerdTree/fzf

" Code
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Townk/vim-autoclose'

Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot' " a bazillion langs intelligently loaded

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'lvht/tagbar-markdown', { 'on': 'TagbarToggle' }

Plug 'ap/vim-css-color' " colors all hex/rgb colors

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

call plug#end()


"""""""""""""""""""""""""""""""""""""
" VIM Plugin Configs
" load before VIM Configs for themes
"""""""""""""""""""""""""""""""""""""

let g:fzf_layout = { 'up': '~15%' }

let g:airline#extensions#tabline#enabled = 1	" airline config - show buffer 'tabs'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'					" add some definition to splits

let NERDTreeShowHidden = 1						" show dotfiles automatically in nerdtree

let g:ale_completion_enabled = 1				" ale LSP auto-completion

let g:tagbar_width = 25							" tagbar confs
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_singleclick = 1

" auto run Goyo (distraction-free mode) for markdown
autocmd VimEnter * if exists(":Goyo") | exe ":Goyo" | endif

let ayucolor="mirage"

let g:onedark_terminal_italics=1

" onedark Theme Overrides
if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		autocmd ColorScheme * call onedark#extend_highlight("CursorLine", { "bg":{ "gui": "#343B47" } })
		autocmd ColorScheme * call onedark#extend_highlight("CursorLineNr", { "bg":{ "gui": "#343B47" } })
		autocmd ColorScheme * call onedark#extend_highlight("SpellRare", { "fg":{ "gui": "#D165F1" } })
		autocmd ColorScheme * call onedark#extend_highlight("SpellCap", { "fg":{ "gui": "#E5C07B" } })
	augroup END
endif


" Stop SpecialKey/NonText chars from listchars from using 'Normal' coloring
" when cursor line is highlighting
autocmd BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd BufNewFile,BufRead * call matchadd('NonText', '\n\+')



""""""""""""""""""""""""""""""""""""
" VIM Configs 
" to reload use `:source $MYVIMRC`
""""""""""""""""""""""""""""""""""""

""" VIM Environment 
set ttyfast							" improve display on fast connection "
set mouse=a							" enable mouse "
set number							" line-numbers
set title							" file as windows title
set confirm							" confirm with dialog boxes

" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set lazyredraw						" no unnecessary redraw

" https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
set incsearch		" find the next match as we type the search
set hlsearch		" highlight searches by default
set smartcase		" case-sensitive search when Upper

" https://github.com/scrooloose/vimfiles/blob/master/vimrc
set showcmd							"show incomplete cmds down the bottom
set showmode						"show current mode down the bottom

""" VIM Style
set termguicolors

set background=dark					" dark mode
set cursorline						" highlight current-line
colorscheme onedark					" theme

""" VIM Coding
set linebreak						" avoid word-break wrapping
set showmatch						" show matching brackets
set mat=2							" matching brackets m/s blink
set scrolloff=5						" min lines above & below cursor

" https://medium.com/@khamer/writing-php-and-js-with-vim-in-2017-f58e4a5738ae
set showbreak=↪\  					" better line wraps
set breakindent 
set breakindentopt=shift:-2
set formatoptions+=n				" continue number list

" tame all the vim extra/meta files
silent! call mkdir($HOME."/.vim/backup", "p")
silent! call mkdir($HOME."/.vim/swap", "p")
silent! call mkdir($HOME."/.vim/undo", "p")
set backup backupdir=$HOME/.vim/backup//
set swapfile directory=$HOME/.vim/swap//
set undofile undodir=$HOME/.vim/undo//

" https://marcgg.com/blog/2016/03/01/vimrc-example/
set colorcolumn=120

" https://github.com/Yggdroot/indentLine
set list
set listchars=tab:\|\ ,space:·,trail:·		" show tabs & spaces

set tabstop=4								" proper tabs
set shiftwidth=4

set spellfile=$PRIVATES/vim.spellfile.add	" see dotfile repo



""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""

inoremap jj <ESC>
" inoremap jk <esc>
" inoremap kj <esc>

" keep selection when (in/out)denting
vnoremap < <gv
vnoremap > >gv

" yank (copy) to tmux for pasting elsewhere
vnoremap ty :'<,'>Tyank<CR>

noremap <F2> :NERDTreeToggle<CR>
noremap <F9> :TagbarToggle<CR>

" unsaved edites diff
command Udiff w !diff % -

""" Spellcheck Mappings 
" https://stackoverflow.com/a/16481737/614616
" https://stackoverflow.com/a/23126322/61461

" toggle spellcheck
noremap <F7> :setlocal spell! spelllang=en_gb<CR>	

" auto correct last misspelling
noremap <F8> <Esc>[s1z=

" zfz (CtrlP) Fuzzy Search
" <Leader> is `\` by default
nmap <Leader><Leader> <Leader>g
nmap <Tab> <Leader>b
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>? :Helptags<CR>

" now, go and write something! :D
