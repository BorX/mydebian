#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")"; pwd)"

apt-get --yes --quiet update

apt-get --yes --quiet install ansible
cd "$ROOT_DIR"
ansible-playbook init-localhost.yml -e install_pkg_devops=true -e install_pkg_dev=true

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg   | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /usr/share/keyrings/kubernetes.gpg
curl -fsSL https://baltocdn.com/helm/signing.asc                   | gpg --dearmor -o /usr/share/keyrings/helm.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" >/etc/apt/sources.list.d/google-cloud-sdk.list
echo 'deb [signed-by=/usr/share/keyrings/kubernetes.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /'         >/etc/apt/sources.list.d/kubernetes.list
echo "deb [signed-by=/usr/share/keyrings/helm.gpg arch=amd64] https://baltocdn.com/helm/stable/debian/ all main" >/etc/apt/sources.list.d/helm-stable-debian.list

apt-get --yes --quiet update
apt-get --yes --quiet install google-cloud-cli kubectl helm

# dpkg-reconfigure tzdata && dpkg-reconfigure locales

#curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

sed -i '3iecho /etc/profile' /etc/profile
for fic in /etc/profile.d/*.sh /etc/bash.bashrc /root/.profile /root/.bashrc; do
	sed -i "2iecho $fic" $fic
done
