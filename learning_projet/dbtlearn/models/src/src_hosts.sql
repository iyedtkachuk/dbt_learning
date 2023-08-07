with raw_hosts as (
    select * from {{ source('airbnb', 'hosts') }}
)
select id as host_id,
    name as host_name,
    is_superhost,
    CREATED_AT,
    UPDATED_AT
from raw_hosts