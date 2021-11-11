-- Data clean-up
ALTER TABLE breweries
DROP COLUMN index;
ALTER TABLE education
DROP COLUMN index;
ALTER TABLE uic
DROP COLUMN index;
ALTER TABLE unemployment
DROP COLUMN index;
-- Create a key that will be used to join county_breweries and uic_key tables if needed
DROP TABLE IF EXISTS breweries_key;
SELECT CONCAT("County", ' ', "State") as bkey,
"Brewery"
INTO breweries_key
FROM "breweries"; 
--Get distict values
DROP TABLE IF EXISTS breweries_distinct;
SELECT DISTINCT
"Brewery",
bkey
INTO breweries_distinct
FROM breweries_key;
-- Get the number of breweries per county
DROP TABLE IF EXISTS county_breweries;
SELECT "bkey",
COUNT("Brewery" ) AS county_brewery_count
INTO county_breweries
FROM breweries_distinct
GROUP BY bkey;  
-- Create a key to join uic_key and county_breweries tables if needed
DROP TABLE IF EXISTS uic_key;
SELECT CONCAT("County", ' ', "State") as bkey,
county_fips,
"State",
"County",
"Population_2010",
"UIC_2013",
"Description",
"City/Suburb/Town/Rural"
INTO uic_key
FROM uic;
-- Create one table to hold all of the demographic information
DROP TABLE IF EXISTS demographics;
SELECT DISTINCT ed.county_fips AS "FIPS", 
    ed."State", 
    ed."County",
    ed."2003 Rural-urban Continuum Code", 
    ed."2003 Urban Influence Code", 
    ed."2013 Rural-urban Continuum Code", 
    ed."2013 Urban Influence Code", 
    ed."City/Suburb/Town/Rural 2013", 
    ed."Less than HSD(1970)", 
    ed."High school diploma only(1970)", 
    ed."Some college (1-3 years)(1970)", 
    ed."Four or more years of college(1970)", 
    ed."Percent adults with less than HSD(1970)", 
    ed."Percent adults with HSD only(1970)", 
    ed."Percent adults 1-3 years college(1970)", 
    ed."Percent with four or more years of college(1970)", 
    ed."Less than HSD(1980)", 
    ed."HSD only(1980)", 
    ed."Some college (1-3 years)(1980)", 
    ed."Four or more years of college (1980)",
    ed."Percent with less than HSD(1980)", 
    ed."Percent with HSD only(1980)", 
    ed."Percent with some college (1-3 years)(1980)", 
    ed."Percent with four ore more years of college(1980)" AS"Percent with four or more years of college(1980)" , 
    ed."Less than HSD(1990)", 
    ed."HSD only(1990)", 
    ed."Some college or ASD(1990)", 
    ed."BS degree or higher(1990)", 
    ed."Percent with less than HSD(1990)", 
    ed."Percent with HSD only(1990)", 
    ed."Percent with some college or ASD(1990)",
    ed."Percent with a BS degree or higher(1990)", 
    ed."Less than HSD(2000)", 
    ed."HSD only(2000)", 
    ed."Some college or ASD(2000)", 
    ed."BS degree or higher(2000)", 
    ed."Percent with less than HSD(2000)", 
    ed."Percent with HSD only(2000)",
    ed."Percent completing some college or ASD(2000)", 
    ed."Percent with BS degree or higher(2000)",
    ed."Less than HSD(2015-19)", 
    ed."HSD only(2015-19" AS "HSD only(2015-19)", 
    ed."Some college or ASD(2015-19)", 
    ed."Bachelor's degree or higher 2015-19" AS "BS degree or higher 2015-19", 
    ed."Percent with less than HSD(2015-19)", 
    ed."Percent with HSD only(2015-19)", 
    ed."Percent completing some college or ASD(2015-19)",
    ed."Percent with BS degree or higher(2015-19)",
    uick.bkey,
    uick."Population_2010",
    uick."UIC_2013",
    uick."Description",
    uick."City/Suburb/Town/Rural",
    un."Rural_urban_continuum_code_2013",
    un."Urban_influence_code_2013",
    un."Community_Type",
    un."Metro_2013",
    un."Civilian_labor_force_2020",
    un."Employed_2020",
    un."Unemployed_2020",
    un."Unemployment_rate_2020",
    un."Median_Household_Income_2019",
    un."Med_HH_Income_Percent_of_State_Total_2019"
INTO demographics
FROM education AS ed
LEFT JOIN uic_key AS uick
ON(ed.county_fips=uick.county_fips)
LEFT JOIN unemployment AS un
ON (ed.county_fips=un.county_fips);