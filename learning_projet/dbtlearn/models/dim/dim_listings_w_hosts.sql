with l as (
    select * from {{ ref('dim_listings_cleans') }}
),
h as (
    select * from {{ ref('dim_hosts_cleans') }}
)
select
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.MINIMUM_NIGHTS,
    l.price,
    h.host_id,
    h.host_name,
    h.is_superhost as host_is_superhot,
    l.CREATED_AT,
    greatest(l.UPDATED_AT, h.UPDATED_AT) as UPDATED_AT
from l left join h using(host_id)