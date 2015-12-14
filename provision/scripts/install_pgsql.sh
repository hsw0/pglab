#!/bin/bash

echo "Installing postgresql 9.3"

PGDG_REPO=http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-2.noarch.rpm
PGSQL_BASE=/srv/postgresql

yum_install() {
	pkgs=$@
	for pkg in $pkgs ; do
		rpm -qi --quiet "$pkg" || yum install -y $pkg
	done
}

rpm -qi --quiet pgdg-centos93 || yum localinstall -y $PGDG_REPO
yum_install epel-release
yum_install postgresql93-{server,contrib,devel,plpython} postgis2_93

# SKP compatibility
install -d -o postgres -g postgres "/data/pg_data"
install -d -o postgres -g postgres "/data/pg_log"
if [[ ! -d /app ]]; then
	ln -s /srv /app
	install -d -o root -g root "$PGSQL_BASE/bin"
	ln -s /usr/pgsql-9.3/bin/* "$PGSQL_BASE/bin"
	ln -s /data/pg_data "$PGSQL_BASE/data"
	ln -s /data/pg_log "$PGSQL_BASE/logs"
fi

echo "export PATH=$PATH:/usr/pgsql-9.3/bin" > /etc/profile.d/pgsql
echo "export PG_DATA=/data/pg_data" >> /etc/profile.d/pgsql

echo 'completed!'
