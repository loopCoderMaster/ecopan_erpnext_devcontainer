#!/bin/bash

echo "Start setup.sh !!!!"

# Aggiorna i pacchetti di sistema
apt-get update && apt-get upgrade -y

# Installa le dipendenze necessarie (se non sono già presenti)
apt-get install -y \
    wget \
    curl #\
    #git \
    #python3 \
    #python3-pip \
    #build-essential 

source /home/frappe/.nvm/nvm.sh
nvm alias default 18
nvm use 18
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

rm installer.py apps-example.json

if [ $? -eq 0 ]; then  # Verifica se l'installer è terminato con successo (codice di uscita 0)
    sudo chown -R frappe:frappe /workspace/development/frappe-bench
    cd /workspace/development/frappe-bench
    #bench start
    echo "Installazione completata. Frappe ed ERPNext dovrebbero essere in esecuzione."
else
    echo "Errore durante l'installazione. I file temporanei non sono stati rimossi."
fi
