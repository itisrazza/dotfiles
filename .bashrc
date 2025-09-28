#
# bash shell config

# system configration first
[ -f /etc/bashrc ] && source /etc/bashrc

# add user directories to path
export PATH="$HOME/.local/bin:$PATH"

# load individual configurations 
if [ -d ~/.bashrc.d ]; then
  for part in ~/.bashrc.d/*; do
    if [ -f "$part" ]; then
      source "$part"
    fi
  done
fi
unset part
