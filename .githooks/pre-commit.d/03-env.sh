ENV_FILES=$(find . -type f -name ".env")

if [ -z "$ENV_FILES" ]; then
  echo "Aucun fichier .env trouvé dans le projet."
  exit 0
fi

echo "Génération des fichiers .env.exemple pour :"
echo "$ENV_FILES"
echo ""

for SOURCE in $ENV_FILES; do
  DESTINATION="${SOURCE}.exemple"

  echo "→ Source :   $SOURCE"
  echo "  Destination : $DESTINATION"

  # Créer ou vider le fichier destination
  : > "$DESTINATION"

  # Lire le fichier source ligne par ligne
  while IFS= read -r line; do
    # Conserver uniquement la clé avant le "="
    # et réécrire "KEY=" dans le fichier destination
    echo "$line" | awk -F '=' '{print $1 "="}' >> "$DESTINATION"
  done < "$SOURCE"

  # Ajouter le fichier généré au staging
  git add "$DESTINATION"
  echo "  → $DESTINATION ajouté au staging."
  echo ""
done

exit 0