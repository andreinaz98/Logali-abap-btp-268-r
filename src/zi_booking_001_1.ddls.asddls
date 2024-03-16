@EndUserText.label: 'Interface Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_BOOKING_001_1 as projection on ZR_BOOKING_001
{
 key BookingUUID,
 TravelUUID,
 BookingID,
 BookingDate,
 CustomerID,
 AirlineID,
 ConnectionID,
 FlightDate,
 FlightPrice,
 CurrencyCode,
 BookingStatus,
 LocalLastChangedAt,
 /* Associations */
 _BookingStatus,
 _BookingSupplement: redirected to composition child ZI_BKSUPPL_001,
 _Carrier,
 _Connection,
 _Customer,
 _Travel: redirected to parent zi_travel_001_1   
}
