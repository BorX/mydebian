#!/bin/bash

[ "$SHELL" == '/bin/bash' ] || return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export TMOUT=0

set -o vi

# PS1
PS1='\[\e[0;31m\]['
if [ $UID -eq 0 ]; then
  PS1=$PS1'\[\e[1;36m\]\u\[\e[0;36m\]@\h'
else
  PS1=$PS1'\[\e[36m\]\u@\h'
fi
export PS1=$PS1' \[\e[1;32m\]\w\[\e[0;31m\]]\[\e[33m\]\$\[\e[0m\] '

export PATH=$PATH:~/bin
umask 0077
