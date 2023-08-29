using bkpfService from './bkpf-service';

annotate bkpfService.bkpf with {
    bukrs @title: 'Company Code';
	buktx @title : 'Description';
    belnr @title: 'Document Number';
    gjahr @title: 'Fiscal Year';
    blart @title: 'Document Type';
    bldat @title: 'Document Date';
    budat @title: 'Posting Date';  
}

annotate bkpfService.bukrs with {
    bukrs @title: 'Company Code';
	buktx @title : 'Name';
}

annotate bkpfService.belnr with {
    belnr @title: 'Document Number';
}

annotate bkpfService.blart with {
    blart @title: 'Document Type';
}


annotate bkpfService.bkpf with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Bkpf',
			TypeNamePlural: 'Bkpf',
			Title          : {
                $Type : 'UI.DataField',
                Value : belnr_ID
            },
			Description : {
				$Type: 'UI.DataField',
				Value: blart_ID
			}
		},
		SelectionFields: [bukrs_ID,blart_ID],
		LineItem: [
			{Value: belnr_ID},
			{Value: bukrs_ID},
			{Value: gjahr},
			{ Value: blart_ID},
			{ Value: bldat},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'},
            
		],
		FieldGroup#Main: {
			Data: [
				{Value: bukrs_ID},
				{Value: belnr_ID},
				{Value: gjahr},
				{Value: blart_ID},
				{Value: budat},
				{Value: bldat}, 
			]
		}
	},
) {

};

annotate bkpfService.bkpf with {
	bukrs @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: bukrs.bukrs  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'bukrs',
				CollectionPath: 'bukrs',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: bukrs_ID,
						ValueListProperty: 'bukrs'
					}, 
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'buktx'
					}
				]
			}
		}
	);

    blart @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: blart.blart  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'blart',
				CollectionPath: 'blart',
				Parameters: [ 
                    { $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: blart_ID,
						ValueListProperty: 'blart'
					}, 
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'blart'
					}
				]
			}
		}
	);

    belnr @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: belnr.belnr  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'belnr',
				CollectionPath: 'belnr',
				Parameters: [  
                    { $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: belnr_ID,
						ValueListProperty: 'belnr'
					}, 
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'belnr'
					}
				]
			}
		}
	);
}