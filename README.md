# book-cap-js

In this repository you can find a small example application for the SAP cloud application programming model. It uses the node flavor in the backend and uses fiori elements for the frontend. It contains the two entities books and authors, which stand in a many to one association. There are two services, the admin service for managing the entries and the catalog service which is readonly.
The title property of the book is localized and all static texts are localized as well.


## Starting the applicaiton
For starting the application locally, simple type:

```sh
$ cds deploy -2 sqlite
$ cds watch
```

This first creates the sqlite file for storing the data and then serves the application in watch mode.


## Deploying the application
There is an mta.yaml file for the deployment, before deployment check wheter you want to deploy the application on a trail or enterprise system.
For a trial system make sure that in the cap-js-books-db section of the mta.yaml file has hanatrial set:

```yaml
parameters:
     service: hanatrial  # 'hana' on production or 'hanatrial' on trial landscapes
     service-plan: hdi-shared
```

for enterprise systems you should use 'hana':
```yaml
parameters:
     service: hana  # 'hana' on production or 'hanatrial' on trial landscapes
     service-plan: hdi-shared
```


After setting the correct value, simply use the following commands:
```sh
$ mbt build
$ cf deploy mta_archives/cap-js-books*.mtar
```

if you have multiple versions in mta_archives replace the filename with the file you actually want to deploy.
