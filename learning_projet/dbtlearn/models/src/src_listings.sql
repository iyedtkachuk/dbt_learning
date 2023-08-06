with raw_listings as (
    select * from AIRBNB.RAW.RAW_LISTINGS
)
SELECT 
	ID as listing_id
	,LISTING_URL
	,NAME as listing_name
	,ROOM_TYPE
	,MINIMUM_NIGHTS
	,HOST_ID
	,PRICE as price_str
	,CREATED_AT
	,UPDATED_AT
FROM raw_listings