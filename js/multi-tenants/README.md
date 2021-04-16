:warning: dev folder is only for dev purpose  

# docker-compose with proxy  
The purpose to this docker-compose is to get architecture close from the cloud. 

By that fact, only proxy is exposed.  
See config/routes.json to more details  

e.g.:  
http://data-explorer-oecd.localhost will give you a data-explorer with oecd tenant

## keycloak

you can use keycloak from demo folder `dotstatsuite-docker-compose/demo`.
go into demo folder and run `docker-compose -f docker-compose-demo-keycloak.yml up`
