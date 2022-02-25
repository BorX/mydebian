#!/bin/bash

[ "$SHELL" == '/bin/bash' ] || return

alias deborphan='deborphan -Pa -p 0 | sort -k 3'
backup() {
	[ $# -lt 1 ] && { echo "Usage: backup file1 [file2 [...]]; return 1; }
	for arg in $@; do
		cp -av "$arg" "$arg_$(date +%Y%m%d-%H%M)"
	done
}
archive() {
	[ $# -lt 1 ] && { echo "Usage: archive file1 [file2 [...]]; return 1; }
	for arg in $@; do
		local repArchives="$(dirname "$arg")/Archives"
		mkdir -p "$repArchives"
		tar czf "$repArchives/$(date +%Y%m%d-%H%M)_$(basename "$arg").tgz" "$arg"
	done
}

logwatch() {
	local file="$1"
	[ -n "$file" ] || file='syslog'
	sudo tail -fn+0 "/var/log/$file" | ccze -A
}

hl() { sed "s'\($1\)'$(tput setaf 1)$(tput rev)\1$(tput sgr0)'g" </dev/stdin; }

function ask() {
	echo -n "$@" '[y/n] ' ; read ans
	case "$ans" in
		y*|Y*) return 0 ;;
		*) return 1 ;;
	esac
}

function extract() {
	[ -f "$1" ] || { echo >&2 "'$1' is not a valid file"; return 1; }
	case $1 in
		*.tar)     tar xvf    $1 ;;
		*.tar.bz2) tar xvjf   $1 ;;
		*.tbz2)    tar xvjf   $1 ;;
		*.tar.gz)  tar xvzf   $1 ;;
		*.tgz)     tar xvzf   $1 ;;
		*.bz2)     bunzip2    $1 ;;
		*.rar)     unrar x    $1 ;;
		*.gz)      gunzip     $1 ;;
		*.zip)     unzip      $1 ;;
		*.Z)       uncompress $1 ;;
		*.7z)      7z x       $1 ;;
		*)
			echo >&2 "'$1' cannot be extracted via >extract<"
			return 2
			;;
	esac
}
