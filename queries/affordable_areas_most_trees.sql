
SELECT t.zip_code AS zip_code, 
       TO_CHAR(AVG(z."Jan_2024"), 'FM9,999,999.00') AS average_rent
FROM nyc_trees t
JOIN zillow_rent_data z ON t.zip_code = z.zip_code
GROUP BY t.zip_code
ORDER BY COUNT(t.tree_id) DESC
LIMIT 10;
