# prompt

autoload -Uz vcs_info
precmd_functions+=(vcs_info)
zstyle ':vcs_info:git:*' formats '%F{3}(%b)%f '

PROMPT='%F{6}%~%f ${vcs_info_msg_0_}%# '

if [[ -n "$SSH_CONNECTION" ]]; then
  PROMPT="%F{7}(%m) %f${PROMPT}"
fi
