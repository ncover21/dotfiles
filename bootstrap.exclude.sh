#!/bin/bash

#cd "$(dirname "${BASH_SOURCE}")";
#git pull origin master;
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

link () {
	echo "$PROMPT This utility will symlink the files in this repo to the home directory"
	echo "$PROMPT Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|.DS_Store' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		echo "$PROMPT Symlinking complete"
	else
		echo "$PROMPT Symlinking cancelled by user"
		return 1
	fi
}
link;
#if [ "$1" == "--force" -o "$1" == "-f" ]; then
#	link;
#else
#	read -p "This will link config files to home directory. Are you sure? (y/n) " -n 1;
#	echo "";
#	if [[ $REPLY =~ ^[Yy]$ ]]; then
#		link;
#	fi;
#fi;
