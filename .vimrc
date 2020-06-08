

" Load vimrcs from ./.vim

if exists("$HOME/.vim/init.vim")
    source $HOME/.vim/init.vim
else
    echo "Could not find init.vim"
endif
