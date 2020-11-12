namespace app;

using {srv} from '../srv/catalog-service';
using {db} from '../db/schema';

annotate srv.CatalogService.Authors with @UI : {
    Facets              : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#General',
        Label  : '{i18n>general}'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'books/@UI.LineItem',
        Label  : '{i18n>books}'
    },
    ],
    FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data  : [{Value : name}],
    }
};

annotate srv.CatalogService.Books with @UI : {
    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#General',
        Label  : '{i18n>general}'

    }],
    FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {Value : title},
        {
            Value : author.name,
            Label : '{i18n>author}'
        }
        ]
    }
};
