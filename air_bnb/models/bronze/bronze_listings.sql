


select * from {{ source('staging', 'LISTINGS') }}
{% if is_incremental() %}
where created_at > (select coalesce(max(created_at),'1900-01-01') from {{this}})
{% endif %}

{# if the table doesnot exists (here we are refering to table doesnot exist not truncated table) this querry executes in different way but after first execution it converts in to nsert querry and run the code #}