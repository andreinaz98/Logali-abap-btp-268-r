@EndUserText.label: 'Consumption Booking supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'BookingSupplementID' ]

define view entity ZC_BKSUPPL_001 as projection on ZR_BKSUPPL_001
{
    key BookSupplUUID,
    
    TravelUUID,
    
    BookingUUID,
    
    @Search.defaultSearchElement: true
    BookingSupplementID,
    
     @ObjectModel.text.element: [ 'SupplementDescription' ]
     @Consumption.valueHelpDefinition: [
        { entity: {name: '/DMO/I_Supplement_StdVH', 
          element: 'SupplementID'}, 
                                          
         additionalBinding: [{ localElement:'BookSupplPrice', 
                              element: 'Price', 
                              usage:  #RESULT},
                              
                             { localElement: 'CurrencyCode', 
                               element: 'CurrencyCode', 
                               usage: #RESULT}],
                                       
useForValidation: true}]

    SupplementID,
    _SupplementText.Description as SupplementDescription: localized,
    
    BookSupplPrice,
    
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH', 
                                           element: 'Currency'}, 
                                           useForValidation: true }]
    CurrencyCode,
    
    LocalLastChangedAt,
    
    /* Associations */
    _Booking: redirected to parent ZC_BOOKING_001_1,
    _Product,
    _SupplementText,
    _Travel: redirected to ZC_TRAVEL_001
}
