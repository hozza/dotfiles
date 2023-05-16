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
Plug 'tpope/vim-sensible' " defaults tpope can agree on


" Visual "
""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'ap/vim-css-color' " colors all hex/rgb colors

Plug 'joshdick/onedark.vim' " theme

" simple mode for prose
Plug 'junegunn/goyo.vim', { 'for': 'markdown' } | Plug 'junegunn/limelight.vim'


" Environment "
"""""""""""""""
Plug 'tpope/vim-tbone' " non-GUI tmux copy/paste
Plug 'christoomey/vim-tmux-navigator' " split nav consistency

Plug 'neitanod/vim-clevertab' " far better than SuperTab
Plug 'jeffkreeftmeijer/vim-numbertoggle' " https://jeffkreeftmeijer.com/vim-number/

Plug 'machakann/vim-highlightedyank'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim' " fzf (CtrlP replacement)

Plug 'airblade/vim-rooter' " guess the projects path, for NerdTree

Plug 'hesselbom/vim-hsftp'


" Navigation & Version Control "
""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'lvht/tagbar-markdown', { 'on': 'TagbarToggle' }

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/vim-peekaboo'

" Code
Plug 'w0rp/ale' " simple language serving

Plug 'sheerun/vim-polyglot' " a bazillion langs intelligently loaded
Plug 'tpope/vim-commentary'

Plug 'mattn/emmet-vim' " html/css dynamic snippets
Plug 'prettier/vim-prettier' " requires nodejs prettier
Plug 'Townk/vim-autoclose'

" snippets engine, and db
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

call plug#end()


"""""""""""""""""""""""""""""""""""""
" VIM Plugin Configs
" load before VIM Configs for themes
"""""""""""""""""""""""""""""""""""""

let g:prettier#config#print_width = 180

let g:airline#extensions#tabline#enabled = 1	" airline config - show buffer 'tabs'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 0
let g:airline_theme = 'wombat'					" add some definition to splits
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let NERDTreeShowHidden = 1						" show dotfiles automatically in nerdtree
let g:NERDTreeGitStatusUseNerdFonts = 1

let g:ale_completion_enabled = 1				" ale LSP auto-completion

" easy tab auto completion from clevertab
" vastly improved by non-plugin settings PgDwn.
inoremap <silent><tab> <c-r>=CleverTab#Complete('start')<cr>
						\<c-r>=CleverTab#Complete('tab')<cr>
						\<c-r>=CleverTab#Complete('ultisnips')<cr>
						\<c-r>=CleverTab#Complete('keyword')<cr>
						\<c-r>=CleverTab#Complete('omni')<cr>
						\<c-r>=CleverTab#Complete('stop')<cr>
inoremap <silent><s-tab> <c-r>=CleverTab#Complete('prev')<cr>

" let g:mucomplete#enable_auto_at_startup = 1

let g:UltiSnipsExpandTrigger = '<F5>'

let g:tagbar_width = 25							" tagbar confs
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_singleclick = 1

autocmd! User GoyoEnter Limelight
"autocmd! User GoyoEnter set nocursorline nocursorcolumn
autocmd! User GoyoLeave Limelight!

let g:limelight_paragraph_span = 2

let g:onedark_terminal_italics=1

" onedark Theme Overrides
if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		autocmd ColorScheme * call onedark#extend_highlight("CursorLine", { "bg":{ "gui": "#343B47" } })
		autocmd ColorScheme * call onedark#extend_highlight("CursorColumn", { "bg":{ "gui": "#343B47" } })
		autocmd ColorScheme * call onedark#extend_highlight("CursorLineNr", {"bg":{ "gui": "#343B47" },"fg":{"gui": "#E5C07B"} })
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
" to reload use `:so $MYVIMRC`
""""""""""""""""""""""""""""""""""""

""" VIM Environment 
set ttyfast							" improve display on fast connection "
set mouse=a							" enable mouse "
set number							" line-numbers
set title							" file as windows title
set confirm							" confirm with dialog boxes
set signcolumn=yes					" always show gutter (git/errors)

" https://vi.stackexchange.com/a/206
" autocmd VimResized * wincmd =

" Completion
" https://vim.fandom.com/wiki/Omni_completion
" maybe use this for speed https://stackoverflow.com/a/16400590/614616
set omnifunc=syntaxcomplete#Complete
" https://www.rockyourcode.com/vim-autocomplete-with-ale/
set completeopt=menuone,longest
" https://medium.com/usevim/set-complete-e76b9f196f0f
set complete+=kspell

" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"set lazyredraw						" no unnecessary redraw

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
colorscheme onedark					" theme

" highlight current line and column of cursor only in active buf
" also don't show lines for Goyo/md files
" https://stackoverflow.com/a/12018552/614616
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * if &ft!="markdown" | setlocal cursorline | endif
	au WinLeave * setlocal nocursorline 
augroup END


""" VIM Coding
set linebreak						" avoid word-break wrapping
set showmatch						" show matching brackets
set mat=2							" matching brackets m/s blink
set scrolloff=10					" min lines above & below cursor

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
set autoindent
set smartindent

set spellfile=$PRIVATES/vim.spellfile.add	" see dotfile repo

" https://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim
set foldmethod=indent   
set foldnestmax=10
set foldlevel=2
set foldcolumn=4 
" save folds
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""

inoremap jj <ESC>
" new fzf was overriding with :Windows
command! W :w

" disable Prettier default <Leader>p
nmap <Leader>0 <Plug>(Prettier)
" paste from what was copied/yanked https://superuser.com/questions/321547/
nnoremap <Leader>y "0y
nnoremap <Leader>p "0p

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" easier commands (but a bit dirty...)
" https://www.reddit.com/r/vim/comments/ctdcua/nnoremap_cr/exk5pfa
nnoremap <Space> :

" keep selection when (in/out)denting
vnoremap < <gv
vnoremap > >gv

" yank (copy) to tmux for pasting elsewhere
vnoremap ty :'<,'>Tyank<CR>

"noremap <F2> :NERDTreeToggle<CR>
" toggle nerdtree, showing current file
nnoremap <silent> <expr> <F2> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

noremap <F9> :TagbarToggle<CR>

" unsaved edites diff
command! UnsavedDiff w !diff % -

""" Spellcheck Mappings 
" https://stackoverflow.com/a/16481737/614616
" https://stackoverflow.com/a/23126322/61461

" toggle spellcheck
noremap <F7> :setlocal spell! spelllang=en_gb<CR>	

" auto enable spelling for:
autocmd FileType gitcommit,md,markdown setlocal spell

nmap <Leader>ll :Limelight!!

" auto correct last  
noremap <F8> <Esc>[s1z=
" nice spelling suggestions
" modded from source link, wish it didnt remove word
" https://stackoverflow.com/questions/25777205
" nnoremap <Leader>s [sae<C-X>s
" inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

" zfz (CtrlP) Fuzzy Search
" <Leader> is `\` by default
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
" git status
nnoremap <Leader>s :GFiles?<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>? :Helptags<CR>
nnoremap <Leader>u :Snippets<CR> " fzf can show untisnips

nnoremap <Leader>a :Rg <C-R>=expand("<cword>")<CR><CR>

nmap <Leader><Leader> <Leader>r

" buffer (...tab) control
nnoremap <Tab> :Buffers<CR>
nnoremap <S-Tab> :bprev<CR>

" close buffer https://stackoverflow.com/a/8585343/614616
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Replace/Substitution i.e. multiple cursors
" `.` to repeat, `n` to skip.
" Forward, and Backwards respectively
" https://www.reddit.com/r/vim/comments/8k4p6v/what_are_your_best_mappings/dz4szts/
nnoremap <Leader>x *``cgn
nnoremap <Leader>X #``cgN

" now, go and write something! :D
