# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# unset rc

. "$HOME/.cargo/env"

# set cli to vim bindings
set -o vi

# set default text editor to neovim
export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"

# colored manpages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# custom PS1
source /usr/share/doc/git/contrib/completion/git-prompt.sh
export PS1='[\u@\h \W]$(__git_ps1 " (%s) ")\$ '

# Haskell stuff
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# aliases
alias e='$EDITOR' # shorthand editor
alias se='sudo $EDITOR'
alias cv="command -v" # check if program is installed (better than which)
alias la="ls -a"
alias lla="ls -la"
alias c='codium'
alias t='pter ~/todo.txt'

# Start a new terminal session with tmux
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
	tmux new-session -A -s main
fi

