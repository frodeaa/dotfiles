set -o vi
shopt -s histappend              # append new history items to .bash_history

alias g=git
alias src="cd ~/src"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lb='vim ~/Documents/logbook/$(date "+%Y-%m-%d").md'

export AUDIBLE_ACTIVATION_BYTES=5e855901
export EDITOR=/usr/local/bin/vim
export FIGNORE=$FIGNORE:DS_Store
export HH_CONFIG=hicolor         # get more colors
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export LANG=en
export PATH="$HOME/.bin:/usr/local/bin:$PATH"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5"
export PERL5LIB="$PERL_LOCAL_LIB_ROOT/lib/perl5"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_LIB_ROOT\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
export PATH="$PERL_LOCAL_LIB_ROOT/bin:$PATH";
export PINENTRY_USER_DATA="USE_CURSES=1"
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

source /usr/local/etc/bash_completion.d/pass
source /usr/local/etc/bash_completion.d/git-completion.bash

print_colors() {
  for i in {0..255} ; do printf "\x1b[38;5;${i}m███████████████"; printf "%03d" ${i}; done
}

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "hh -- \C-j"'; fi

PS1="\t\[$(tput sgr0)\] \[\033[0;32m\]\u@\h \[\e[1;33m\]\w\[\033[1;31m\]\$(git branch 2>/dev/null \
	 | grep -e '\* ' | sed 's/^..\(.*\)/ (\1)/')\[\033[0;00m\]\n \$ "
