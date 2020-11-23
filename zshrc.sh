# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH="/Users/EDVXDPK/.oh-my-zsh"

#set JAVA_HOME
JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME

#check if nvmrc present
check_nvm(){
    FILE=.nvmrc
    if test -f "$FILE"; then
        nvm use
    fi
}

#check if wdio.conf.sh present
check_wdio_config(){
    FILE='./wdio.conf.sh'
    if test -f "$FILE"; then
        source ./wdio.conf.sh
    fi
}

check_nvm
check_wdio_config

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="af-magic"
ZSH_THEME="agnoster"

# MAKE SURE TO FIND A WAY TO INSTALL AGNOSTER THEME AND CHANGE THE FONTS

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

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
plugins=(
    git
    bundler
    dotenv
    osx
    rake
    rbenv
    ruby
    kubectl
    helm
    zsh-autosuggestions
)

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


export PATH="/usr/local/opt/helm@2/bin:$PATH"
export PATH="/usr/local/opt/helm@2/bin:$PATH"

source /dev/stdin <<<"$(cat <(gpg --quiet --decrypt ~/.shadow-cljs/credentials.gpg))"

# To dynamically change the cluster config
set_cluster() {
  cluster_name=$1;
  printf "$1"
  case $1 in

  todd013)
    {
      "$(cat ~/Desktop/work-clusters/${cluster_name}-config.yml > ~/.kube/config)"
    } &> /dev/null
    ;;

  hoff095)
    {
      "$(cat ~/Desktop/work-clusters/${cluster_name}-config.yml > ~/.kube/config)"
    } &> /dev/null
    ;;

  hoff140)
    {
      "$(cat ~/Desktop/work-clusters/${cluster_name}-config.yml > ~/.kube/config)"
    } &> /dev/null
    ;;

  hahn170)
    {
      "$(cat ~/Desktop/work-clusters/${cluster_name}-config.yml > ~/.kube/config)"
    } &> /dev/null
    ;;

  *)
    printf "\nnConfig Not found\n"
    "$(cat ~/.kube/config)"
    ;;
esac
}

# A general utility to sync current branch with the branch you pass as the parameter
sync_branch() {
  branch=$1;
  current_branch="$(git rev-parse --abbrev-ref HEAD)"
  if [ $? -eq 0 ]
    then
      switch_status="$(git checkout $branch)"
      {
        pull_status="$(git pull)"
        switch_status="$(git checkout $current_branch)"
      } &> /dev/null # Dont give user any echo
      sleep .5
      printf "\nMerging $branch into $current_branch\n"
      merge_status="$(git merge $branch)"
      printf "\n$(git status)"
    else
      printf "\nNot in repo"
  fi
}

delete_snamespace() {
  name_space=$1;
  echo "\nAre you sure you want to Delete?\n1. Yes\n2. No"
  read confirmation
  if [ $confirmation -eq 1 ]
      then
      charts="$(helm ls --namespace $name_space | awk 'BEGIN { ORS=" " }; { print $1 }' | sed 's/NAME//g')"
      echo "\nDeleting Charts->$charts"
      purge_status="$(helm del --purge $charts)"
      delete_status="$(helm del --purge $charts)"
      kubectl delete secrets -n $name_space ldap
      kubectl delete secret replication superuser postgres -n $name_space
      echo "\nDeleting $name_space namespace\n"
      kubectl delete namespace $name_space
  elif [ $confirmation -eq 2 ]
      then
      exit
  else
      echo "\nInvalid Selection"
      exit
  fi
}

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

alias cdc="node ~/Ericsson/code/cenx/apps/tools/cenx-directive-tool/src/index.js"

fault-repl() {
    local ip=$(kubectl get pod -l app=eric-cenx-fault -o jsonpath={.items..status.hostIP})
    local port=$(kubectl get svc -l app=eric-cenx-fault -o jsonpath='{.items..spec.ports[?(@.name=="fault-replport")].nodePort}')
    echo "Connecting to fault repl on $ip:$port"
    lein repl :connect $ip:$port
}

% function chpwd () { check_nvm && check_wdio_config }