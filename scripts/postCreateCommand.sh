#!/bin/bash

echo "Start setup.sh !!!!"

# Aggiorna i pacchetti di sistema
# apt-get update && apt-get upgrade -y

# Installa le dipendenze necessarie (se non sono già presenti)
#apt-get install -y \
#    wget \
#    curl #\
    #git \
    #python3 \
    #python3-pip \
    #build-essential 

#source /home/frappe/.nvm/nvm.sh
#nvm alias default 18
#nvm use 18
#echo "nvm use 18" >> ~/.bashrc

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

# Attesa opzionale per l'avvio dei servizi
sleep 10

sudo chown -R frappe:frappe /workspace/development/frappe-bench
cd /workspace/development/frappe-bench

echo "Clearing cache and setting site..."
bench --site development.localhost clear-cache

echo "Starting Frappe development server..."
bench use development.localhost
bench browse

echo "Frappe development server avviato. Apri http://localhost:8000 nel tuo browser."
