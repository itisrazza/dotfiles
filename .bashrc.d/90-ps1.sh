PS1='\[\e[38;5;6m\]\w\[\e[0m\] \$ '

if test ! -z "$SSH_CONNECTION"; then
  PS1="\[\e[37m\](\h) ${PS1}"
fi
