#!/bin/sh

mkdir -pv /var/lib/unbound/
chown -Rv unbound:unbound /var/lib/unbound

# Ensure the root key exists
[ ! -f /var/lib/unbound/root.key ] && unbound-anchor -a /var/lib/unbound/root.key

# Start unbound in the foreground
exec unbound -d

