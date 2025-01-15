#!/bin/sh -l

# Utiliser INPUT_<NOM_DU_PARAMETRE> pour récupérer une valeur d'entrée
GREETING="Hello, $INPUT_WHO_TO_GREET!"

GITHUB_OUTPUT=${GITHUB_OUTPUT:-/tmp/github_output}

# Utiliser les commandes de workflow pour afficher des messages
echo "::notice file=entrypoint.sh,line=7::$GREETING"

# Vérifier si la variable $GITHUB_OUTPUT est définie
if [ -n "$GITHUB_OUTPUT" ]; then
  # Si définie, écrire les résultats dans le fichier
  echo "greeting=$GREETING" >>"$GITHUB_OUTPUT"
else
  # Si non définie, afficher un message et écrire localement
  echo "Notice : La variable GITHUB_OUTPUT n'est pas définie. Exécution locale."
  
  # Écrire les résultats dans un fichier local temporaire
  OUTPUT_FILE="/tmp/github_output"
  echo "greeting=$GREETING" >>"$OUTPUT_FILE"
  echo "Les résultats ont été écrits dans $OUTPUT_FILE"
fi

# Fin du script avec succès
exit 0
