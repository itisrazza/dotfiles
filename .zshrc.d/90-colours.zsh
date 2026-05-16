# colourised commands

if ls --color=auto / &>/dev/null 2>&1; then
  alias ls="ls --color=auto"
else
  alias ls="ls -G"
fi

alias diff="diff --color=auto"
alias grep="grep --color=auto"

if command -v ip &>/dev/null; then
  alias ip="ip -color=auto"
fi

# less
export LESS='-R --use-color -Dd+r$Du+b$'
