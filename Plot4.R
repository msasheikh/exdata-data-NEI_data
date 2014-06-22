setwd("C:/Users/school/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")
install.packages("plyr")
library(plyr)

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#seperate all Short.Names with the word Coal (with uppercase or lowercase "c")
coal<-SCC[grep("Coal|coal", SCC$Short.Name), ]

#find Emissions records related to Coal use by year in NEI file
coal_emissions<-merge(coal, NEI, by = "SCC")

#group by year
final<-ddply(coal_emissions, "year", summarise, total_emissions = sum(Emissions))

#create and save plot
png(file = "plot4.png", width = 480, height = 480)
plot(final, main = "Emissions Trends of Coal Use - 1999 to 2008", xlab = "Year", ylab = "Total Emissions (in tons)", col = "blue", lwd = 5)
dev.off()
