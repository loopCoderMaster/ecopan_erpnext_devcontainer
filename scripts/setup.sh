#!/bin/bash

wget https://raw.githubusercontent.com/frappe/frappe_docker/main/development/installer.py
chmod +x installer.py
echo "[
  { \"url\": \"https://github.com/frappe/frappe.git\", \"branch\": \"version-15\" },
  { \"url\": \"https://github.com/frappe/erpnext.git\", \"branch\": \"version-15\" }
]" > apps-example.json
./installer.py
sudo chown -R frappe:frappe /home/frappe/benches
