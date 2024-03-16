@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity Root Travel'
define root view entity ZR_TRAVEL_001 as select from ztb_travel_001
composition [0..*] of ZR_BOOKING_001 as _Booking //se debe indicar cardinalidad 0..* y al final agregar el alias al final de los campos
//antes de crear las composiciones ,crear las asociaciones con las tablas estandares con cardinalidad 0..1
association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID
association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
association [0..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
    
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,//Association
      customer_id           as CustomerID,//Association
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,//Association

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //total ETag field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      //association_name // Make association public
    
     //se Exponen las asociaciones 
     _Booking, //Composition
     _Agency,
     _Customer,
     _OverallStatus,
     _Currency
     
}
