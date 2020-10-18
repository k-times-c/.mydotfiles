# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/KXC/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Setting PATH for MongoDB and Python
# export PATH="~/Mongodb/mongodb-macos-x86_64-enterprise-4.2.0/bin:$PATH"
#export /Users/KXC/Library/Python/3.7/bin:$PYTHONPATH"

# setting ruby install for homebrew
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"


# My aliases

# postgres aliases
    alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

alias python=python3
alias mvim='mvim -v'
alias svpn='piactl connect'
alias code="open -a Visual\ Studio\ Code"
alias vimgolf="/usr/local/lib/ruby/gems/2.6.0/gems/vimgolf-0.4.8/bin/vimgolf"
alias cmu="~/Documents/Code/engagements/cmu"
alias JSC='/Users/KXC/Documents/MyClasses/IntroToJavascipt/complete-javascript-course/9-forkify/starter'
alias CHW='~/Documents/Code/CognizantHW/current_hw/python_files/src/'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/KXC/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/KXC/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/KXC/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/KXC/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Apache Spark/Hadoop stuff
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home
export SPARK_HOME=/Users/KXC/Spark/spark-2.4.4-bin-hadoop2.7
export HADOOP_HOME=/usr/local/Cellar/hadoop/3.2.1/libexec
export PATH=$PATH:${SPARK_HOME}/bin
#export PATH=$PATH:$SCALA_HOME
alias hstart='/usr/local/Cellar/hadoop/3.2.1/libexec/sbin/start-dfs.sh'
alias hstop='/usr/local/Cellar/hadoop/3.2.1/libexec/sbin/stop-dfs.sh'

ctags=/usr/local/bin/ctags

export NVM_DIR="/Users/KXC/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# # set editing-mode vi for shell (when you hit ESC within a command you are put
# # into normal mode in vim
# set -o vi

# # Better searching in command mode
# bindkey -M vicmd '?' history-incremental-search-backward
# bindkey -M vicmd '/' history-incremental-search-forward

# # Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

# Updates editor information when the keymap changes.
##function zle-keymap-select() {
##  zle reset-prompt
##  zle -R
##}
##
##zle -N zle-keymap-select
##
##function vi_mode_prompt_info() {
##  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
##}
##

# # define right prompt, regardless of whether the theme defined it
# RPS1='$(vi_mode_prompt_info)'
# RPS2=$RPS1

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
export EDITOR=vim
export VISUAL="$EDITOR"

stty -ixon
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git commands
git config --global color.ui auto
alias config='/usr/bin/git --git-dir=/Users/KXC/.mydotfiles/ --work-tree=/Users/KXC'
