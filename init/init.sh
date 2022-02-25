#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")"; pwd)"

apt-get --yes --quiet update

apt-get --yes --quiet install ansible
cd "$ROOT_DIR"
ansible-playbook init-localhost.yml -e install_pkg_term=yes

# dpkg-reconfigure tzdata && dpkg-reconfigure locales

curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

sed -i '3iecho /etc/profile' /etc/profile
for fic in /etc/profile.d/borx.sh /etc/bash.bashrc /root/.profile /root/.bashrc; do
	sed -i "2iecho $fic" $fic
done
