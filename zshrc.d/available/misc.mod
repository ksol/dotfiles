# Miscellaneous configuration

export CLICOLOR=1                 # Enabling `ls` colors
export HISTSIZE=2000              # How many lines kept in history
export SAVEHIST=$HISTSIZE         
export HISTFILE="$HOME/.history"  # History file

setopt correctall                 # Correction                              
setopt autocd                     # Typing a path will cd to that path      
setopt hist_ignore_all_dups       # Remove duplicates in history            
setopt hist_ignore_space          # Won't log commands starting with a space

