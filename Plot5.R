setwd("C:/Users/school/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")
install.packages ("plyr")
library(plyr)

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#separate out data for Baltimore
fips<-subset(NEI, fips == 24510)

#seperate all Data Categories for Onroad (separates out motor vehicles)
cars<-subset(SCC, Data.Category == "Onroad")

#find Emissions records related to Coal use by year
cars_emissions<-merge(cars, fips, by = "SCC")

#group by year
final<-ddply(cars_emissions, "year", summarise, total_emissions = sum(Emissions))

#create and save plot
png(file = "plot5.png", width = 480, height = 480)
plot(final, main = "Emissions Trends of Motor Vehicles in Baltimore - 1999 to 2008", xlab = "Year", ylab = "Total Emissions (in tons)", col = "blue", type = "l")
dev.off()
