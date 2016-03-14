export ANDROID=/Users/adamgeorgeson/Library/Android/sdk
export GOPATH=/Users/adamgeorgeson/dev/go

export MYSQL_USERNAME='root'
export MYSQL_PASSWORD='admin'

export CC=/usr/local/bin/gcc-4.2
export CXX=/usr/local/bin/g++-4.2
export MACOSX_DEPLOYMENT_TARGET=10.9 # Resolves issues with nokogiri gem installation

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/cellar:$PATH"
export PATH="$ANDROID/platform-tools:$PATH"
export PATH="$HOME/.rbenv/versions/2.1.5/lib/ruby/gems/2.1.0/bin:$PATH"

export MYSQL_USERNAME=root
export MYSQL_PASSWORD=admin

export DEFERRED_GARBAGE_COLLECTION=true
export EDITOR='vim'

# Local API Testing
# ngrok start --all
export TUNNELED_MS1='http://mso-adamgeorgeson.ngrok.io'
export TUNNELED_GAC='http://gac-adamgeorgeson.ngrok.io'
alias apiboot="MS1_UK_ACCOUNTS_EXTRA_SERVER=$TUNNELED_GAC GAC_MYSAGEONE_SERVER=$TUNNELED_MS1 bundle exec rails s"
alias apibootus="MS1_US_ACCOUNTS_EXTRA_SERVER=$TUNNELED_GAC GAC_MYSAGEONE_SERVER=$TUNNELED_MS1 bundle exec rails s"
alias tunnel="ngrok start --all"

alias boot="be rails s"
alias prep="./ci/prepare_host_app.sh"
alias jobs="be rake jobs:work"

eval "$(hub alias -s)"
eval "$(rbenv init -)"

source ~/dotfiles/git-completion.bash
source ~/dotfiles/hub.bash_completion.sh

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.sage_aliases ]; then
  . ~/.sage_aliases
fi

if [ -f ~/.sage_profile ]; then
  . ~/.sage_profile
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

function github {
  branch="$(git rev-parse --abbrev-ref HEAD)"
    url="$(git config --get remote.origin.url)"
    url=${url/git@github.com:/http://github.com/}
  url=${url/.git/}

  if [[ $1 =~ "compare" ]]; then action="compare"
    elif [[ $1 =~ "pr" ]]; then action="pull"
  else action="tree"; fi

    if [[ $2 != "" ]]; then base="$2..."
    else base=""; fi

      url="${url}/${action}/${base}${branch}"

        echo "Opening ${url} $(\open ${url})"
}

#------------------------------------------------------
# CUSTOM COMMAND PROMPT
#------------------------------------------------------

# COLOUR VARIABLES ------------------------------------
FG_BLACK='\[\033[0;230m\]'
FG_RED='\[\033[0;31m\]'
FG_GREEN='\[\033[0;32m\]'
FG_YELLOW='\[\033[0;33m\]'
FG_BLUE='\[\033[0;34m\]'
FG_PURPLE='\[\033[0;35m\]'
FG_TEAL='\[\033[0;36m\]'
FG_WHITE='\[\033[0;37m\]'
FG_ORANGE='\[\033[0;214m\]'
NO_COLOUR='\[\033[0m\]'

PS1_TIME='\[\033[48;5;0m\033[38;5;250m\]'
PS1_PATH='\[\033[0;38;5;12m\]'
PS1_MARKER="$FG_ORANGE"
GIT_LABEL='\[\033[48;5;234m\033[38;5;214m\]'
GIT_JOIN='\[\033[48;5;179m\033[38;5;30m\]'
GIT_BRANCH='\[\033[48;5;245m\033[38;5;234m\]'
GIT_CLEAN='\[\033[48;5;22m\]'
GIT_DIRTY='\[\033[48;5;88m\]'
GIT_PATH='\[\033[48;5;0m\033[38;5;214m\]'
SVN_LABEL='\[\033[48;5;97m\033[38;5;17m\]'
SVN_PATH='\[\033[0;38;5;183m\]'
SVN_SPACER='\[\033[48;5;250m\]'

function check_user {
  # if user is not root
  if [[ $EUID -ne 0 ]]; then
    PS1_TIME="$NO_COLOUR\033[38;5;250m\] \$(date +%H:%M) "
    PS1_PATH="\[\033[0;38;5;222m\]"
    PS1_MARKER="$FG_YELLOW\$$NO_COLOUR "
  else
    PS1_TIME="\[\033[48;5;160m\033[38;5;255m\] \$(date +%H:%M) \[\033[48;5;88m\033[38;5;17m\] \$(id -nu) "
    PS1_PATH="\[\033[0;38;5;165m\]"
    PS1_MARKER="$FG_YELLOW#$NO_COLOUR "
  fi
}

# Output all available colour codes
# Used to create new colour variables
function colours {
  for i in {0..255}; do echo -e "\033[38;05;${i}m${i}"; done | column -c 80 -s '  '; echo -e "\e[m"
}

# Set the title of gnome terminal
function title {
  echo -ne "\033]0;$*\007"
}

# Return the name of the root directory for the current repo
function repo_root {
  d=`pwd`
  while [ "$d" != "" ]; do
    [ -d "$d"/.git ] && echo ${d##*/}
    d=${d%/*}
  done
}

# Check branch status
function get_branch_status {
  if [[ $(git status | tail -n1) == "nothing to commit (working directory clean)" ]]; then
    echo -e "$GIT_CLEAN"
  elif [[ $(git status | tail -n1) == "nothing to commit, working directory clean" ]]; then
    echo -e "$GIT_CLEAN"
  else
    echo -e "$GIT_DIRTY"
  fi
}

# Set the prompt according to which repo the current dir is in - if any
function set_prompt {
  # Set the default prompt
  PS1="$PS1_PATH\w$PS1_MARKER"

  # ADD GIT LABELS
  # If git status errors then we are not in a git repo
  # or we do not have git installed so leave prompt as default
  if [[ -z $(git status 2> /dev/null) ]]; then
    return
  fi

  # set repo name to the root dir name
  repo_name=$(repo_root)

  # find the origin file name of remote repo
  remote_repo_file=$(git remote -v | grep origin | tail -1 | cut -f2 -d":" | cut -f1 -d" ")

  # If there is a remote origin use file name to get repo name
  if [[ -n $remote_repo_file ]]; then
    repo_name=$(basename $remote_repo_file) | cut -f1 -d"."
  fi

  # set the title of the terminal to the current repo name
  term_title=(${repo_name//_/ })
  echo -ne "\033]0;${term_title[@]^}\007"

  # Check if the working branch is clean #253
  #branch_status=$([[ $(git status | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*")
  branch_status=$(get_branch_status)

  # Get the name of the current branch
  current_branch=$(git branch --no-color | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")

  # Set prompt with GIT labels
  PS1="$GIT_LABEL ${repo_name} $GIT_BRANCH ${current_branch} ${branch_status} $NO_COLOUR $GIT_PATH\w$NO_COLOR $PS1_MARKER"
}

# Custom window dims & pos for Sublime and Console duo
# requires wmctrl cli window manager
function edit_mode {
  file=$*
  title "Initialising Edit Mode"; echo "Please wait while edit mode initialises..."; wmctrl -r :ACTIVE: -b add,maximized_horz; wmctrl -r :ACTIVE: -e 0,0,874,-1,150; title "Slime Console"; slime $file & disown; sleep 0.8; wmctrl -r Sublime -b remove,maximized_vert; wmctrl -r Sublime -b add,maximized_horz; wmctrl -r Sublime -e 0,0,0,-1,824
}
alias em='edit_mode'
alias floatme='wmctrl -r :ACTIVE: -b remove,maximized_horz;wmctrl -r :ACTIVE: -b remove,maximized_vert; wmctrl -r :ACTIVE: -e 0,150,150,600,400'

# Chief function to call all / any custom functions
function prompt_command {
	check_user
  set_prompt
}

# Initialisation commands
PROMPT_COMMAND=prompt_command
