
SELECT z.zip_code AS zip_code, COUNT(*) AS tree_count
FROM nyc_trees AS t
JOIN zip_codes AS z ON ST_Contains(z.geometry, t.geometry)
GROUP BY z.zip_code
ORDER BY tree_count DESC
LIMIT 10;
