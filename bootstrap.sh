#!/bin/bash


link(){
	for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|.DS_Store|bootstrap.sh|startup.sh' ) ; do
		ln -sv "$PWD/$file" "$HOME"
	done
	echo "$PROMPT Symlinking complete"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	link;
else
	read -p "This will link config files to home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	    link;
    fi;
fi;
