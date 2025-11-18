#!/bin/bash

# Script pour ajouter un utilisateur à un groupe
# Usage : sudo ./add_to_group.sh utilisateur groupe

if [ "$EUID" -ne 0 ]; then
  echo "Exécutez ce script avec sudo."
  exit 1
fi

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage : $0 utilisateur groupe"
  exit 1
fi

USER=$1
GROUP=$2

echo "Ajout de $USER au groupe $GROUP..."

usermod -aG "$GROUP" "$USER"

if [ $? -ne 0 ]; then
  echo "Impossible d'ajouter l'utilisateur au groupe."
  exit 1
fi

echo "$USER a été ajouté au groupe $GROUP"
