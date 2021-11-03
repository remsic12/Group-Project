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
<<<<<<< HEAD
=======


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

## Database Overview
- The intial version of the database for this project was created through the ingestion of csv files into pandas dataframes via Jupyter Notebook.
- This csv files are listed below
1. brewery_listing.csv
2. education.csv
3. UIC_codes.csv
4. unemployment.csv
5. uscities.csv
- The Jupyter Notebook containing the preliminary data (Capstone_initial_erd.ipynb) was pushed to the branch labeled "LisaMcD_branch"

## Database Explanation and Specifics
- Relevant variables from each of the dataframes were ultimately combined into one dataset, with the goal of cleaning and exporting the final dataset to a SQL database that could be used for the project model
- This is just a prelimiary example, so the method will likely change as necessary to meet the needs of the group
>>>>>>> a801eecd54e07f5d8f7480fc46a89429b5a98ded
