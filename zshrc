export PATH="/usr/local/opt/python@3.10/bin:$PATH"

#export PATH="/usr/local/opt/node@16/bin:$PATH"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)
alias ls="ls -haFG --color"

alias gp="git push"
alias gpu="git pull"
alias gcm="git commit -m"

# pnpm
export PNPM_HOME="/Users/harveyqiu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
