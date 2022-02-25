#!/bin/bash

[ "$SHELL" == '/bin/bash' ] || return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export LESS='-erMXF'
export PAGER=$(which less)
#export MANPAGER=$PAGER' -isrR'
export MANPAGER=$(which most)
#alias more=$PAGER
alias more='/usr/share/vim/vimcurrent/macros/less.sh'
alias nless=$PAGER' -N'
export EDITOR=$(which vim)
