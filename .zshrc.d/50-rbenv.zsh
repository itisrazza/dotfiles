# rbenv

test -d "$HOME/.rbenv" || return

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
