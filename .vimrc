

set runtimepath+=~/.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

source $HOME/.vim/basic.vim
source $HOME/.vim/extended.vim
source $HOME/.vim/filetypes.vim


" Load vimrcs from ./.vim

"if exists("$HOME/.vim/init.vim")
"    source $HOME/.vim/init.vim
"endif

"source $HOME/.vim/basic.vim
"source $HOME/.vim/filetypes.vim
"source $HOME/.vim/extended.vim

:set number

let mapleader=","

map <space> /
map <C-space> ?

" Fast Saving
nmap <S-w> :w!<cr>

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

call plug#begin('~/.vim/plugged')

" Use release branch (recommend)
Plug 'davidhalter/jedi-vim'
" For markdown stuff
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki"
set nocompatible
filetype plugin on
syntax on
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax
" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0    " disable autostart "
map <leader>md :InstantMarkdownPreview<CR>

set splitbelow
set splitright

" Window Creation Remapping
" nnoremap <C-j> <C-w>v
" nnoremap <C-k> <C-w>v
" map <C-q> <C-w>q

" coc plugin
nmap <leader>gd <Plug><coc-definition)
nmap <leader>gr <Plug><coc-references)
nnoremap <C-p> :GFiles<CR>

nmap gd :let varname = '\<<C-R><C-W>\>'<CR>?\<def\><CR>/<C-R>=varname<CR><CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" let g:jedi#completions_enabled = 0
" let g:jedi#popup_on_dot = 0
" Line below turns of function parameter recomendations
let g:jedi#show_call_signatures = 0

" source $MYVIMRC reloads the saved $MYVIMRC
" :nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
" :nmap <Leader>v :e $MYVIMRC

" quick spelling correction
imap <c-x> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-x> [s1z=<c-o>

" Shift tab
" for command mode
"nnoremap <S-Tab> <<
" for insert mode
"inoremap <S-Tab> <C-d>

"#hi clear SpellBad
"hi SpellBad cterm=underline
" Set style for gVim
"hi SpellBad gui=undercurl

" insert one character (Control i)
nnoremap <C-i> i_<Esc>r

" indent line faster
"vnoremap < <gv
"vnoremap <S-Tab> <gv
"vnoremap > >gv
nmap > v><ESC>$
nmap < v<<ESC>$

nmap <leader>> v><ESC>$a<Space>
nmap <leader>< v<<ESC>$a<Space>

"autocmd FileType *.md
" Spell Checking
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.wiki setlocal spell

let g:NERDTreeWinPos = "left"

tnoremap <Esc> <C-\><C-n>

" Nerd Tree change directory config
let g:NERDTreeChDirMode = 2

"visual like movement
nnoremap <buffer> k gk
nnoremap <buffer> j gj

"remap tab movements
noremap <leader><Right> :tabn<cr>
noremap <leader><Left> :tabp<cr>

" Faster Movement up and down 
noremap <S-j> <C-d>
noremap <S-k> <C-u>


"auto directory change depending on current file
set autochdir
autocmd BufEnter * silent! lcd %:p:h
nnoremap <leader>cd :cd %:p:h<CR>

" Colorscheme
set background=dark
"colorscheme dracula 
"colorscheme peaksea
colorscheme codedark



function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
map <leader>u :call HandleURL()<cr>

call pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <C-e> :NERDTreeToggle<CR>


" vimwiki stuff
let g:vimwiki_list = [{'path': '$HOME/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

