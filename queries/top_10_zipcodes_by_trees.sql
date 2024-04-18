
SELECT zip_code AS zip_code, COUNT(*) AS tree_count
FROM nyc_trees
GROUP BY zip_code
ORDER BY tree_count DESC
LIMIT 10;
