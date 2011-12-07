### Zsh environment file
#
# This file is loaded by zsh even during non-interactive sessions.

# Loading enabled modules
for file in ~/.zshrc.d/enabled/*.env; do
  source $file
done
