#alias ls='ls --color=auto'
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#tmux
alias ta='tmux attach'

#git
alias show_all_git_changes="find ~/proj -type d -maxdepth 1 -exec bash ~/bin/git_branch.sh {} 1 \;  |sed \"s/^\\s*//"\"
alias gcan='git commit --no-edit --amend'
alias gpf='git push --force-with-lease'

#circlesudo
alias fudo='/Users/fsmith/bin/fudo.sh'
alias cudo='/Users/fsmith/bin/cudo.sh'
alias gacp="git add . && git commit -S && git push"

