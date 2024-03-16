@EndUserText.label: 'Interfaces Booking Supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_BKSUPPL_001 as projection on ZR_BKSUPPL_001
{
    key BookSupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    BookSupplPrice,
    CurrencyCode,
    LocalLastChangedAt,
    /* Associations */
    _Booking: redirected to parent ZI_BOOKING_001_1,
    _Product,
    _SupplementText, 
    _Travel: redirected to ZI_TRAVEL_001_1
}
