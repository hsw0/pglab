#!/bin/bash

PGDATA=/data/pg_data

if [[ -d "$PGDATA/global" ]]; then
	echo "Database already created."
	exit 0
fi

# 데이터 디렉터리 생성
sudo install -d -o postgres -g postgres -m 700 "$PGDATA"

# DB 생성
sudo -u postgres /usr/pgsql-9.3/bin/initdb \
	--encoding=UTF-8 \
	--locale=en_US.UTF-8 \
	--username=postgres \
	--pgdata="$PGDATA"

