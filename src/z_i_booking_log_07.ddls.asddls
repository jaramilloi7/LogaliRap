@AbapCatalog.sqlViewName: 'ZVBOOK_LOG_07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Booking'
define view Z_I_BOOKING_LOG_07
  as select from zbooking_log_07 as Booking
  composition [0..*] of Z_I_BOOKSUPPL_LOG_07 as _BookingSupplement
  association        to parent Z_I_TRAVEL_LOG_07    as _Travel on $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Customer      as _Customer      on $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier       as _Carrier       on $projection.carrier_id = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection    as _Connection    on $projection.connection_id = _Connection.ConnectionID
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
