#!/bin/sh -l

echo "$1" > id_rsa

ssh -i id_rsa -p $8 $2@$3 '
	cd $4
	git pull
	export VAULT_PASS=$5

	virtualenv -p /usr/bin/python3 .
	source bin/activate
	pip install -r ./requirements.txt
	ansible-galaxy install -r requirements.yml
	source proxmox_secrets.sh

	./run.sh $6 --tags $7
'