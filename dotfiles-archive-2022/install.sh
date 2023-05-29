#!/bin/bash
# hozza's dotfiles install script

echo -e "\nDotfile Symbolic Installation\nRepo: https://github.com/hozza/dotfiles\n\nAny existing config files will be renamed with *.bak\nInstalling hozza's dotfiles...\nSome dots assume libs can be found at ~/dotfiles/lib...\n\n"

# where are we?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# do the deed
backup_and_link() {
	whichDot=$1

	# attempt to backup existing config
	if [ -e "$HOME/$whichDot" ]; then
		
		if mv $HOME/$whichDot $HOME/$whichDot.bak; then
			echo -e "Backed-up: $HOME/$whichDot"
		else 
			echo -e "Backup Failed: $HOME/$whichDot"
			echo -e "$HOME/$whichDot.bak might already exist."
			exit 1;
		fi

	fi
	
	if $( mkdir -p $( dirname $HOME/$whichDot) && ln -s $DIR/$whichDot $HOME/$whichDot ); then
		echo -e "Installed: $HOME/$whichDot"
	else 
		echo -e "Install Failed: $HOME/$whichDot"
		exit 1;
	fi
}

# what you want?
ask_about() {
	for dot in "$@"; do
		
		while true; do
			read -p "Do you wish to install $dot? (y/n): " yn
			case $yn in
				[Yy]* ) backup_and_link $dot; break;;
				[Nn]* ) break;;
				* ) echo "Please answer 'y' for yes or 'n' for no.";;
			esac
		done

	done

}


read -p "Do you want GUI stuff? i3-wm etc. (y/n): " yn
case $yn in
	[Yy]* ) ask_about \
	.config/dunst/dunstrc \
	.config/i3/config \
	.config/i3/compton.conf \
	.config/i3blocks/config \
	.config/rofi/hozza-arc-dark.rasi \
	;;
	[Nn]* ) ;;
	* ) echo "Please answer 'y' for yes or 'n' for no.";;
esac


read -p "Do you want shell stuff? zsh, git, dircolors etc. (y/n): " yn
case $yn in
	[Yy]* ) ask_about \
	.zshrc \
	".tmux.conf.local" \
	.gitconfig \
	.dircolors \
	;;
	[Nn]* ) ;;
	* ) echo "Please answer 'y' for yes or 'n' for no.";;
esac


read -p "Do you want dev stuff? vim, fzf etc. (y/n): " yn
case $yn in
	[Yy]* ) ask_about \
	.vimrc \
	hints \
	;;
	[Nn]* ) ;;
	* ) echo "Please answer 'y' for yes or 'n' for no.";;
esac


echo -e "\n\nDone! Happy dotfiling..."
