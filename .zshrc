# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Standard path for binaries
export PATH="$HOME/.local/bin:$PATH"

# Source machine-specific config (not tracked in git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Theme
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ASYNC="false"
SPACESHIP_PACKAGE_SHOW="false"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_NODE_SHOW="true"
SPACESHIP_EXEC_TIME_SHOW="true"
SPACESHIP_GIT_ASYNC="false"
SPACESHIP_GIT_STATUS_ASYNC="false"
SPACESHIP_DIR_TRUNC="1"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# nvm (if installed)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pyenv (if installed - phasing this out, use uv)
if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
fi

# fzf keybindings and completion
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi
# zoxide (smarter cd)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
# CLI tool aliases (only if installed)
command -v eza &> /dev/null && alias ls="eza"
command -v eza &> /dev/null && alias ll="eza -l"
command -v eza &> /dev/null && alias la="eza -la"
command -v bat &> /dev/null && alias cat="bat"
command -v fd &> /dev/null && alias find="fd"
command -v rg &> /dev/null && alias grep="rg"

# Custom aliases

# claude tmux sessions
alias agt1="tmux attach -t agent1"
alias agt2="tmux attach -t agent2"

# fzf -> view in vs code
fv() {
    local file
    file=$(fzf --preview 'bat --color=always --style=numbers {}') && code "$file"
}
# Kill process interactively
fkill() {
    ps aux | fzf --height 40% | awk '{print $2}' | xargs kill
}
# Git checkout branch with preview
gfb() {
    git branch --all | fzf --preview 'git log --oneline -20 {}' | xargs git checkout
}

# Devcontainer shortcuts (ignored inside containers)
alias ds='devcontainer up --workspace-folder . --dotfiles-repository https://github.com/gortron/dotfiles && devcontainer exec --workspace-folder . zsh'
alias dc='devcontainer up --workspace-folder . --dotfiles-repository https://github.com/gortron/dotfiles && devcontainer exec --workspace-folder . claude'
