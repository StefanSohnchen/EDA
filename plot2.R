# Exploratory Data Analysis (EDA), Assignment due 31/12/17

# The data for this assignment are available from the course web site as a single zip file:
# Data for Peer Assessment [29Mb]
# The zip file contains two files: 

# FILE 1: PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a # data frame with all of # the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the # table contains number # of tons of PM2.5 emitted from a specific type of source for the entire year.

# FILE 2: Source Classification Code Table (Source_Classification_Code.rds): This table provides a # mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source.

# Once the above two files have been downloaded into the working directory, read data into RStudio 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sampling

NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subset data and append two years in one data frame

MD <- subset(NEI, fips=='24510')

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
# fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Construct the plot and save it to a PNG file.

png(filename='plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
main='Total Emission in Baltimore City, MD', 
xlab='Year', ylab=expression('PM'[2.5]))

# shut down the specified device

dev.off()
 