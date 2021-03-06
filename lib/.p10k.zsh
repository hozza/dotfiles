# Modified & Slimmed by @hozza

# Generated by Powerlevel10k configuration wizard on 2019-08-12 at 15:14 UTC.
# Based on romkatv/powerlevel10k/config/p10k-lean.zsh, checksum 34415.
# Wizard options: nerdfont-complete + powerline, small icons, lean, 2 lines, solid, sparse, few icons, concise.

# Tip: Looking for a nice color? Here's a one-liner to print colormap.
#   for i in {0..255}; do print -Pn "%${i}F${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+$'\n'}; done

if [[ -o 'aliases' ]]; then
	# Temporarily disable aliases.
	'builtin' 'unsetopt' 'aliases'
	local p10k_lean_restore_aliases=1
else
	local p10k_lean_restore_aliases=0
fi

() {
	emulate -L zsh
	setopt no_unset
	local LC_ALL=C.UTF-8

	# Unset all configuration options. This allows you to apply configiguration changes without
	# restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
	unset -m 'POWERLEVEL9K_*'

	typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
		# =========================[ Line #1 ]=========================
		# os_icon               # os identifier
		dir                     # current directory
		vcs                     # git status
		# =========================[ Line #2 ]=========================
		newline
		prompt_char             # prompt symbol
	)

	typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
		# =========================[ Line #1 ]=========================
		status                  # exit code of the last command
		command_execution_time  # duration of the last command
		background_jobs         # presence of background jobs

		virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
		anaconda                # conda environment (https://conda.io/)
		pyenv                   # python environment (https://github.com/pyenv/pyenv)
		nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
		nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
		nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
		node_version            # node.js version
		go_version              # go version (https://golang.org)
		rust_version            # rustc version (https://www.rust-lang.org)
		rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
		rvm                     # ruby version from rvm (https://rvm.io)
		kubecontext             # current kubernetes context (https://kubernetes.io/)

		context                 # user@host
		disk_usage
		# =========================[ Line #2 ]=========================
		newline
		# public_ip             # public IP address
		# battery               # internal battery
		# time                  # current time
		# example               # example user-defined segment (see prompt_example function below)
	)

	# Basic style options that define the overall look of your prompt.
	typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol

	typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER// }'

	# This option makes a difference only when default icons are enabled for all or some prompt
	# segments (see POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION above). LOCK_ICON can be printed as
	# $'\uE0A2', $'\uE138' or $'\uF023' depending on POWERLEVEL9K_MODE. The correct value of this
	# parameter depends on the provider of the font your terminal is using.
	#
	#   Font Provider                    | POWERLEVEL9K_MODE
	#   ---------------------------------+-------------------
	#   Powerline                        | powerline
	#   Font Awesome                     | awesome-fontconfig
	#   Adobe Source Code Pro            | awesome-fontconfig
	#   Source Code Pro                  | awesome-fontconfig
	#   Awesome-Terminal Fonts (regular) | awesome-fontconfig
	#   Awesome-Terminal Fonts (patched) | awesome-patched
	#   Nerd Fonts                       | nerdfont-complete
	#   Other                            | compatible
	typeset -g POWERLEVEL9K_MODE=nerdfont-complete

	typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true

	typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

	typeset -g POWERLEVEL9K_SHOW_RULER=false
	typeset -g POWERLEVEL9K_RULER_CHAR='─'        # reasonable alternative: '·'
	typeset -g POWERLEVEL9K_RULER_FOREGROUND=240

	typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='─'
	if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
	typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=240
	typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
	typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
	typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
	typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
	fi

	################################[ prompt_char: prompt symbol ]################################
	typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=76
	typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=196
	typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=':'
	typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
	typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'
	typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''

	##################################[ dir: current directory ]##################################
	typeset -g POWERLEVEL9K_DIR_FOREGROUND=grey23
	typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
	typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
	typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=103
	typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
	typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
	typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER='(.shorten_folder_marker|.bzr|CVS|.git|.hg|.svn|.terraform|.citc)' # don't shorten
	typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
	typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
	typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
	typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true

	typeset -g POWERLEVEL9K_DIR_CLASSES=(
		'~/projects(/*)#' WORK '[]'
		'~(/*)#' HOME '[]'
	)
	typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=mediumpurple3
	typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND=31

	#####################################[ vcs: git status ]######################################
	typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
	typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

	# Git status: feature:master#tag ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
	# You can edit the lines below to customize how Git status looks.
	# VCS_STATUS parameters are set by gitstatus plugin. See reference:
	# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
	local vcs=''
	# 'feature' or '@72f5c8a' if not on a branch.
	vcs+='${${VCS_STATUS_LOCAL_BRANCH:+%76F'${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}'${VCS_STATUS_LOCAL_BRANCH//\%/%%}}'
	vcs+=':-%f@%76F${VCS_STATUS_COMMIT[1,8]}}'
	# ':master' if the tracking branch name differs from local branch.
	vcs+='${${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH}:+%f:%76F${VCS_STATUS_REMOTE_BRANCH//\%/%%}}'
	# '#tag' if on a tag.
	vcs+='${VCS_STATUS_TAG:+%f#%76F${VCS_STATUS_TAG//\%/%%}}'
	# ⇣42 if behind the remote.
	vcs+='${${VCS_STATUS_COMMITS_BEHIND:#0}:+ %76F⇣${VCS_STATUS_COMMITS_BEHIND}}'
	# ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
	# If you want '⇣42 ⇡42' instead, replace '${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }' with ' '.
	vcs+='${${VCS_STATUS_COMMITS_AHEAD:#0}:+${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }%76F⇡${VCS_STATUS_COMMITS_AHEAD}}'
	# *42 if have stashes.
	vcs+='${${VCS_STATUS_STASHES:#0}:+ %76F*${VCS_STATUS_STASHES}}'
	# 'merge' if the repo is in an unusual state.
	vcs+='${VCS_STATUS_ACTION:+ %196F${VCS_STATUS_ACTION//\%/%%}}'
	# ~42 if have merge conflicts.
	vcs+='${${VCS_STATUS_NUM_CONFLICTED:#0}:+ %196F~${VCS_STATUS_NUM_CONFLICTED}}'
	# +42 if have staged changes.
	vcs+='${${VCS_STATUS_NUM_STAGED:#0}:+ %227F+${VCS_STATUS_NUM_STAGED}}'
	# !42 if have unstaged changes.
	vcs+='${${VCS_STATUS_NUM_UNSTAGED:#0}:+ %227F!${VCS_STATUS_NUM_UNSTAGED}}'
	# ?42 if have untracked files. It's really a question mark, your font isn't broken.
	# See POWERLEVEL9K_VCS_UNTRACKED_ICON below if you want to use a different icon.
	# Remove the next line if you don't want to see untracked files at all.
	vcs+='${${VCS_STATUS_NUM_UNTRACKED:#0}:+ %39F'${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}'${VCS_STATUS_NUM_UNTRACKED}}'
	# If P9K_CONTENT is not empty, leave it unchanged. It's either "loading" or from vcs_info.
	vcs="\${P9K_CONTENT:-$vcs}"

	typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
	typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_CONTENT_EXPANSION=$vcs
	typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION=${${vcs//\%f}//\%<->F}
	typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
	typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
	typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=76
	typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=

	# Show status of repositories of these types. You can add svn and/or hg if you are
	# using them. If you do, your prompt may become slow even when your current directory
	# isn't in an svn or hg reposotiry.
	typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

	# These settings are used for respositories other than Git or when gitstatusd fails and
	# Powerlevel10k has to fall back to using vcs_info.
	typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
	typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
	typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=227

	##########################[ status: exit code of the last command ]###########################
	typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

	# Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
	typeset -g POWERLEVEL9K_STATUS_OK=false
	typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
	typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

	# Status when some part of a pipe command fails but the overall exit status is zero. It may look
	# like this: 1|0.
	typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
	typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=70
	typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

	# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
	# it will signify error by turning red.
	typeset -g POWERLEVEL9K_STATUS_ERROR=false
	typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
	typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='↵'

	# Status when the last command was terminated by a signal.
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=160
	# Use terse signal names: "INT" instead of "SIGINT(2)".
	typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='↵'

	# Status when some part of a pipe command fails and the overall exit status is also non-zero.
	# It may look like this: 1|0.
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=160
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='↵'

	###################[ command_execution_time: duration of the last command ]###################
	# Show duration of the last command if takes longer than this many seconds.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=

	#######################[ background_jobs: presence of background jobs ]#######################
	typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
	typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=70
	typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER// }'

	####################################[ context: user@host ]####################################
	typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180
	typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

	# Context color when running with privileges.
	typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=227
	typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'

	# Don't show context unless running with privileges on in SSH.
	typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
	typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

	###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
	typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=37
	typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
	typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

	#####################[ anaconda: conda environment (https://conda.io/) ]######################
	typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=37
	typeset -g POWERLEVEL9K_ANACONDA_SHOW_PYTHON_VERSION=false
	typeset -g POWERLEVEL9K_ANACONDA_{LEFT,RIGHT}_DELIMITER=

	################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
	typeset -g POWERLEVEL9K_PYENV_FOREGROUND=37
	typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false

	##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
	typeset -g POWERLEVEL9K_NODENV_FOREGROUND=70
	typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false

	##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
	typeset -g POWERLEVEL9K_NVM_FOREGROUND=70

	############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
	typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=70
	typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
	typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=

	##############################[ node_version: node.js version ]###############################
	typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=70
	typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true

	#######################[ go_version: go version (https://golang.org) ]########################
	typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=37
	typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true

	#################[ rust_version: rustc version (https://www.rust-lang.org) ]##################
	typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=37
	typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true

	#############[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]##############
	typeset -g POWERLEVEL9K_RBENV_FOREGROUND=168
	typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false

	#######################[ rvm: ruby version from rvm (https://rvm.io) ]########################
	typeset -g POWERLEVEL9K_RVM_FOREGROUND=168
	typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
	typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false

	#############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
	# Kubernetes context classes for the purpose of using different colors, icons and expansions with
	# different contexts.
	typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=('*' DEFAULT)
	typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=134
	typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'

	###############################[ public_ip: public IP address ]###############################
	typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=94

	################################[ battery: internal battery ]#################################
	typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
	typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=1
	typeset -g POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=70
	typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=178
	typeset -g POWERLEVEL9K_BATTERY_STAGES='▁▂▃▄▅▆▇'
	typeset -g POWERLEVEL9K_BATTERY_VISUAL_IDENTIFIER_EXPANSION='%K{232}${P9K_VISUAL_IDENTIFIER}%k'
	typeset -g POWERLEVEL9K_BATTERY_CHARGED_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
	typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false

	####################################[ time: current time ]####################################
	typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
	typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
	typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
	typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=
}

(( ! p10k_lean_restore_aliases )) || setopt aliases
'builtin' 'unset' 'p10k_lean_restore_aliases'
