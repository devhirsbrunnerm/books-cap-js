namespace app;

using {srv} from '../srv/admin-service';
using {db} from '../db/schema';


/**
 * Let the framework generate the IDs for the AdminService
 * automatically
 */
annotate srv.AdminService.Authors {
    ID @Core.Computed;
};

annotate srv.AdminService.Books with {
    ID @Core.Computed;
};


annotate srv.AdminService.Authors with @UI : {
    Facets                     : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#General',
        Label  : '{i18n>general}'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Administrative',
        Label  : '{i18n>administrative}'
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
    },
    FieldGroup #Administrative : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
        ],
    },
};

annotate srv.AdminService.Books with @UI : {
    Facets                     : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#General',
        Label  : '{i18n>general}',

    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'texts/@UI.LineItem',
        Label  : '{i18n>translations}'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Administrative',
        Label  : '{i18n>administrative}'

    },

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
    },
    FieldGroup #Administrative : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
        ],
    },
};

/**
 * Enable fiori draft for localization support
 */
annotate db.Books with @fiori.draft.enabled;

/**
 * Add UI Information for Translations
 */
annotate srv.AdminService.Books_texts with @(UI : {
    Identification  : [{Value : title}],
    SelectionFields : [
    locale,
    title
    ],
    LineItem        : [
    {
        Value : locale,
        Label : '{i18n>locale}'
    },
    {Value : title}
    ],
});


/**
 * Set Value help for Authors in Books, Set the author.name as
 * display value for authors
 */
annotate srv.AdminService.Books with {
    author @ValueList : {entity : 'Authors'}
           @Common    : {
        Text            : author.name,
        TextArrangement : #TextOnly
    };
};


annotate srv.AdminService.Books_texts with {
    locale @ValueList : {
        entity : 'Languages',
        type   : #fixed
    }
};


/**
 * Add the Languages Entity to the Service for Localization
 */
using {sap} from '@sap/cds/common';

extend service srv.AdminService {
    entity Languages as projection on sap.common.Languages;
};
