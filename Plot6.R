setwd("C:/Users/school/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")

install.packages("ggplot2")
library(ggplot2)
install.packages("sqldf")
library(sqldf)

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#separate out data for Baltimore and Los Angeles
fips<-subset(NEI, subset = fips == "24510" | fips == "06037")

#seperate all Data Categories for Onroad (separates out motor vehicles)
cars<-subset(SCC, Data.Category == "Onroad")

#find Emissions records related to Coal use by year
cars_emissions<-merge(cars, fips, by = "SCC")

#group by year
final<-sqldf("select year, fips, Emissions from cars_emissions group by year, fips")

#create and save plot
png(file = "plot6.png", width = 480, height = 480)
qplot(data = final, year, Emissions, group = fips, color = fips) + ggtitle("Emissions Trends of Motor Vehicles\nin Baltimore and Los Angeles Counties - 1999 to 2008") + geom_line() + geom_point() + scale_colour_discrete (name = "City", breaks = c("06037" , "24510"), labels = c("Los Angeles", "Baltimore"))
dev.off()

