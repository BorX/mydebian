#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "$0")"; pwd)"

apt-get update --yes --quiet \
&& apt-get --yes --quiet install procps bash-completion vim curl wget git openssh-client ansible \
&& apt-get autoclean autoremove --yes --quiet

cp -a "$ROOT_DIR/borx.sh"     /etc/profile.d/
cp -a "$ROOT_DIR/vimrc.local" /etc/vim/

sed -i '3iecho /etc/profile'           /etc/profile
sed -i '2iecho /etc/profile.d/borx.sh' /etc/profile.d/borx.sh
sed -i '2iecho /etc/bash.bashrc'       /etc/bash.bashrc
sed -i '2iecho /root/.profile'         /root/.profile
sed -i '2iecho /root/.bashrc'          /root/.bashrc

