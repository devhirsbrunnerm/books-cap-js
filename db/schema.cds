namespace db;

using {cuid, managed} from '@sap/cds/common';


entity Books : cuid, managed {
    title: String(200);
}


entity Authors : cuid, managed {
    name: String(200);
}