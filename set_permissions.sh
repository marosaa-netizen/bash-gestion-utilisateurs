#!/bin/bash

# Script pour définir permissions + propriétaire sur un fichier/dossier
# Usage : sudo ./set_permissions.sh chemin utilisateur groupe permissions

if [ "$EUID" -ne 0 ]; then
  echo "Exécutez ce script avec sudo."
  exit 1
fi

if [ $# -ne 4 ]; then
  echo "Usage : $0 chemin utilisateur groupe permissions"
  echo "Exemple : $0 /var/www/html alice webadmin 755"
  exit 1
fi

TARGET=$1
USER=$2
GROUP=$3
PERMS=$4

echo "Application des permissions..."

# Modifier propriétaire
chown "$USER:$GROUP" "$TARGET"

# Modifier permissions
chmod "$PERMS" "$TARGET"

echo "Permissions appliquées :"
echo "- Chemin : $TARGET"
echo "- Propriétaire : $USER:$GROUP"
echo "- Permissions : $PERMS"
