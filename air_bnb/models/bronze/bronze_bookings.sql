select * from {{ source('staging', 'BOOKINGS') }}
{% if is_incremental() %}
where booking_date > (select coalesce(max(booking_date),'1900-01-01') from {{this}})
{% endif %}