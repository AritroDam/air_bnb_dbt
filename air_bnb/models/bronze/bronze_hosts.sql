{{ config (materialized='table')}}


select * from {{ source('staging', 'HOSTS') }}
{% if is_incremental() %}
where created_at > (select coalesce(max(creatd_at),'1900-01-01') from {{this}})
{% endif %}

{# we can refer to this model inthe querry as {{this}} we have used materialized as incremental to store historical data 
but based on requirment we can change it at file level usually we do it for small tables #}