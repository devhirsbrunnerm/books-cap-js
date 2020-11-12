namespace app;

using {db} from '../db/schema';

annotate db.Authors with @(
    Common.SemanticKey : [name],
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
    ID   @title : '{i18n>id}'  @Core.Computed;
    name @title : '{i18n>name}';
};


annotate db.Books with @(
    Common.SemanticKey : [title],
    UI                 : {
        Identification  : [{Value : title}],
        HeaderInfo      : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : '{i18n>book}',
            TypeNamePlural : '{i18n>books}',
            Title          : {Value : title}

        },
        SelectionFields : [title],
        LineItem        : [{Value : title}],
    }
) {
    ID    @title : '{i18n>id}'  @Core.Computed;
    title @title : '{i18n>title}';
};
