# oh-my-zsh

[ -d "$HOME/.oh-my-zsh" ] || return

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
