# docker-compose
All services in this docker-compose are made by javascript team.
To get the all dotstatsuite you need to add the docker-compose file from the dotnet team.

If you don't work on localhost you need to change that by you domain name or ip.

## Docker architecture

├── dotstatsuite
│   ├── docker-compose.yml
│   ├── config
│   ├── .env

## keycloak 

### ssl desactivation (if not localhost)
```
docker exec -it keycloak bash
cd keycloak/bin/
./kcadm.sh update realms/master -s sslRequired=NONE
./kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin
./kcadm.sh update realms/master -s sslRequired=NONE
```

### configuration
go http://localhost:8080
add a client for dlm for master realm
  - client_id: app
  - root_url: http://localhost:7000     (dlm)


## config
```
git clone https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config.git config
yarn
```
If you are not in localhost, you need to change some host in settings
### Architecture mono-tenant

├── config
│   ├── node_modules                       
│   ├── dist                               
│   ├── configs                            
│   │   ├── datasources.json               
│   │   ├── tenants.json 
│   │   │   ├── default
│   │   │   │   ├── data-explorer
│   │   │   │   │   ├── i18n
│   │   │   │   │   ├── settings.json
│   │   │   │   ├── data-viewer
│   │   │   │   │   ├── i18n
│   │   │   │   │   ├── settings.json
│   ├── assets 
│   │   ├── default
│   │   │   ├── data-explorer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   │   │   ├── data-viewer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   ├── package.json

### Architecture multi-tenant

├── config
│   ├── node_modules                       
│   ├── dist                               
│   ├── configs                            
│   │   ├── datasources.json               
│   │   ├── tenants.json 
│   │   │   ├── default
│   │   │   │   ├── data-explorer
│   │   │   │   │   ├── i18n
│   │   │   │   │   ├── settings.json
│   │   │   │   ├── data-viewer
│   │   │   │   │   ├── i18n
│   │   │   │   │   ├── settings.json
│   │   │   ├── my_tenant
│   │   │   │   ├── data-explorer
│   │   │   │   │   ├── i18n
│   │   │   │   │   ├── settings.json
│   │   │   │   ├── data-viewer
│   │   │   │   │   ├── i18n
│   │   │   │   │   ├── settings.json
│   ├── assets 
│   │   ├── default
│   │   │   ├── data-explorer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   │   │   ├── data-viewer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   │   ├── my_tenant
│   │   │   ├── data-explorer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   │   │   ├── data-viewer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   ├── package.json

## port services 

solr: 8983
redis: 6379
postgres: 5432
keycloak: 8080
config: 5007
data-lifecycle-manager: 7000
data-explorer: 7001
share: 3005
data-viewer: 7002
sdmx-faceted-search: 3004
