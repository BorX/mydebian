#!/usr/bin/env bash

umask 0022
 
export SHELL=bash
 
export HISTCONTROL=ignoreboth
shopt -s histappend
export HISTTIMEFORMAT="%m/%d %H:%M "
export HISTFILESIZE=1000
export HISTSIZE=1000
export HISTIGNORE="&:bg:fg:h"
export HISTCONTROL=ignoreboth
export LANG='fr_FR.utf8'
unset TMOUT
shopt -s checkwinsize
set -o vi
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
PS1='\[\e[0;31m\][\[\e['
[ $(id -u) -eq 0 ] && PS1=$PS1'1;'
PS1=$PS1'36m\]\u'
[ $(id -u) -eq 0 ] && PS1=$PS1'\[\e[0;36m\]'
PS1=$PS1'@\h \[\e[1;32m\]\w\[\e[0;31m\]]\[\e[33m\]'
[ $(id -u) -eq 0 ] && PS1=$PS1'#' || PS1=$PS1'$'
export PS1=$PS1'\[\e[0m\] '
umask 0077
type vim &>/dev/null && alias vi=vim
export LS_OPTIONS='-aF --color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias l='ls'
alias ll='ls -l'
alias lh='ll -h'
alias llrt='ll -rt'
alias lhrt='llrt -h'
alias llrs='ll -rS'
alias lhrs='llrs -h'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -PTh'
alias du='du -h'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias zgrep='zgrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
 
