WITH RentRanked AS (
    SELECT
        zip_code,
        AVG("Jan_2024") AS avg_rent,
        ROW_NUMBER() OVER(ORDER BY AVG("Jan_2024") ASC) AS rent_asc_rank,
        ROW_NUMBER() OVER(ORDER BY AVG("Jan_2024") DESC) AS rent_desc_rank
    FROM zillow_rent_data
    GROUP BY zip_code
),
TreeCount AS (
    SELECT
        zip_code,
        COUNT(*) AS tree_count
    FROM nyc_trees
    GROUP BY zip_code
),
ComplaintCount AS (
    SELECT
        zip_code,
        COUNT(*) AS complaint_count
    FROM nyc_311_complaints
    WHERE created_date >= '2024-01-01' AND created_date < '2024-02-01'
    GROUP BY zip_code
)
SELECT
    rr.zip_code,
    TO_CHAR(rr.avg_rent, 'FM9,999,999.00') AS average_rent,
    COALESCE(tc.tree_count, 0) AS tree_count,
    COALESCE(cc.complaint_count, 0) AS complaint_count
FROM RentRanked rr
LEFT JOIN TreeCount tc ON rr.zip_code = tc.zip_code
LEFT JOIN ComplaintCount cc ON rr.zip_code = cc.zip_code
WHERE rr.rent_asc_rank <= 5 OR rr.rent_desc_rank <= 5
ORDER BY rr.avg_rent DESC, rr.zip_code;
