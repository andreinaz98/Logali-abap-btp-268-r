@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_BKSUPPL_001 as select from ztb_bksuppl_001

    association to parent ZR_BOOKING_001 as _Booking on $projection.BookingUUID = _Booking.BookingUUID
  
    association[1..1] to ZR_TRAVEL_001 as _Travel on $projection.TravelUUID = _Travel.TravelUUID
    association[1..1] to /DMO/I_Supplement as _Product on $projection.SupplementID = _Product.SupplementID
    association[1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
      key booksuppl_uuid    as BookSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      //Associationes
      _Product, 
      _SupplementText,
      _Booking,
      _Travel
}
