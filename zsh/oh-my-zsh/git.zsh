alias glu='git pull upstream --rebase'
alias gdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias grp='git remote prune'

alias gg='git grep --color -n'
compdef _git gg=git-grep
