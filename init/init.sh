#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")"; pwd)"

apt-get --yes --quiet update
apt-get --yes --quiet full-upgrade
apt-get --yes --quiet install procps locales bash-completion vim curl wget ncat rsync man most git openssh-client ansible ansible-lint sshpass tree apt-transport-https ca-certificates gnupg
apt-get --yes --quiet autoclean
apt-get --yes --quiet autoremove

cp -a "$ROOT_DIR/borx.sh"     /etc/profile.d/
cp -a "$ROOT_DIR/vimrc.local" /etc/vim/
cp -a "$ROOT_DIR/gitconfig"   /root/.gitconfig

sed -i '3iecho /etc/profile' /etc/profile
for fic in /etc/profile.d/borx.sh /etc/bash.bashrc /root/.profile /root/.bashrc; do
	sed -i "2iecho $fic" $fic
done

# dpkg-reconfigure tzdata && dpkg-reconfigure locales

curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
