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
