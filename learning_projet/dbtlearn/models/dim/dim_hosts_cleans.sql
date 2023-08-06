with src_hosts as(
    select * from {{ ref('src_hosts') }}
)
select host_id,
    NVL(host_name, 'Anonymous') as host_name,
    is_superhost,
    CREATED_AT,
    UPDATED_AT
from src_hosts