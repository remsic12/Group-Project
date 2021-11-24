# Group-Project

## Topic: Craft Breweries

- We chose this topic because having breweries in your neighborhood will make people more happy.
- Our Data comes from multiple datasets
  - Our 1st set of data contains a list of all the breweries in the United States along with their location
  - Our 2nd set of data contains Unemployment data by county from 2000 to 2019, as well as median household income for 2019
  - Our 3rd set of data contains Educational data by county, showing the level of education completed
 
## Project Objective 
- We are seeking to identify counties with low unemployment and high median household incomes and display in a map. We then want to take this data to make reccomendations to potential craft brewers on where they should open a craft brewery.

  - Clayton is the Square Role, meaning he is responsible for the repository. 
  - Eric is the Triangle Role, he is responsible for creating a mockup of a machine learning model.
  - Lisa is the Circle Role, she is responsible for creating the database.
  - John is the X Role, he will decide which technologies to use for each step in the project.

## Project Findings
- By using our machine learning model we were able to organize our data into 4 Clusters, within the 4 Clusters we have identified 5 Counties where we found it optimal to open a new brewery. Please see below for those Counties within their Clusters.
![Cluster 0 Summary](https://user-images.githubusercontent.com/79228491/141518522-4803c452-af6b-4373-b87a-228eef4b71a0.PNG)

![Cluster 1 Summary](https://user-images.githubusercontent.com/79228491/141518535-d8df0531-1604-4cb9-b566-27649caa1d13.PNG)

![Cluster 2 Summary](https://user-images.githubusercontent.com/79228491/141518545-51ff91db-591f-4e3d-b5ae-f41cc3293ad7.PNG)

![Cluster 3 Summary](https://user-images.githubusercontent.com/79228491/141518549-232a9a8b-81e4-4bb0-aa4f-daedb3cf52d8.PNG)

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
The group decided that a postgreSQL database would be the best fit for this project. The relevant csv data files were first ingested into Pandas DataFrames via Jupyter Notebook. The resulting DataFrames were then exported as tables to pgAdmin for additional data cleanup and normalization before export to the machine learning model. The resulting files were then exported to the machine learning model where additional data manipulation was performed before ingestion into the model. The string method was used for the export from Jupyter Notebook to pgAdmin and from pgAdmin to the learning model.

Ingested Files:
- brewery_listing.csv
- education.csv
- UIC_codes.csv
- unemployment.csv

DataFrames Exported to pgAdmin:
- breweries_df to breweries table
- education_df to education table
- uic_df to uic table
- unemployment_df to unemployment table

## Database Specifics
The database consists of eight SQL tables, the details are listed below:
- breweries: Contains the name and location of each brewery by FIPS, city, county and state. 
- breweries_distinct: Contains the distinct values from the breweries table.
- county_breweries: Contains the count of the total number of breweries by FIPS (target)
- education: Contains adult education information.
- uic: Contains demographic information by state, county and community type.
- unemployment contains information relevant to employment status by coummunity type.
- demographics: Contains the values from education, uic and unemployment tables. 
  - Rationale: The tables were consolidated for ease of use with the machine learning model (features).
- brew_demographics: Contains the values from county_breweries and demographics tables.
  - Created as an alternative table for use with the machine learning model.
  
An image of the Group-Project database entity relationship diagram (ERD) is displayed below, the file is located in the Group-Project\Resources\Images folder. The file name is Group-Project.pgerd.png.
 
The Jupyter Notebook and SQL code used for data exploration and table creation were shared with the group so that each member could create their own version of the data base locally. Copies of these files reside in the Group-Project\Resources\data subfolder. The file names are Capstone_initial_erd.ipynb and file_prep.sql. 

###### Group-Project Datbase ERD
![Group-Project_pgerd](https://github.com/remsic12/Group-Project/blob/main/Resources/Images/Group-Project.pgerd.png)

## Project Presentation
- Attached is the link to the Google Slides Presentation
- https://docs.google.com/presentation/d/1kWie1z2P4awKJPUh3WpI64eJdcWfEsvfpYVuYOAeHro/edit#slide=id.p






