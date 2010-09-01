#!/bin/zsh

# Functions
function precmd()
{
    # Adjust this to your current preferred prompt
    PROMPT="[%n${cg}@${cn}%m"
    local _git _branch

    # This call requires the "findup" script from http://www.davidfaure.fr/scripts
    _git=`findup .git`

    if test -n "$_git"; then
        _branch=`sed -e 's,.*/,,' $_git/HEAD`
        PROMPT="$PROMPT - ${cg}$_branch${cn}"
    fi

    # Alternative solution, from Mike Arthur: something like:
    # BRANCH_REFS=$(git symbolic-ref HEAD 2>/dev/null); PROMPT="$PROMPT (${BRANCH_REFS#refs/heads/})"

    # Add final character after the optional git branch (usually # or >)
    export PROMPT="$PROMPT] ${cr}%(!.#.$)${cn} "
}

# completion
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

# correction
setopt correctall

# prompt
autoload -U colors
colors
cn="%{$reset_color%}"
cr="%{$fg[red]%}"
cg="%{$fg[green]%}"

export RPROMPT="[${cr}%~${cn}]"

# history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# autocd
setopt autocd

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
