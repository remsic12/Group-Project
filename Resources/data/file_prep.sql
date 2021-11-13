-- Add keys
-- Primary key
ALTER TABLE education ADD PRIMARY KEY ("FIPS")
--ALTER TABLE education 
--DROP CONSTRAINT "FIPS";

-- Foreign keys
ALTER TABLE "uic"
ADD CONSTRAINT "FIPS"
FOREIGN KEY ("FIPS")REFERENCES education
ALTER TABLE "unemployment"
ADD CONSTRAINT "FIPS"
FOREIGN KEY ("FIPS")REFERENCES education
ALTER TABLE breweries
ADD CONSTRAINT "FIPS"
FOREIGN KEY ("FIPS")REFERENCES education

-- Data clean-up
ALTER TABLE breweries
DROP COLUMN index;
ALTER TABLE education
DROP COLUMN index;
ALTER TABLE education
DROP COLUMN "Area name";
ALTER TABLE uic
DROP COLUMN index;
ALTER TABLE unemployment
DROP COLUMN index;

--Get distict values
DROP TABLE IF EXISTS breweries_distinct;
SELECT DISTINCT
"Brewery",
"FIPS"
INTO breweries_distinct
FROM breweries;
-- Get the number of breweries per county (target)
DROP TABLE IF EXISTS county_breweries;
SELECT "FIPS",
COUNT("Brewery" ) AS county_brewery_count
INTO county_breweries
FROM breweries_distinct
GROUP BY "FIPS";  

-- Create one table to hold all of the demographic information (features)
DROP TABLE IF EXISTS demographics;
SELECT DISTINCT ed."FIPS", 
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
    uic."Population_2010",
    uic."UIC_2013",
    uic."Description",
    uic."City/Suburb/Town/Rural",
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
LEFT JOIN uic
ON(ed."FIPS"=uic."FIPS")
LEFT JOIN unemployment AS un
ON (ed."FIPS"=un."FIPS");

-- Add county brewery count to demographics table for optional table ingesion for machine learning. 
DROP TABLE IF EXISTS brew_demographics;
SELECT DISTINCT d."FIPS",     
    d."State", 
    d."County",
    cb.county_brewery_count,
    d."2003 Rural-urban Continuum Code", 
    d."2003 Urban Influence Code", 
    d."2013 Rural-urban Continuum Code", 
    d."2013 Urban Influence Code", 
    d."City/Suburb/Town/Rural 2013", 
    d."Less than HSD(1970)", 
    d."High school diploma only(1970)", 
    d."Some college (1-3 years)(1970)", 
    d."Four or more years of college(1970)", 
    d."Percent adults with less than HSD(1970)", 
    d."Percent adults with HSD only(1970)", 
    d."Percent adults 1-3 years college(1970)", 
    d."Percent with four or more years of college(1970)", 
    d."Less than HSD(1980)", 
    d."HSD only(1980)", 
    d."Some college (1-3 years)(1980)", 
    d."Four or more years of college (1980)",
    d."Percent with less than HSD(1980)", 
    d."Percent with HSD only(1980)", 
    d."Percent with some college (1-3 years)(1980)", 
    d."Percent with four or more years of college(1980)" , 
    d."Less than HSD(1990)", 
    d."HSD only(1990)", 
    d."Some college or ASD(1990)", 
    d."BS degree or higher(1990)", 
    d."Percent with less than HSD(1990)", 
    d."Percent with HSD only(1990)", 
    d."Percent with some college or ASD(1990)",
    d."Percent with a BS degree or higher(1990)", 
    d."Less than HSD(2000)", 
    d."HSD only(2000)", 
    d."Some college or ASD(2000)", 
    d."BS degree or higher(2000)", 
    d."Percent with less than HSD(2000)", 
    d."Percent with HSD only(2000)",
    d."Percent completing some college or ASD(2000)", 
    d."Percent with BS degree or higher(2000)",
    d."Less than HSD(2015-19)", 
    d."HSD only(2015-19)", 
    d."Some college or ASD(2015-19)", 
    d."BS degree or higher 2015-19", 
    d."Percent with less than HSD(2015-19)", 
    d."Percent with HSD only(2015-19)", 
    d."Percent completing some college or ASD(2015-19)",
    d."Percent with BS degree or higher(2015-19)",
    d."Population_2010",
    d."UIC_2013",
    d."Description",
    d."City/Suburb/Town/Rural",
    d."Rural_urban_continuum_code_2013",
    d."Urban_influence_code_2013",
    d."Community_Type",
    d."Metro_2013",
    d."Civilian_labor_force_2020",
    d."Employed_2020",
    d."Unemployed_2020",
    d."Unemployment_rate_2020",
    d."Median_Household_Income_2019",
    d."Med_HH_Income_Percent_of_State_Total_2019"
INTO brew_demographics
FROM demographics AS d
LEFT JOIN 
county_breweries AS cb
ON(d."FIPS"=cb."FIPS");

