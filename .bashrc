# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Required Exports
export terminal='lilyterm'
# Check if nvim is installed. if yes set to editor if no set to vi
if ! command -v nvim &> /dev/null
    then
        export EDITOR='vi'
    else
        export EDITOR='nvim'
fi
export PATH=$PATH":${HOME}/bin/:/bin"

### HISTORY CONFIG BEGIN
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
#give bash tcsh history completion
bind '"\e[B": history-search-forward'
bind '"\e[A": history-search-backward'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=100000
#HISTFILESIZE=200000
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=${HOME}/.bash_eternal_history
### HISTORY CONFIG END



# TODO(S104): Remove if we find this isn't used
# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
# esac
# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi

export PROMPT_COMMAND='export last_exit="$?"; history -a; history -c; history -r; __prompt_command $last_exit'

function parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function __prompt_command() {
    local Exit=$1
    PS1="\n"
    local RCol='\[\e[0m\]'
    local Red='\[\e[0;31m\]'
    local BRed='\[\e[1;31m\]' 
    local Pin='\[\e[0;37m\]'
    local BPin='\[\e[1;37m\]'
    local Grn='\[\e[0;32m\]'
    local BGrn='\[\e[1;32m\]'
    local Gry='\[\e[0;37m\]'
    local DGry='\[\e[1;30m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'
    local BPur='\[\e[1;35m\]'
    local BCya='\[\e[1;36m\]'
    local star=`echo -e "\xE2\x9b\xA4"`
    local timestamp=`date +"%H:%M:%S"`
    local dateee=`date +"%F"`
    local username="$DGry\u$RCol"
    local hostname="$BYel\h$RCol"

    if [[ ! "$Exit" -eq "0" ]]; then
      PS1+="$BRed$timestamp$RCol$BYel$star$RCol $BGry$dateee$RCol"
    else
      PS1+="$BBlu$timestamp$RCol$BYel$star $BGrn$dateee$RCol"
    fi
    if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
    else
      PYTHON_VIRTUALENV="${BYel}[`basename \"$VIRTUAL_ENV\"`]${RCol}"
    fi
    export PS1+="\n${PYTHON_VIRTUALENV} $username@$hostname:$BBlu\w$BPur$(parse_git_branch)$RCol\n$"
}


# Alias definitions.
# You may want to put all your additions into a separate file like
# ${HOME}/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ${HOME}/.bash_aliases ]; then
    . ${HOME}/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi




# PROFILE_ADDITIONS Auto Import Must be last thing in case any aliases conflict with above
if [[ -d ${HOME}/.profile_additions ]]; then
  . ~/.profile_additions/source_me.sh
fi