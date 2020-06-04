#!/bin/bash
# Before to execute it, certify to be on the correct project and with the 3scale operator already installed



# Create a RWX Volume for 3Scale developer portal and Redis/Postgres PV and PVC
oc create -f pgsql-storage.yml

# Install Postgres
oc new-app registry.redhat.io/rhel8/postgresql-10 --name=postgres --source-secret=redhat-registry-auth -e POSTGRESQL_USER=user -e POSTGRESQL_PASSWORD=password -e POSTGRESQL_DATABASE=system

# Install Apicurio
oc create -f apicurio.yml --KC_USER="Keycloak Admin Username" --KC_PASS="Keycloak Admin Password" --KC_REALM="Keycloak Realm" --DB_USER="PostgreSQL Connection Username" --DB_PASS="PostgreSQL Connection Password" --AUTH_ROUTE="Authentication Route Name" --WS_ROUTE="Editing Route Name" --API_ROUTE="API Route Name" --UI_ROUTE="User Interface Route Name"
