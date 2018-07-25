# development tasks
alias vi="vim"
alias g="git"
alias gc="git checkout"
alias gs="git status"
alias gb="git checkout -b"
alias gd="git diff"
alias gp="git pull"
alias gf="git fetch"
alias gg="git grep"
alias gl="git log"
alias grh="git reset head --hard"
alias b='bundle'
alias be='bundle exec'
alias rs='bundle exec rspec'
alias guard='title GUARD ${PWD##*/}; bundle exec guard && wait $!; title Console'
alias evergreen="be rails s -p 4000"
alias dj="be rake jobs:clear jobs:work"

# Directory Nav
alias ..="cd .."
alias ...="cd ../.."
alias dev="cd ~/dev"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

for i in ~/dev/*
do
   alias $(basename $i)="cd '$i'"
done

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# search functions
alias findfile='find . -iname'
alias inspect='du -csh'
alias fsearch='git ls-files | grep'

alias ukboot='./script/boot.sh -w=gac -w=ms1uk'
alias usboot='./script/boot.sh -w=gac -w=ms1us'
alias ukpboot='./script/boot.sh -w=gac -w=ms1uk -w=payroll'

alias aws_login='$(aws ecr get-login --no-include-email)'
alias portainer='cd ~/portainer && ./portainer -d /home/developer/portainer/data & x-www-browser http://localhost:9000'
