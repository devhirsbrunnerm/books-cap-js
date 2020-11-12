namespace srv;

using {db} from '../db/schema';

service CatalogService {

    @readonly
    entity Books   as projection on db.Books;

    @readonly
    entity Authors as projection on db.Authors;

}
