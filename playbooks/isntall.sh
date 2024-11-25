#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Uruchom skrypt z uprawnieniami sudo"
   exit 1
fi

echo "Aktualizacja"
apt update && apt -y upgrade

echo "Instalacja dodatków"
apt install -y lsb-release software-properties-common

echo "Dodanie repozytorium Ansible"
apt-add-repository -y ppa:ansible/ansible

echo "Ponowna aktualizacja"
apt update && apt -y upgrade

echo "Instalacja Ansible"
apt install -y ansible

#echo "Klonowanie repo Git ze skryptami"
#git clone "https://github.com/mateusz-bogacz-collegiumwitelona/kolo_gier_anible_playbooks"
mv ./kolo_gier_anible_playbooks/playbooks ./
