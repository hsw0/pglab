#!/bin/bash

echo "Installing pgpool-II 3.4"

PGDG_REPO=http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-2.noarch.rpm
PGPOOL_BASE=/srv/postgresql/pgpool

yum_install() {
	pkgs=$@
	for pkg in $pkgs ; do
		rpm -qi --quiet "$pkg" || yum install -y $pkg
	done
}

rpm -qi --quiet pgdg-centos93 || yum localinstall -y $PGDG_REPO
yum_install pgpool-II-93

install -d "$PGPOOL_BASE"
install -d -o postgres -g postgres -m 755 "$PGPOOL_BASE/logs"
install -d -o postgres -g postgres -m 755 "$PGPOOL_BASE/conf"

# SKP compatibility
[[ -L /app ]] || ln -snf /srv /app
if [[ ! -d $PGPOOL_BASE/bin ]]; then
	install -d -o root -g root "$PGPOOL_BASE/bin"
	ln -snf /usr/pgpool-9.3/bin/* "$PGPOOL_BASE/bin"
fi

echo "export PATH=$PATH:/usr/pgpool-9.3/bin" > /etc/profile.d/pgpool.sh
echo "export PGPOOL_BASE=$PGPOOL_BASE" >> /etc/profile.d/pgpool.sh

