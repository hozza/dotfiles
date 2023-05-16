#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
	then echo "Please run with sudo"
	exit
fi

install() {
	if ! command -v $1 &> /dev/null
	then
		apt install $1
		exit 1;
	else
		exit 0;
	fi
}



declare -a vim_=()

read -p "Install vim config? (y/n): " yn
case $yn in
	[Yy]* ) backup_and_link $dot; break;;
	[Nn]* ) break;;
	* ) echo "Please answer 'y' for yes or 'n' for no.";;
esac



install fzf
install ripgrep
install vim

