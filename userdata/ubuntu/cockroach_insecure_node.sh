#!/bin/bash

PACKAGE=cockroach-v1.0.2.linux-amd64

curl -O https://binaries.cockroachdb.com/$PACKAGE.tgz

tar -xf $PACKAGE.tgz --strip=1 $PACKAGE/cockroach

mv cockroach /usr/bin

INSTANCE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cockroach start --insecure --background --host=$INSTANCE_IP