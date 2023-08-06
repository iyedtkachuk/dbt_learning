{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
select * from src_reviews
where review_text is not null
-- i need to tell dbt how to increment, what records are right and how dbt knows that the records are new or not
{% if is_incremental() %}
-- am only interested on records under this conditions
  and review_date > (select max(review_date) from {{ this }})
{% endif %}