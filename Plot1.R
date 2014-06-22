setwd("C:/Users/S S/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")
install.packages("sqldf")
library(sqldf)

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#taking sum of Emissions by year
final<-sqldf("select year, sum(Emissions) from NEI group by year")

#create and save plot
png(file = "plot1.png", width = 480, height = 480)
plot(final, main = "Change in Emissions - 1999 to 2008", xlab = "Year", ylab = "Total Emissions (in tons)", col = "red", type = "l", lwd = 3)
dev.off()
