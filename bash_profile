#export http_proxy="http://lon1.sme.zscaler.net:80"
#export https_proxy="http://lon1.sme.zscaler.net:9480"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
eval "$(rbenv init -)"
export CC=/usr/local/bin/gcc-4.2
export CXX=/usr/local/bin/g++-4.2
export PATH=/usr/local/bin:$HOME/bin:$PATH
