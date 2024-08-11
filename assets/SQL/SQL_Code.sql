WITH cte AS 
(
SELECT * FROM dbo.bike_share_yr_0
UNION ALL
SELECT * FROM dbo.bike_share_yr_1
) 
SELECT dteday,
season,
cte.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders * price AS revenue,
(riders * price) - COGS AS profit
FROM cte
LEFT JOIN dbo.cost_table ON dbo.cost_table.yr = cte.yr