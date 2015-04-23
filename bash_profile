#export http_proxy="http://lon1.sme.zscaler.net:80"
#export https_proxy="http://lon1.sme.zscaler.net:9480"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export EDITOR='vim'
export no_proxy=127.0.0.1 # Proxy fix for Rspec
source ~/dotfiles/git-completion.bash
export MYSQL_USERNAME='root'
export MYSQL_PASSWORD='admin'
export DEFERRED_GARBAGE_COLLECTION=true
eval "$(hub alias -s)"

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.sage_aliases ]; then
  . ~/.sage_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/hub.bash_completion.sh ]; then
  . /hub.bash_completion.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"
export CC=/usr/local/bin/gcc-4.2
export CXX=/usr/local/bin/g++-4.2
export PATH=/usr/local/bin:$HOME/bin:$PATH
export MACOSX_DEPLOYMENT_TARGET=10.9

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
export ANDROID=/Users/adamgeorgeson/Library/Android/sdk
export GOPATH=/Users/adamgeorgeson/dev/go
export PATH=/usr/local/bin:/Users/adamgeorgeson/bin:/Users/adamgeorgeson/.rbenv/shims:/usr/local/heroku/bin:/Users/adamgeorgeson/.rbenv/shims:/Users/adamgeorgeson/.rbenv/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/adamgeorgeson/dev/go/bin:/Users/adamgeorgeson/dev/go/bin:/Users/adamgeorgeson/Library/Android/sdk/tools:/Users/adamgeorgeson/Library/Android/sdk/platform-tools
