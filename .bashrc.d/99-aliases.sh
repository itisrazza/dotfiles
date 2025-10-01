# aliases

# cd
mkdcd() { mkdir -p "$1"; cd "$1"; }
cdls()  { cd "$1"; ls "$1"; }

# git
alias gpl="git pull --rebase"
alias gplm="git pull"
alias gps="git push" 
alias gpfwl="git push --force-with-lease"
