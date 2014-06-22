setwd("C:/Users/S S/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")
install.packages("sqldf")
library(sqldf)

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#separate out data for Baltimore
fips<-subset(NEI, fips == 24510)

#taking sum of Emissions by year
final<-sqldf("select year, sum(Emissions) from fips group by year")

#create and save plot
png(file = "plot2.png", width = 480, height = 480)
plot(final, main = "Emissions Trends in Baltimore - 1999 to 2008", xlab = "Year", ylab = "Total Emissions (in tons)", col = "red", lwd = 8)
dev.off()
