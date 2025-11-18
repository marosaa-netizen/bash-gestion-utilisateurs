#!/bin/bash

# Script pour supprimer un utilisateur Linux proprement
# Usage : sudo ./delete_user.sh nom_utilisateur

if [ "$EUID" -ne 0 ]; then
  echo "Vous devez exécuter ce script en root."
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage : $0 nom_utilisateur"
  exit 1
fi

USERNAME=$1

echo "Suppression de l'utilisateur '$USERNAME'..."

# Supprime l'utilisateur + son home (-r)
userdel -r "$USERNAME"

if [ $? -ne 0 ]; then
  echo "Erreur lors de la suppression de l'utilisateur."
  exit 1
fi

# Supprimer la crontab
crontab -r -u "$USERNAME" 2>/dev/null

echo "Nettoyage terminé."
echo "Utilisateur '$USERNAME' supprimé avec succès."
