" ---- Encoding ---
set encoding=utf-8
set fileencodings=

" ---- Plugins ----
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'bluz71/vim-moonfly-colors'
call plug#end()

" ---- Color ----
syntax on
execute pathogen#infect()
set termguicolors
set background=dark
colorscheme moonfly

" ---- Basics settings ----
set title
set number
set cc=80
set spell
set spelllang=en
set splitright
set foldmethod=indent
set foldlevel=99
autocmd FileType * set formatoptions-=cro "Disable auto-commenting on new lines

" ---- Indentation ----
set expandtab             " Replace Tabs with spaces
set shiftwidth=4          " Tab = 4 spaces
set tabstop=4             " Display tab
autocmd FileType make setlocal noexpandtab "Use real tabs for makefile"
filetype plugin indent on " Detect the type of the file

" ---- Display invisible characters ----
set list
set listchars=tab:»·,trail:.

" ---- Research ----
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <CR><CR> <Cmd>silent! nohlsearch<CR>/<BS><CR>

" ---- Backup ----
set backup
set backupdir=~/.vim/backup//
set backupskip=/tmp/*,/private/tmp/*

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

" ---- Put the cursor at the same position when I quit the file ----
augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END

" ---- Shortcuts ----
noremap H ^
noremap L g_
nnoremap <Space> G
nnoremap <C-g> <C-z>
nnoremap <C-y> <C-a>
nnoremap <C-n> <C-x>
nnoremap M zz

" Backspace on normal mode
nnoremap <C-k> i<BS><Esc><right>

" Visual mode
xnoremap A $A

" Escape
nnoremap <C-f> <Esc>
inoremap <C-f> <Esc>
xnoremap <C-f> <Esc>
vnoremap <C-f> <Esc>

" Insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-a> <Esc>A
inoremap <C-e> <Esc>I
inoremap <C-k> <BS>
inoremap <C-x> <Esc>lxi

" File navigation
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <C-j> <C-w>w

" Save
nnoremap <C-w> :w<CR>
inoremap <C-w> <Esc>:w<CR>

" Copy to clipboard
vnoremap <Space> :w !xclip -selection clipboard<CR><CR>

" Indent
nnoremap <C-q> :let save_view = winsaveview()<CR>gg=G:call winrestview(save_view)<CR>:w<CR>
inoremap <C-q> <Esc>:let save_view = winsaveview()<CR>gg=G:call winrestview(save_view)<CR>:w<CR>

" Commands
nnoremap <C-s> :%s///gc<left><left><left><left>
nnoremap <C-e> :vs 
nnoremap <C-t> :tabe 
cnoremap <C-h> <left>
cnoremap <C-l> <right>

" Jump
nnoremap <C-]> ]]zz
nnoremap <C-[> [[zz

" Cursor centered after jumps
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Macros
nnoremap q ^qz
nnoremap @ @z
xnoremap @ :<C-u>'<,'>normal @z<CR>

" Lowercase / Uppercase
nnoremap t ~
vnoremap t ~

" Spell correction
noremap \\ z=

" Nope
noremap Q <Nop>
