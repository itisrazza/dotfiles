# bun

[ -d "$HOME/.bun" ] || return

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
