#!/bin/bash

PGDATA=/srv/postgresql/data

if [[ -d "$PGDATA" ]]; then
	echo "Database already created."
	exit 0
fi

sudo -u postgres /usr/pgsql-9.3/bin/initdb \
	--encoding=UTF-8 \
	--locale=en_US.UTF-8 \
	--username=postgres \
	--pgdata="$PGDATA"

