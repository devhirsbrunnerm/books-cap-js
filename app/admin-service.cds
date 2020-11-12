namespace app;

using {srv} from '../srv/admin-service';

annotate srv.AdminService.Authors with @UI : {
    Facets                     : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#General',
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Administrative',
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'books/@UI.LineItem',
        Label  : '{i18n>books}'
    },
    ],
    FieldGroup #General        : {
        $Type : 'UI.FieldGroupType',
        Data  : [{Value : name}],
        Label : '{i18n>general}',
    },
    FieldGroup #Administrative : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
        ],
        Label : '{i18n>administrative}'
    },
};

annotate srv.AdminService.Books with @UI : {
    Facets                     : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#General',
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Administrative',
    }
    ],
    FieldGroup #General        : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {Value : title},
        {
            Value : author_ID,
            Label : '{i18n>author}'
        }
        ],
        Label : '{i18n>general}',
    },
    FieldGroup #Administrative : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
        ],
        Label : '{i18n>administrative}'
    },
};


annotate srv.AdminService.Books with {
    author @ValueList : {entity : 'Authors'}
           @Common    : {
        Text            : author.name,
        TextArrangement : #TextOnly
    };
};
