This cheatsheet summarize all my Vim commands, motions and shortcuts that I use.
The format of this cheatsheet is as follows:
command -> description *|<the shortcuts>|*
Quick reminder for shortcuts: C-a = Ctrl a / <CR> = Enter / <BS> = Backspace

I recommend remapping:
- Caps Lock to Ctrl in .bashrc         ---> setxkbmap -option ctrl:nocaps
- <Esc> in the .vimrc (I choose <C-f>) ---> inoremap <C-f> <Esc>
You can also remap CapsLock to <Esc> in .bashrc but it is more difficult to reach



## Basics - saving and quitting ##

:w -> save                       *|nnoremap <C-w> :w<CR> | inoremap <C-w> <Esc>:w<CR>|*
:wq -> save and quit
:q! -> save without saving
C-z -> quit the file temporarily *|nnoremap <C-g> <C-z> |*     **very useful**



## Basics - commands ##

u -> undo the last edit (C-z)
<C-r> -> redo the last edit (C-y)
d -> delete the selected text
dd -> delete theline
y -> copy the selected text
yy -> copy the line
x -> cut the character
p/P paste the previously cut or copied text after/before your cursor
c -> delete the selected text and enter Insert mode
r -> replace the character
= -> automatic indentation of the selected lines
. -> repeat the last command that was run



## Basics - insert mode ##

i/a -> enter insert mode before/after the cursor
I/A -> enter insert mode at the beginning/end of the line
o/O -> append a new line below/above the current line



## Motions - horizontal movement ##

h/j/k/l -> move the cursor left/down/up/right respectively
w/W/e/E -> jump forward to the start of the next word / end of the current word
b/B -> jump backward to the start of a word/WORD
f<character>/F<character> Jump forward/backward to the next occurence of <character>
;/, Repeat the previous f/F command forward/backward.
{/} Jump to the previous/next paragraph
[[/]] Jump to the previous/next functions     *|nnoremap <C-]> ]]zz | nnoremap <C-[> [[zz|*



## Motions - vertical movement ##

^ -> jump to the first character of a line    *|noremap H ^|*         **Insane**
g_ -> jump to the last character of a line    *|noremap L g|*         **Insane**
gg -> jump to the first line
G -> jump to the last line                    *|nnoremap <Space> G|*
<number>G -> jump to the line <number>        *|nnoremap <Space> G|*
'' -> jump to the last position cursor (multi-file not possible)
C-o -> moves backward in the position history (multi-file possible)   **pretty cool**
C-i -> moves forward in the history (like a "redo" of the movement)
**tags**
m<character> set the current position to the mark
'<character> jump to the line of the mark.
zz -> move the screen so that the current line appears in the center (--nnoremap t zz--)
C-d -> scroll down the screen                 *|nnoremap <C-d> <C-d>zz|*
C-u -> scroll up the screen                   *|nnoremap <C-u> <C-u>zz|*



## Search ##

/<pattern> -> search for forward in the current file
/?<pattern> -> search for backward in the current file
n/N -> continue the search in the same/inverse direction
%s/<pattern>/<replacement>/gc -> search and replace every occurrence of by prompting for confirmation each time 
                                              *|nnoremap <C-y> :%s///gc<left><left><left><left>|* **Banger**
:nohls -> remove search-highlighting          *|nnoremap <CR><CR> <Cmd>silent! nohlsearch<CR>/<BS><CR>|*



## File movement ##

(alias vim='vim -p' -> in the .bashrc so that it opens multiple files in tabs)
:tabe ... -> open a file in a new tab         *|nnoremap <C-t> :tabe|*
:vsplit -> split the window
<C-w>w -> switch to the next windows split   *|nnoremap <C-j> <C-w>w|*
gt -> move to the next tab                   *|nnoremap <C-l> gt|*    **incredible shortcuts**
gT -> move to the previous tab               *|nnoremap <C-h> gT|*    **incredible shortcuts**
<C-6> move to the previous file              *|nnoremap <C-e> <C-6>|*
gf -> move to the file in the cursor
gd -> jump to the local declaration



## Insert mode shorcuts ##

**Avoid ping-ponging between normal mode and insert mode**
inoremap <C-a> <Esc>A -> move in insert mode
inoremap <C-e> <Esc>I -> move in insert mode
inoremap <C-h> <Esc>i -> move in insert mode
inoremap <C-l> <Esc>lli -> move in insert mode

**Too much work for my little finger**
<C-j> -> Enter
<C-i> -> Tab
<C-k> (insert mode) -> Backspace
<C-k> (normal mode) -> Backspace             *|nnoremap <C-k> i<BS><Esc><right>|*
<C-x> -> like x but in insert mode           *|inoremap <C-x> <Esc>lxi|*



## BANGER ##

J -> append the line below to the current line
C-a -> jump to a number on the line and increments it
C-x -> jump to a number on the line and decrements it
C-v + jjjj + i + toto<Esc> -> add toto at the beginning of each line
C-v + jjjj + $ + A + toto<Esc> -> add toto at the end of each line
*|xnoremap A $A|* (same without $)

**The most amazing vim motions**
diw / daw / ciw / caw / di" / di'/ di( / di[ da" / da'/ da( / da[ / ...
    1. d, c, y, v → action: delete, change, yank, or select
    2. i or a → scope: inner (just content) or around (include spaces/delimiters)
    3. w, ", ', (, [, { → target: word, quotes, brackets, etc.
example:
diw, daw, ciw, caw → delete/change inner or a word
di", di', di(, di[, di{ → delete inside quotes/brackets
da", da', da(, da[, da{ → delete around, including delimiters

**Combo (with my shortcuts line 48)**
dH/dL -> delete before/after the cursor
yH/yL -> yank before/after the cursor

**Finally the copy command**
*|vnoremap <Space> :w !xclip -selection clipboard<CR><CR>|*
visual mode + Space -> copy

**Space (with this shortcuts)**
*|nnoremap <Space> G|*
<Space> -> jump to the end of the file
14<Space> -> jump to the line 14

**Indent the whole file**:
*|nnoremap <C-q> :let save_view = winsaveview()<CR>gg=G:call winrestview(save_view)<CR>:w<CR>|*
*|inoremap <C-q> <Esc>:let save_view = winsaveview()<CR>gg=G:call winrestview(save_view)<CR>:w<CR>|*
gq -> reformats text to wrap lines neatly at the configured textwidth (e.g. 80 characters)



## Bonus - Macros ##

macros allow you to repeat complex editing tasks by recording them
in a register and executing them later with a shortcut.
q<register name> Start recording a macro inside the register. To
stop recording press q again.
@<register name> Execute the macro inside the register.
@@ Repeat the last macro executed



## Bonus - .vimrc ##
"----- backup -----
set backup
set backupdir=~/.vim/backup//
set backupskip=/tmp/*,/private/tmp/*

                     if !isdirectory(expand(&backupdir))
                     call mkdir(expand(&backupdir), "p")
                         endif
"----- the cursor is at the same place when you quit ------
augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END



## Bonus ++ ##

C-w (insert mode) -> erase the word in insert mode
M -> move the cursor to the center of the screen
% -> move to the matching character () {} []
o (in visual mode) -> change direction
~ -> reverse lowercase/upercase *|nnoremap t ~|*
**little shortcuts**
*|nnoremap <C-s> <C-x>|* -> decrements
*|nnoremap n nzzzv|* -> center the cursor when jumping to the next search match
*|nnoremap N Nzzzv|* -> center the cursor when jumping to the previous search match
*|nnoremap <C-p> :vs |*
*|nnoremap <C-t> :tabe |*
*|nnoremap M zz|*


## Bonus - Spell correction ##

:set spell spelllang=en
]s -> move to next misspelled word
[s -> move to previous misspelled word
z= -> show suggestions for the word under cursor
