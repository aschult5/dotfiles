#!/usr/bin/env bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $BASE_DIR

function linkconfig() {
	DEST=$1
	SRC=$2
	test -e "$SRC" || return 1
	echo "Linking $DEST to $SRC"

	# Remove/Unlink existing DEST
	test -e "$DEST" && rm -Irf "$DEST"
	test -L "$DEST" && unlink "$DEST"

	# Create DEST parent directory
	mkdir -p $(dirname $DEST)

	# Link
	ln -s "$SRC" "$DEST"

	return 0
}

for config in bspwm sxhkd polybar rofi redshift.conf vim lscolors gtk-3.0 user-dirs.dirs zsh/work.zsh; do
	linkconfig $HOME/.config/$config $BASE_DIR/config/$config
done

for dotfile in zshenv gitconfig gitignore gnupg/gpg.conf gnupg/gpg-agent.conf; do
	linkconfig $HOME/.${dotfile} $BASE_DIR/$dotfile
done

# Misfits
linkconfig $HOME/.config/zsh/.zshrc $BASE_DIR/config/zsh/zshrc
