
SELECT tree_id, spc_common AS species, health, status, ST_AsText(geometry) AS coordinates
FROM nyc_trees
WHERE ST_DWithin(geometry, ST_Buffer(ST_GeomFromText('POINT(-73.96253174434912 40.80737875669467)', 4326), 804.672), 804.672);
