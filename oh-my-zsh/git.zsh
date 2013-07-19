alias gst='git st'
compdef _git gst=git-status
alias gg='git grep'
compdef _git gg=git-grep
alias ggi='git grep -i'
compdef _git gg=git-grep
alias gpr='git pull --rebase'
compdef _git gpr=git-pull

alias gstage='git co staging && git mg master && git co master'
alias gprod='git co production && git mg staging && git co master'
alias gsp='git co staging && git mg master && git co production && git mg staging && git co master'
