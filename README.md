# Ecopan ErpNext Devcontainer

## Requirements

1. Git -> https://git-scm.com/downloads
2. Azure CLI -> https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
3. Powershell -> https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4
   AND/OR<br/> 
   Windows Terminal -> https://github.com/microsoft/terminal
5. DevPod -> https://github.com/loft-sh/devpod
6. Azure auth on Techloop subscription
7. Github auth on Techloop

## DevPod

![image](https://raw.githubusercontent.com/loft-sh/devpod/main/docs/static/media/devpod-flow.gif)

1. Apri il terminale di VS Code.

Once the devcontainer is created, it will open up a code editor (VS Code) right in your browser, with terminal and everything! Wait for a few seconds for the initialization script to complete:

![image](https://github.com/techloopsrl/ecopandevcontainer/assets/132823027/144f2f80-6672-44c2-855c-373cb0040e48)

After the script is done running, you can check your installation by running bench --version and then start the bench by running bench start:

![image](https://github.com/techloopsrl/ecopandevcontainer/assets/132823027/78b85416-9ded-4282-948b-4b5c97c5fb60)

This will start the bench.

Visit the ports tab and click on the browser icon next to port 8000 (the web server runs on this port):

![image](https://github.com/techloopsrl/ecopandevcontainer/assets/132823027/03a54429-cb15-492f-8a55-4d1f6dfb9d89)

Voila! This will open up the site in a new tab:

Frappe Site Running through Codespace

![image](https://github.com/techloopsrl/ecopandevcontainer/assets/132823027/125d418f-e2a7-4ba1-b71f-61700b7c95ec)

## Credentials
For the Frappe site created by default:<br/>
a. use Administrator and admin as username and password respectively<br/>
b. MariaDB: Root Password: 123<br/>

### STEPS
1. Esegui il comando: cd frappe-bench
2. Esegui il comando: bench start
3. Clicca su link sul terminale http://127.0.0.1:8000 e si aprirà sul tuo browser il sito.
5. Accedi con l'utente Administrator e la password admin.
