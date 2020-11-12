namespace srv;

using {db} from '../db/schema';

service CatalogService {

    // Do not allow access to adminstrative data

    @readonly
    entity Books as select from db.Books {
        ID,
        title,
        author
    };

    @readonly
    entity Authors as select from db.Authors {
        ID,
        name,
        books
    }

}
