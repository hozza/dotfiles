#####################################
# ZSH Config, by hozza
# see dotfiles repo
#####################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# will also reconnect, https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/tmux
ZSH_TMUX_AUTOSTART="true"
# autoquite is a nightmare if tmux fails, it's on by default when autostart is true.
ZSH_TMUX_AUTOQUIT="false"

ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

# oh-my-zsh Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(git tmux extract common-aliases command-not-found colored-man-pages themes)

source $ZSH/oh-my-zsh.sh



# Configs

export DOTFILES="$HOME/dotfiles"
export PRIVATES="$HOME/.dotfiles_private"

HISTFILE=$PRIVATES/.zsh_history

#add own programmes locally 
export PATH=$PATH:~/bin

source $DOTFILES/.zsh_functions
source $DOTFILES/.zsh_aliases

# `$ mail` shows all system mail (like cron output) - this edits the default notice
export MAILPATH=/var/mail/$USER?'$USER has $(hozza_check_mail).'

# 'install' dir colors for ls, see the file for more info
eval $(dircolors -b $HOME/.dircolors)

# Terminal Screensaver
TRAPALRM() { pipes.sh }
export TMOUT=480

# run
hozza_welcome

# now, go and run something! :D
