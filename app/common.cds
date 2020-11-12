namespace app;

using {db} from '../db/schema';

/**
* Define Common Annotations used across all Services
*/


annotate db.Authors with @(
    Common.SemanticKey : [ID],
    UI                 : {
        Identification  : [{Value : name}],
        HeaderInfo      : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : '{i18n>author}',
            TypeNamePlural : '{i18n>authors}',
            Title          : {Value : name}
        },
        SelectionFields : [name],
        LineItem        : [{Value : name}],
    }
) {
    ID   @title : '{i18n>id}';
    name @title : '{i18n>name}';
};


annotate db.Books with @(
    Common.SemanticKey : [ID],
    UI                 : {
        Identification  : [{Value : ID}],
        HeaderInfo      : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : '{i18n>book}',
            TypeNamePlural : '{i18n>books}',
            Title          : {Value : title},
        },
        SelectionFields : [title],
        LineItem        : [
        {Value : title},
        {
            Value : author.name,
            Label : '{i18n>author}'
        }
        ],
    }
) {
    ID    @title : '{i18n>id}';
    title @title : '{i18n>title}';
};
