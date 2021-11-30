Final State of unspervised ML model kmeans clustering using standard scaler
    
    utilized clusters to categorize counties to determine the number of existing breweries in counties of each type.  allows us to identify underserved populations. and identify good locations to build a new brewery or buy an exsisting brewery  

the data is read into jupyter notebook from PostgreSQL to a Pandas df using psycop2 package.

One of the columns you may hear us talking about is FIPS (Federal Information Processing Standards) which is used to identify each individual county nationwide. it was made into the index.

feature selection-original data 60+ columns datapoints used( Rural Urban continuum code,Population, civilian labor force, unemployment rate,median household income, median household income within state.)

RUCC- large metropolitan county, small rural county, small county adjacent to metro area over 1 million, under 1 million, etc 

data conversion is required to convert data stored as a string that looked like a number.  commas were removed and the datatype could then be changed to integers. 

Used standard scaler to prepare the features for K-means cluster.

graphed using elbow method possible results between 3 and 6.  Results of 4 clusters showed well defined clusters with measurable differences. concerned using 6 would over divide these well defined clusters unneccessarily.

number of breweries added after clustering (along with state which wasn't used in clustering but helpful in identification)

kmeans was originally performed with minmax scaler but cluisters seemed muddled.

with standard scaler utilizing standard deviation it provided cleaner breaks between clusters.

linear regression was attempted to be able to predict the number of breweries in any county.  This attempt was unsuccesfull.

PCA was also performed but the results were also not well defined

