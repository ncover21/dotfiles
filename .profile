#!/bin/bash

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

#Spotify Creds
export SPOTIPY_CLIENT_ID='3788898cebaf4f909add449222d79291';
export SPOTIPY_CLIENT_SECRET='2fc1134693e34fab932447e5018cd233';

export SPOTIFY_CLIENT_ID='3788898cebaf4f909add449222d79291';
export SPOTIFY_CLIENT_SECRET='2fc1134693e34fab932447e5018cd233';

# ENV Variables
export EDITOR=nvim
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


export PATH="$HOME/.poetry/bin:$PATH"
