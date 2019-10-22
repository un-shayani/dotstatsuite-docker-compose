# Dotstatsuite Js / Docker-compose
All services, in this docker-compose, are made by javascript team.
To get the all dotstatsuite, you need to add the docker-compose file from the .Net team.

If you don't work on localhost, you need to change localhost by your domain name or IP. (explain below)

# Table of Contents
1. [Installation](#instalation)
    1. [Docker architecture](#docker-architecture)
    2. [Config](#config)
    3. [.env](#.env)
    4. [run docker-compose](#run-docker-compose)
    5. [Keycloak Setup](#keycloak-setup)
2. [Update](#Update)
    1. [Update Docker-compose](#update-docker-compose)
    2. [Update Config](#update-config)
3. [Overview](#overview)

## Prerequiste

## Instalation
### Docker architecture
```
├── dotstatsuite
│   ├── docker-compose.yml
│   ├── config (cf. Installation => Config)
│   ├── .env
```

> **WARNING**: in docker-compose.yml develop image will be download

### Config
```bash
git clone https://gitlab.com/sis-cc/.stat-suite/dotstatsuite-config.git config
yarn
yarn dist
```

Now choice your architecture mono-tenant or multi-tenants.

#### Architecture mono-tenant

In that architecture, you only need the default folder. You can delete the others tenants.

```
├── config
│   ├── node_modules                       
│   ├── dist                               
│   ├── configs                            
│   │   ├── datasources.json               
│   │   ├── tenants.json 
│   │   ├── default
│   │   │   ├── data-explorer
│   │   │   │   ├── i18n
│   │   │   │   ├── settings.json
│   │   │   ├── data-viewer
│   │   │   │   ├── i18n
│   │   │   │   ├── settings.json
│   ├── assets 
│   │   ├── default
│   │   │   ├── data-explorer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   │   │   ├── data-viewer
│   │   │   │   │   ├── images
│   │   │   │   │   ├── styles*
│   ├── package.json
```
#### Architecture multi-tenants
```
├── config
│   ├── node_modules                       
│   ├── dist                               
│   ├── configs                            
│   │   ├── datasources.json               
│   │   ├── tenants.json 
│   │   ├── default
│   │   │   ├── data-explorer
│   │   │   │   ├── i18n
│   │   │   │   ├── settings.json
│   │   │   ├── data-viewer
│   │   │   │   ├── i18n
│   │   │   │   ├── settings.json
│   │   ├── my_tenant
│   │   │   ├── data-explorer
│   │   │   │   ├── i18n
│   │   │   │   ├── settings.json
│   │   │   ├── data-viewer
│   │   │   │   ├── i18n
│   │   │   │   ├── settings.json
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
```

#### Settings.json

You need to add http://localhost:port/ in settings.json for your different applications
e.g.
```json
"app": {
    "title": "OECD Data Explorer",
    "favicon": "/assets/siscc/data-explorer/images/favicon.ico"
  },
```
will be
```json
"app": {
  "title": "OECD Data Explorer",
  "favicon": "http://localhost:5007/assets/siscc/data-explorer/images/favicon.ico",
},
```

**Data-lifecycle-manager** need your data-explorer URL!

> **WARNING**: If you change port make sure to change also in the settings file and .env!
```json
{
  "sdmx": {
    "datasourceIds": ["my_datasource_id"],
    "datasources": {
      "my_datasource_id": {
        "dataExplorerUrl": "http://localhost:7001",
        "color": "white",
        "backgroundColor": "#D24A44"
      }
   }
}
```

### .env

if you are note in localhost change HOST in this file

> **WARNING**: If you change port make sure to change also in the settings file and .env

### run docker-compose 

For run all services and build your config forlder.
```
docker-compose up --build
```

### Keycloak Setup

#### keycloack ssl deactivation (if not localhost)
```
docker exec -it keycloak bash
cd keycloak/bin/
./kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin
./kcadm.sh update realms/master -s sslRequired=NONE
```

#### Keycloack configuration
go http://localhost:8080
add a client in Clients for master realm
  - client_id: app
  - root_url: http://localhost:7000     (port of dlm)

## Update

### Update Docker-compose

```
docker-compose pull
```

### Update Config
```
git pull
yarn 
yarn dist
```

> **WARNING**: after each change of config you need to run yarn dist

## Overview

solr: http://206.189.58.70:8983
redis: http://206.189.58.70:6379  
postgres: http://206.189.58.70:5432  
keycloak: http://206.189.58.70:8080  
config: http://206.189.58.70:5007  
data-lifecycle-manager: http://206.189.58.70:7000  
data-explorer: http://206.189.58.70:7001  
data-viewer: http://206.189.58.70:7002  
sdmx-faceted-search: http://206.189.58.70:3004  
share: http://206.189.58.70:3005  