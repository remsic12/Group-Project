# Group-Project
Test repo for Final Projects, created October 26, 2021

- Craft Breweries
- We choose this topic because having breweries in your neighborhood will make people more happy.
- Our Data comes from multiple datasets
  - Our 1st set of data contains a list of all the breweries in the United States along with their location
  - Our 2nd set of data contains Unemployment data by county from 2000 to 2019, as well as median household income for 2019
  - Our 3rd set of data contains Educational data by county, showing the level of education completed
 
## Project Objective 
- We are seeking to identify counties with low unemployment and high median household incomes and display in a map. We then want to take this data to make reccomendations to potential craft brewers on where they should open a craft brewery.

## Communication Protocol 
- Our team is utilizing our slack channel to ensure we are working together to complete all steps
- We are having a stand up meeting set daily
  - Monday through Friday we will meet at 6pm
  - Saturday and Sunday we will meet at 10am 
- We also assigned team member roles using the play station button method, this will help us hold each other accountable for what we are trying to do.
  - Clayton is the Square Role, meaning he is responsible for the repository. 
  - Eric is the Triangle Role, he is responsible for creating a mockup of a machine learning model.
  - Lisa is the Circle Role, she is responsible for creating the database.
  - John is the X Role, he will decide which technologies to use for each step in the project.


## Machine Learning Overview
- Data was read in from the available CSVs.
- The data required some editing, cleaning and transformation before it could be presented
- Visuals were used to identify clusters, which were added to datasets and broken into dataframes to be used for further analysis in the coming weeks

## Machine Learning Explanation and Specifics
- Columns were dropped that were not going to be used or were identical to another columns (ex: County Name and FIPS code hold the same data in different formats, FIPS code was retained for its easy joining capability to other dataframes.
- Some data cleaning was needed to convert object columns to integers. This included removing commas from the entires. A label encoder was used to transform State into a numeric value
- MinMaxScalar was used to present the data in a way that would not skew the results for large numbers (i.e. population or median income)
- An elbow graph was created to determine the number of clusters to identify
- The final model was built using four clusters
- The cluster column was was added to the county dataset and broken into a dataframe for each cluster (county_cluster0, county_cluster1 etc.)

## Database Overview and Explanation
The group decided that a postgres SQL data base would be the best fit for this project. The relevant csv data files were first ingested into Pandas DataFrames via Jupyter Notebook. The resulting DataFrames were then exported as tables to pgAdmin Postgres for additional data cleanup and normalization before export to the machine learning model. The string method was used for the export from Jupyter Notebook to pgAdmin.

Ingested Files:
- brewery_listing.csv
- education.csv
- UIC_codes.csv
- unemployment.csv
- uscities.csv

DataFrames Exported to pgAdmin:
- breweries_df to breweries table
- education_df to education table
- uic_df to uic table
- unemployment_df to unemployment table

## Database Specifics
The database consists of nine SQL tables, the details are listed below:
- breweries: Contains the name and location of each brewery by city, county and state. 
- breweries_distinct: Contains the distinct values from the breweries table.
- breweries_key: Contains the values from the breweries_distinct table plus a new concatenated column labeled "bkey". 
  - Rationale: "County" and "State" columns were concatenated to create a key due to the lack of a FIPS column.
- county_breweries: Contains the total number of breweries by state and county and the "bkey" column. 
- education: Contains adult education information.
- uic: Contains demographic information by state, county and community type.
- uic_key: Contains the values from uic plus a concatenated field ("bkey") to link with the county_brewery table if needed.
- unemployment: Contains county and state level unemployment demographic information. 
- demographics: Contains the values from education, uic_key and unemployment tables. 
  - Rationale: The tables were consolidated for ease of use with the machine learning model.
 
 The Jupyter Notebook and SQL code used for data clean up and table creation were shared with the group so that each member could create their own version of the data base locally.








