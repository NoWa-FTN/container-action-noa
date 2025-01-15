#!/bin/sh -l

# Utiliser INPUT_<NOM_DU_PARAMETRE> pour récupérer une valeur d'entrée
GREETING="Hello, $INPUT_WHO_TO_GREET!"

# Utiliser les commandes de workflow pour afficher des messages
echo "::notice file=entrypoint.sh,line=7::$GREETING"

# Vérifier si la variable $GITHUB_OUTPUT est définie et écrire les résultats
if [ -n "$GITHUB_OUTPUT" ]; then
  echo "greeting=$GREETING" >>"$GITHUB_OUTPUT"
else
  echo "Erreur : La variable GITHUB_OUTPUT n'est pas définie."
  exit 1
fi

# Fin du script avec succès
exit 0
