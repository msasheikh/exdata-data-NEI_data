setwd("C:/Users/school/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")
install.packages("ggplot2")
library(ggplot2)
install.packages("sqldf")
library(sqldf)

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#group data by year and type with total Emissions
final<-sqldf("select year, type, Emissions from NEI group by year, type")

#create and save plot
png(file = "plot3.png", width = 480, height = 480)
qplot(data = final, year, log(Emissions), group = type, color = type) + ggtitle("Emissions Trends by Type - 1999 to 2008") + geom_line() + geom_point() 
dev.off()
