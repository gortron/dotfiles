# Path to your oh-my-zsh installation.
export ZSH="/Users/glanza/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="half-life"
ZSH_THEME="spaceship"
SPACESHIP_PACKAGE_SHOW="false"
SPACESHIP_TIME_SHOW="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions) # brew install zsh-completions zsh-syntax-highlighting zsh-autosuggestions 

source $ZSH/oh-my-zsh.sh

# From pyenv setup
eval "$(pyenv init -)"

# From nvm setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# From yarn setup
# corepack enable

# From swift setup
export TOOLCHAINS=swift

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/glanza/.lmstudio/bin"

# To get tkinter working for python
export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"
export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
export PATH="$HOME/.local/bin:$PATH"

# Custom aliases
alias agt1="tmux attach -t agent1"
alias agt2="tmux attach -t agent2"

# Devcontainer shortcuts
alias ds='devcontainer up --workspace-folder . && devcontainer exec --workspace-folder . zsh'
alias dc='devcontainer up --workspace-folder . && devcontainer exec --workspace-folder . claude'
