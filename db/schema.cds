namespace db;

using {cuid, managed} from '@sap/cds/common';


entity Books : cuid, managed {
    title: localized String(100);

    author : Association to Authors;
}


entity Authors : cuid, managed {
    name: String(200);

    books : Association to many Books on books.author = $self;
}