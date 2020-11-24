namespace srv;

using {db} from '../db/schema';

@path: 'api'
service RestService {

    entity Books as projection on db.Books;

    entity Authors as projection on db.Authors;

}
