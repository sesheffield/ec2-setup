#!/bin/bash
# if not running interactively, don't do anything

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\2#g"`'
BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]'
NEWLINE='\033[00m\] \n$ '
PS1=$TIME$USER$BRANCH$LOCATION$NEWLINE
PS2='\[\033[01;36m\]>'


alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
alias cd6="cd ../../../../../.."
alias cd7="cd ../../../../../../.."
alias gocoverage="go test -coverprofile=coverage.out && go tool cover -html=coverage.out && rm coverage.out && go test -bench=."
alias gs="git status"
alias ga="git add ."
alias gm="git commit -m"
alias gp="git push"
alias shef="cd ~/go/src/github.com/sesheffield/"
alias vi='nvim'
alias vim='vim -X'

SVN_EDITOR='vim'
export SVN_EDITOR

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# apex autocomplete
_apex()  {
  COMPREPLY=()
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="$(apex autocomplete -- ${COMP_WORDS[@]:1})"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

# Title setting for terminal tabs.
function title {
    echo -ne "\033]0;"$*"\007"
}

function wdt {
    echo -ne "\033]0;"${PWD##*/}"\007"
}

complete -F _apex apex
