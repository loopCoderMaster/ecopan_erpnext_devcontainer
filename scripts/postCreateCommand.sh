#!/bin/bash

set -e

echo "Start postCreateCommand.sh script."

# Scarica e installa lo script di installazione di Frappe
wget https://raw.githubusercontent.com/frappe/frappe_docker/main/development/installer.py

echo "[]" > apps-example.json
# Crea il file apps-example.json (includi Frappe ed ERPNext)
#echo "[
#  { \"url\": \"https://github.com/frappe/erpnext.git\", \"branch\": \"version-15\" }
#]" > apps-example.json

chmod +x installer.py
# Esegui lo script di installazione di Frappe
./installer.py # Aggiungi --verbose per vedere l'output dettagliato

# Controlla l'esito dell'installer
if [ $? -ne 0 ]; then
  echo "Errore durante l'installazione di Frappe. Interruzione dello script."
  exit 1  # Esci con un codice di errore
fi

rm installer.py apps-example.json

sudo chown -R frappe:frappe /workspace/development/frappe-bench
cd /workspace/development/frappe-bench

echo "Installing ERPNext..."
bench get-app --branch version-15 --resolve-deps erpnext
bench --site development.localhost install-app erpnext

echo "Clearing cache and setting site..."
bench --site development.localhost clear-cache

echo "se development.localhost..."
bench use development.localhost

lines=(
    "Frappe development server avviato."
    "Segui questi passaggi per accedere:"
    "1. Apri il terminale di VS Code."
    "2. Esegui il comando: cd frappe-bench"
    "3. Esegui il comando: bench start"
    "4. Clicca su link sul terminale http://127.0.0.1:8000 e si aprirà sul tuo browser il sito."
    "5. Accedi con l'utente Administrator e la password admin."
)
printf '%s\n' "${lines[@]}"
