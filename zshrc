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

export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -v
bindkey -M vicmd v edit-command-line
rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}
rgap-fzf() {
	RG_PREFIX="rga --files-with-matches --glob '!*.pdf'"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true


alias rf="rga-fzf"
alias rfp="rgap-fzf"
alias f='open "$(fzf)"'
alias cf='open "$(pinyin-stdout)"'
bindkey "ç" fzf-cd-widget
alias gu="gitui"
alias rgap="rga --glob '!*.pdf'"
alias kdp="cd ~/OneDrive/kinding/project"
alias kd="cd ~/OneDrive/kinding/"
eval "$(starship init zsh)"
