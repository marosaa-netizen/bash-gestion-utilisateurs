#!/bin/bash

# Script pour créer un utilisateur Linux
# Usage : sudo ./create_user.sh nom_utilisateur [groupe]

# Vérifie que le script est exécuté en root
if [ "$EUID" -ne 0 ]; then
  echo "Vous devez exécuter ce script avec sudo."
  exit 1
fi

# Vérifie le nom d'utilisateur
if [ -z "$1" ]; then
  echo "Usage : $0 nom_utilisateur [groupe]"
  exit 1
fi

USERNAME=$1
GROUP=$2

# Création de l'utilisateur
echo "Création de l'utilisateur '$USERNAME'..."
useradd -m -s /bin/bash "$USERNAME"

# Vérification
if [ $? -ne 0 ]; then
  echo "Erreur lors de la création de l'utilisateur."
  exit 1
fi

# Mot de passe
echo "Définition du mot de passe pour $USERNAME"
passwd "$USERNAME"

# Ajout au groupe (optionnel)
if [ ! -z "$GROUP" ]; then
  echo "Ajout de $USERNAME au groupe $GROUP"
  usermod -aG "$GROUP" "$USERNAME"
fi

echo "Utilisateur '$USERNAME' créé avec succès."
