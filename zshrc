### Zsh resource file.
#
# If you want your settings to have effect even during non interactive-sessions,
# Put them in ~/.zshenv

# Loading system profile. Zsh does not do this automatically
source /etc/profile

# Loading enabled modules
for file in ~/.zshrc.d/enabled/*.mod; do
  source $file
done
