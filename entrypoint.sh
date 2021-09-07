#!/bin/bash

echo "$1" > id_rsa

chmod 600 id_rsa

echo "SSHing into control host."

ssh -o StrictHostKeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null -i id_rsa -p $8 $2@$3 '
	cd $4
	export VAULT_PASS=$5

	if [[ "$(git pull)" != *"Already up to date."* ]]; then
		echo "Updated repo, cloning."
		virtualenv -p /usr/bin/python3 .
		source bin/activate
		pip install -r ./requirements.txt
		ansible-galaxy install -r requirements.yml
	fi

	echo "Setting proxmox secrets."
	source bin/activate
	source proxmox_secrets.sh

	echo "Running playbook."
	echo $5 > ./_vault_pass
        ansible-playbook -i proxmox_inventory.py -i hosts --vault-password-file ./_vault_pass $6 --tags $7
' 