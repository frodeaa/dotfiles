set -o vi
shopt -s histappend              # append new history items to .bash_history

alias g=git
alias src="cd ~/src"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export AUDIBLE_ACTIVATION_BYTES=5e855901
export EDITOR=/usr/local/bin/vim
export HH_CONFIG=hicolor         # get more colors
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export HOMEBREW_NO_ANALYTICS=1
export PINENTRY_USER_DATA="USE_CURSES=1"
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "hh -- \C-j"'; fi

PS1="\t\[$(tput sgr0)\] \[\033[0;32m\]\u@\h \[\e[1;33m\]\w\[\033[1;31m\]\$(git branch 2>/dev/null \
	 | grep -e '\* ' | sed 's/^..\(.*\)/ (\1)/')\[\033[0;00m\]\n \$ "
