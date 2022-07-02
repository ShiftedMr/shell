alias nv='nvim'
alias vi='nvim'
alias vim='nvim'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#tmux
alias ta='tmux attach'


#git
alias show_all_git_changes="find ${HOME}/proj -type d -maxdepth 1 -exec bash ${HOME}/bin/git_branch.sh {} 1 \;  |sed \"s/^\\s*//"\"
alias gcan='git commit --no-edit --amend'
alias gpf='git push --force-with-lease'