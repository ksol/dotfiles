#! /usr/bin/env zsh

# Git dirty state of current repo
function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo $1
}

function git_pretty_rev_name() {
  local _branch
  _branch=$(git symbolic-ref -q HEAD)

  if [ $? -eq 0 ]; then
    if [[ ${_branch} == refs/(heads|tags)/* ]]; then
      echo ${_branch#refs/(heads|tags)/}
    fi
  else
    _branch=$(git name-rev --name-only --no-undefined --always HEAD)
    if [ $? -ne 0 ]; then
      return 1
    elif [[ ${_branch} == remotes/* ]]; then
      echo ${_branch#remotes/}
    fi
  fi
}
