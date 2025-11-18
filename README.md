# Scripts Bash – Gestion des utilisateurs Linux

Ce dépôt contient une collection de scripts Bash permettant d'automatiser :

- La création d'utilisateurs
- La suppression d’utilisateurs
- L’ajout d’utilisateurs à des groupes
- La gestion des droits
- La création de dossiers personnels

## 🎯 Objectifs pédagogiques

- Automatiser la gestion système
- Réduire les erreurs humaines
- Gagner du temps sur les tâches répétitives

## 📁 Scripts disponibles

| Script | Fonction |
|--------|----------|
| `create_user.sh` | Créer un utilisateur + dossier home |
| `delete_user.sh` | Supprimer un utilisateur proprement |
| `add_to_group.sh` | Ajouter un utilisateur à un groupe |
| `set_permissions.sh` | Gérer les permissions de base |

## 🚀 Exemple d’utilisation

```bash
sudo ./create_user.sh alice
sudo ./add_to_group.sh alice sudo
