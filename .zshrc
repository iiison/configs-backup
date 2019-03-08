# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/bharatsoni/.oh-my-zsh

#Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Power level configs
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
##POWERLEVEL9K_VCS_UNTRACKED_ICON='?'


POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon load dir vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_music custom_js custom_react dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(load battery)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

# Add the custom Medium M icon prompt segment
POWERLEVEL9K_CUSTOM_REACT="echo -n '\uFC06'"
POWERLEVEL9K_CUSTOM_REACT_FOREGROUND="blue"
POWERLEVEL9K_CUSTOM_REACT_BACKGROUND="white"
# Add the custom freeCodeCamp prompt segment
# POWERLEVEL9K_CUSTOM_JS="echo -n '\uE242' freeCodeCamp"
POWERLEVEL9K_CUSTOM_JS="echo -n '\ue74e'"
POWERLEVEL9K_CUSTOM_JS_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_JS_BACKGROUND="yellow"

# Add the custom freeCodeCamp prompt segment
POWERLEVEL9K_CUSTOM_MUSIC="echo -n '\uf7ca'  '\u2665'"
POWERLEVEL9K_CUSTOM_MUSIC_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_MUSIC_BACKGROUND="magenta"


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions sublime)

source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions configurations
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=8

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias lc='colorls -lA --sd'

# User colors for LS
# source $(dirname $(gem which colorls))/tab_complete.sh
# echo $(gem which colorls) 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source $HOME/.zshenv

export PATH="/usr/local/opt/openssl/bin:$PATH"
source  ~/powerlevel9k/powerlevel9k.zsh-theme

# Command History for Auto-complete
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS # removes older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_DUPS     # does not enter immediate duplicates into the history.
setopt HIST_IGNORE_SPACE    # removes commands from the history that begin with a space.
setopt HIST_SAVE_NO_DUPS    # ommits older commands that duplicate newer ones when saving.
setopt HIST_VERIFY          # doesn't execute the command directly upon history expansion.
setopt SHARE_HISTORY
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/bharatsoni/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
