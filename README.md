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




