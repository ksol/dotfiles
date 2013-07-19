function rails_current_version {
  if [ -f Gemfile.lock ]; then
    echo "${ZSH_THEME_RAILS_PROMPT_PREFIX}$(cat Gemfile.lock | egrep '^(\ )*rails \([0-9brc\.]*\)' | cut -d ' ' -f 6 | cut -d '(' -f 2 | cut -d ')' -f 1)${ZSH_THEME_RAILS_PROMPT_SUFFIX}"
  fi
}
 
# Ruby version via rbenv
if which rbenv &> /dev/null; then
  KSOL_CURRENT_RUBY="[%{$fg[magenta]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[white]%}%{$reset_color%}\$(rails_current_version)\$(git_prompt_info)]"
fi
 
KSOL_USER_MACHINE="[%n%{$fg[green]%}@%{$reset_color%}%m]"
 
# Use a % for normal users and a # for privelaged (root) users.
KSOL_PROMPT_CHAR="%{$fg[red]%}%(!.#.$)%{$reset_color%}"
 
# Starts rails version
ZSH_THEME_RAILS_PROMPT_PREFIX=" %{$fg[cyan]%}"
 
# Close it all off by resetting the color and styles.
ZSH_THEME_RAILS_PROMPT_SUFFIX="%{$reset_color%}"
 
# Starts prompt with space, make it green
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
 
# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
 
# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""
 
# Add 1 red * if this branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
 
# Prompts
PROMPT="$KSOL_USER_MACHINE $KSOL_CURRENT_RUBY $KSOL_PROMPT_CHAR "
RPROMPT="[%{$fg[red]%}%~%{$reset_color%}]"