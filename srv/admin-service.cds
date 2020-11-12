namespace srv;

using {db} from '../db/schema';

service AdminService {

    @odata.draft.enabled
    entity Books as projection on db.Books;

    @odata.draft.enabled
    entity Authors as projection on db.Authors;

}
