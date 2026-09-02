fastfetch


# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# Better CD
setopt AUTO_CD
setopt AUTO_PUSHD

# Better completion
autoload -Uz compinit
compinit

# Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"

# Useful aliases
alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias la='eza -a --icons'
alias apt='dnf'

# Added by Antigravity CLI installer
export PATH="/home/sahariashihab/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

alias cat='bat'

alias update='sudo dnf upgrade --refresh'
alias install='sudo dnf install'
alias remove='sudo dnf remove'
alias cls='clear'

# Optional distro-specific aliases
# alias apt='sudo dnf'
# alias update='sudo dnf upgrade --refresh'
# alias install='sudo dnf install'
# alias remove='sudo dnf remove'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gitlogsimple="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)%an%C(reset)'"
alias gitlog="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)— %an%C(reset)'"

# Others
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Make & CD
mkcd() {
    mkdir -p "$1" && cd "$1"
}

extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.gz|*.tgz) tar -xzf "$1" ;;
            *.tar.bz2) tar -xjf "$1" ;;
            *.tar.xz) tar -xJf "$1" ;;
            *.tar) tar -xf "$1" ;;
            *.zip) unzip "$1" ;;
            *.7z) 7z x "$1" ;;
            *.rar) unrar x "$1" ;;
            *) echo "Cannot extract: $1" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$PATH:/home/sahariashihab/.turso"
export CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL=1
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/sahariashihab/.opencode/bin:$PATH
