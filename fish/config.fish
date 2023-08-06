#if status is-interactive
#    # Commands to run in interactive sessions can go here
#    eval "$(zellij setup --generate-auto-start fish)"
#end

# fish config

set PATH $HOME/.deno/bin $PATH


# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

alias ze "zellij"

alias ls "ls -haFG --color"

alias gp "git push"
alias gpu "git pull"
alias gcm "git commit -m"

alias dd "cd ../"

alias cat "bat"

# pnpm
set -x PNPM_HOME $HOME/Library/pnpm
set PATH $PNPM_HOME $PATH
# pnpm end

set -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec
set PATH $PATH $GOPATH/bin
set PATH $PATH $GOROOT/bin

set -x EDITOR nvim
function edit-command-line
    commandline -f edit
end

function rga-fzf
    set RG_PREFIX 'rga --files-with-matches'
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && \
    echo "opening $file" && \
    open "$file"
end

function rga-fzf
    set RG_PREFIX "rga --files-with-matches --glob '!*.pdf'"
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && \
    echo "opening $file" && \
    open "$file"
end

function brcd
    cd $(broot --only-folders --hidden --cmd "$1;:pp")
end

alias rf rga-fzf
alias rfp rgap-fzf
alias f 'open "$(fzf)"'
alias cf 'open "$(pinyin-stdout)"'
bind \ç fzf-cd-widget
alias gu gitui
alias rgap "rga --glob '!*.pdf'"
alias sb subl
alias kdp "cd ~/OneDrive/kinding/project"
alias kd "cd ~/OneDrive/kinding/"
alias lc "cd ~/Obsidian/LawChiu/"
alias lcc "cd ~/Obsidian/LawChiu/ClientProject/"
alias lccn "cd ~/Obsidian/LawChiu/ClientProject/Note"

source /Users/harveyqiu/.config/fish/functions/br.fish 
