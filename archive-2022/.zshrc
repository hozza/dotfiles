#####################################
# ZSH Config, by hozza
# see dotfiles repo
#####################################

# antigen - better than oh-my-zsh
source ~/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply

# Exports
export DOTFILES="$HOME/dotfiles"
export PRIVATES="$HOME/dotfiles_private"

#add own programmes locally in ~/bin
export PATH=$PATH:~/bin:~/gems/bin

# dev env for ruby gems
export GEM_HOME="$HOME/gems"

# dev env for pip2/python
export PATH=$PATH:$HOME/.local/bin

# `$ mail` shows all system mail (like cron output) - this edits the default notice
export MAILPATH=/var/mail/$USER?'$USER has $(hozza_check_mail).'

# Sources
source $DOTFILES/lib/.zsh_aliases
source $DOTFILES/lib/.zsh_functions
[[ -f $PRIVATES/.zsh_extra ]] && source $PRIVATES/.zsh_extra

# `p10k` prompt theme/extension 
[[ -f $DOTFILES/lib/.p10k.zsh ]] && source $DOTFILES/lib/.p10k.zsh

# local fzf install? enable for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# native fzf install? enable for zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh 

# 'install' dir colors for ls, see the file for more info
[ -f ~/.fzf.zsh ] &&  eval $(dircolors -b $HOME/.dircolors)


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# zsh history
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

HISTFILE=$PRIVATES/.zsh_history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=50000
SAVEHIST=10000

# tmux-ify | automatically attach to 'ssh_dev' or create it if not in one already
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
	tmux attach-session -t ssh_dev || tmux new-session -s ssh_dev
fi

# run
hozza_welcome

# now, go and run something! :D

#NOTE - below here is auto added by various installs.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
