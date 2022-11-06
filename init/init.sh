#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")"; pwd)"

apt-get --yes --quiet update

apt-get --yes --quiet install ansible
cd "$ROOT_DIR"
ansible-playbook init-localhost.yml -e install_pkg_devops=yes -e install_pkg_dev=yes

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add -
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
apt-get --yes --quiet update
apt-get --yes --quiet install google-cloud-cli

curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt-get --yes --quiet update
apt-get --yes --quiet install kubectl

# dpkg-reconfigure tzdata && dpkg-reconfigure locales

curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

sed -i '3iecho /etc/profile' /etc/profile
for fic in /etc/profile.d/*.sh /etc/bash.bashrc /root/.profile /root/.bashrc; do
	sed -i "2iecho $fic" $fic
done
