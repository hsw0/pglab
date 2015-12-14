#!/bin/bash

echo Provisioning node $(hostname)

/vagrant/provision/scripts/install_pgsql.sh

if [[ "$HOSTNAME" == "db1" ]]; then
	/vagrant/provision/scripts/initdb.sh
fi
