# zsh shell config

# add user directories to path
export PATH="$HOME/.local/bin:$PATH"

# load individual configurations
if [ -d ~/.zshrc.d ]; then
  for part in ~/.zshrc.d/*; do
    if [ -f "$part" ]; then
      source "$part"
    fi
  done
  unset part
fi
