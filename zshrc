export PATH="/usr/local/opt/python@3.10/bin:$PATH"

export PATH="/usr/local/opt/node@16/bin:$PATH"

export PATH="$HOME/.deno/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)
alias ls="ls -haFG --color"

alias gp="git push"
alias gpu="git pull"
alias gcm="git commit -m"

alias dd="cd ../"

alias cat="bat"

# pnpm
export PNPM_HOME="/Users/harveyqiu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

eval "$(zoxide init zsh)"
