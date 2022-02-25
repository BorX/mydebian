#!/bin/bash

[ "$SHELL" == '/bin/bash' ] || return

# LS
alias l='ls'
alias ll='ls -l'
alias lh='ll -h'
alias llrt='ll -rt'
alias llrs='ll -rS'
alias lhrt='llrt -h'
alias lhrs='llrs -h'
lm() { ls $* | more; }
llm() { ll $* | more; }

alias du='du -h'
alias df='df -PTh'

alias md='mkdir'
alias rd='rmdir'
mcd() { mkdir $@ && cd "$1"; }

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

alias jobs='jobs -l'

alias gb='git branch'
alias gba='gb -a'
alias gc='git commit -v'
alias gst='git status'
alias gadd='git add'
