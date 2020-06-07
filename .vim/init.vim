

source ./basic.vim
source ./filetypes.vim
source ./plugins_config.vim
source ./extended.vim

:set number



call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

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
map <C-d> <C-w>v
map <C-s> <C-w>s
map <C-q> <C-w>q

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

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
:nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC
