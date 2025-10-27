#!/usr/bin/env bash
APP_IP=$(terraform output -raw app_public_ip)
DB_IP=$(terraform output -raw db_public_ip)

cat > inventory.ini <<EOF
[app]
${APP_IP} ansible_user=ubuntu

[db]
${DB_IP} ansible_user=ubuntu

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=~/.ssh/your-private-key.pem
EOF

echo "Inventory written to inventory.ini"
