#!/bin/bash

[ "$SHELL" == '/bin/bash' ] || return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

#export HISTFILE=/dev/null
export HISTTIMEFORMAT="%m/%d %H:%M "
export HISTFILESIZE=1000
export HISTSIZE=1000
export HISTIGNORE="&:bg:fg:h"
