
CREATE TABLE zip_codes (
    zip_code VARCHAR(5) PRIMARY KEY,
    building_zip VARCHAR(5),
    city VARCHAR(100),
    population FLOAT,
    area FLOAT,
    state VARCHAR(2),
    county VARCHAR(50),
    state_fips_code VARCHAR(2),
    county_fips_code VARCHAR(3),
    info_url VARCHAR(255),
    shape_area FLOAT,
    shape_perimeter FLOAT,
    geometry GEOMETRY(MULTIPOLYGON, 4326)
);

CREATE TABLE nyc_311_complaints (
    unique_key VARCHAR(50) PRIMARY KEY,
    created_date VARCHAR(50),
    closed_date VARCHAR(50),
    complaint_type VARCHAR(100),
    zip_code VARCHAR(5),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    geometry GEOMETRY(POINT, 4326)
);

CREATE TABLE nyc_trees (
    tree_id VARCHAR(50) PRIMARY KEY,
    spc_common VARCHAR(100),
    zip_code VARCHAR(5),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    status VARCHAR(50),
    health VARCHAR(50),
    steward VARCHAR(50),
    sidewalk VARCHAR(50),
    geometry GEOMETRY(POINT, 4326)
);

CREATE TABLE zillow_rent_data (
    RegionID INT PRIMARY KEY,
    SizeRank INT,
    zip_code INT,
    RegionType VARCHAR(50),
    StateName VARCHAR(50),
    State VARCHAR(2),
    City VARCHAR(50),
    Metro VARCHAR(50),
    CountyName VARCHAR(50),
    Jan_2023 FLOAT,
    Feb_2023 FLOAT,
    Mar_2023 FLOAT,
    Apr_2023 FLOAT,
    May_2023 FLOAT,
    Jun_2023 FLOAT,
    Jul_2023 FLOAT,
    Aug_2023 FLOAT,
    Sep_2023 FLOAT,
    Oct_2023 FLOAT,
    Nov_2023 FLOAT,
    Dec_2023 FLOAT,
    Jan_2024 FLOAT,
);

CREATE TABLE nyc_bedbug_infestations (
    infestation_id SERIAL PRIMARY KEY,
    zip_code VARCHAR(5),
    infested_dwelling_unit_count INT,
    latitude FLOAT,
    longitude FLOAT,
    geometry GEOMETRY(POINT, 4326)
);
