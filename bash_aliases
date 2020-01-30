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

alias retropie='ssh pi@retropie'
alias zero='ssh pi@raspberrypi'
alias zoom="echo \"https://zoom.us/j/4265191537\""

# Directory Nav
alias ..="cd .."
alias ...="cd ../.."
alias dev="cd ~/dev"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias s1ct="cd ~/dev/s1_central_test"

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

alias mint="ssh developer@192.168.99.100"
alias start_mint="vboxmanage startvm s1_development_environment-2-0 --type headless"
alias stop_mint="vboxmanage controlvm s1_development_environment-2-0 poweroff"

alias ukboot='./script/boot.sh -w=gac -w=ms1uk -w=central -w=event -w=cbc'
alias usboot='./script/boot.sh -w=gac -w=ms1us -w=central -w=cbc'
alias ukpboot='./script/boot.sh -w=gac -w=ms1uk -w=payroll -w=event'
alias ms1boot='./script/boot.sh -w=gac -w=ms1uk --pull'
alias aws_login='`aws ecr get-login --no-include-email`'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
alias dynamo='dynamodb-admin &'
alias org="cd ~/dev/sbc.core.organisation.service/"
alias orgi="cd ~/dev/sbc.core.organisation.infrastructure/"
alias acs="cd sbc.core.accesscontrol.service/"
alias acsi="cd ~/dev/sbc.core.accesscontrol.infrastructure/"
alias gentoken='curl -d "{\"grant_type\": \"client_credentials\",\"client_id\": \"mV6AUHsTYwnFQ0pfh4tnsy21bFN1DStr\",\"client_secret\":\"JgoD6FoPn8mQyZflwHitXyQHLZGsdbOhw84NwoNYwXA-TZ0sLnx2bJVo05mtCQxF\", \"audience\": \"99a011f/sbc\"}" -H "Content-Type: application/json" -X POST https://id-shadow.sage.com/oauth/token'
