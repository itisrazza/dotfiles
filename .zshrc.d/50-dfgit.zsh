# dotfiles management

export DOTFILES_COMMON="$HOME/src/itisrazza/dotfiles/common"
export DOTFILES_PLATFORM="$HOME/src/itisrazza/dotfiles/platform"
export DOTFILES_SECRET="$HOME/src/itisrazza/dotfiles/secret"

alias dfgit="git --git-dir=\"${DOTFILES_COMMON}\" --work-tree=\"${HOME}\""
alias dfpgit="git --git-dir=\"${DOTFILES_PLATFORM}\" --work-tree=\"${HOME}\""
alias dfsgit="git --git-dir=\"${DOTFILES_SECRET}\" --work-tree=\"${HOME}\""
