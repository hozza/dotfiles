###############################
# Shell Mods
# https://github.com/hozza/dotfiles/
###############################

###############################
# Custom Prompt

DEFAULT_PROMPT=$PS1

# set default color for prompt
# to override, set PROMPT_HOST_COLOR before sourcing this file
# e.g. in ~/.bashrc append `PROMPT_HOST_COLOR="\[\033[38;5;048m\]"`
# https://unix.stackexchange.com/a/124409
if [ -z $PROMPT_HOST_COLOR ]; then
    PROMPT_HOST_COLOR="\[\033[01;32m\]"
fi

# add the default git prompt script to prompt https://jon.sprig.gs/blog/post/1940
    # Key:
    # # = no head
    # % = untracked file
    # + = staged changes
    # * = unstaged changes
    # $ = stashed changes
    # = = clean
    # < = behind
    # > = ahead
    # <> = diverged
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM='auto'

# This is the default colorful prompt on Debian/Ubuntu/Mint systems, slightly modified.
# https://stackoverflow.com/a/5380073/614616

# if not defined, define __git_ps1 as a no-op
if ! [[ $(type -t __git_ps1) == function ]]; then
    __git_ps1() { : ; }
fi

if [[ "$TERM" =~ 256color ]]; then
    PS1="${debian_chroot:+($debian_chroot)}${PROMPT_HOST_COLOR}\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[38;5;202m\]\$(__git_ps1)\[\033[00m\] \[\033[90m\]\$\[\033[00m\] "
fi

###############################
# Vars

export PROMPT_COMMAND="history -a" #https://superuser.com/a/602405/79760

export EDITOR=nano

export NNN_OPTS="dH" # show details and hidden files
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4' # https://github.com/jarun/nnn/wiki/Usage#configuration

# make nnn cd on exit: https://github.com/jarun/nnn/wiki/Basic-use-cases#configure-cd-on-quit
# https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_sh_zsh
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # force always cd on exit by exporting here
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}


###############################
# Aliases 

# git has its own aliases in gitconfig
alias g="git"

alias l="ls -lFh --group-directories-first --color=auto"
alias la="ls -lAFh --group-directories-first --color=auto"
alias lsd="ls -lFh --color=auto | grep --color=never '^d'"
alias ls="ls --color=auto"

alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias c="clear"
alias q="exit"

alias t="tmux"
alias ta="tmux attach"
alias tl="tmux ls"
alias tad="tmux detatch"
