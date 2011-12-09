### Zsh resource file.
#
# If you want your settings to have effect even during non interactive-sessions,
# Put them in ~/.zshenv

# Loading enabled modules
for file in ~/.zshrc.d/enabled/*; do
  source $file
done
