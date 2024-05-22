CLASS zcl_ext_update_ent_log_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXT_UPDATE_ENT_LOG_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITIES OF z_i_travel_log_07
        ENTITY Travel
        UPDATE FIELDS ( agency_id description )
        WITH VALUE #( ( travel_id = '00000001'
                        agency_id = '070017'
                        description = 'New external update') )
        FAILED DATA(failed)
        REPORTED DATA(reported).

    READ ENTITIES OF z_i_travel_log_07
         ENTITY Travel
         FIELDS ( description )
         WITH VALUE #( ( travel_id = '00000001' ) )
         RESULT DATA(lt_travel_data)
         FAILED failed
         REPORTED reported.

    COMMIT ENTITIES.

    IF failed IS INITIAL.
      out->write( 'Commit Successfull' ).
    ELSE.
      out->write( 'Commit Fail' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
