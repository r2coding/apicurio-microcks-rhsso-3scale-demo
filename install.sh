#!/bin/bash
# Before to execute it, certify to be on the correct project and with the 3scale operator already installed



# Create a RWX Volume for 3Scale developer portal and Redis/Postgres PV and PVC
oc create -f pgsql-storage.yml

# Install Postgres
oc new-app registry.redhat.io/rhel8/postgresql-10 --name=postgres --source-secret=threescale-registry-auth -e POSTGRESQL_USER=redhat -e POSTGRESQL_PASSWORD=redhat -e POSTGRESQL_DATABASE=system

# Install Apicurio
oc create -f apicurio.yml --values-to-fill
