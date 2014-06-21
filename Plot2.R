setwd("C:/Users/S S/Dropbox/Cousera/Exploratory Data Analysis/project2/exdata-data-NEI_data")

#read in the files of data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#separate out Emissions columns for 1999
nine<-as.data.frame(subset(NEI, year == 1999 | fips == "24510" , select = c(fips, Emissions)))
sum9<-as.data.frame(sum(nine)); 
sum9[, "year"]<- 1999; 
colnames(sum9)<-c("Emissions", "year")

#separate out Emissions columns for 2002
two<-as.data.frame(subset(NEI, year == 2002 | fips == "24510", select = c(Emissions)))
sum2<-as.data.frame(sum(two)); 
sum2[, "year"]<- 2002; 
colnames(sum2)<-c("Emissions", "year")

#separate out Emissions columns for 2005
five<-as.data.frame(subset(NEI, year == 2005 | fips == "24510", select = c(Emissions)))
sum5<-as.data.frame(sum(five)); 
sum5[, "year"]<- 2005; 
colnames(sum5)<-c("Emissions", "year")

#separate out Emissions columns for 2008
eight<-as.data.frame(subset(NEI, year == 2008 | fips == "24510", select = c(Emissions)))
sum8<-as.data.frame(sum(eight)); 
sum8[, "year"]<- 2008; 
colnames(sum8)<-c("Emissions", "year")

#prepare data for plotting
final<-rbind(sum9,sum2,sum5,sum8)

#create and save plot
png(file = "plot2.png", width = 480, height = 480)
plot(final$year, final$Emissions, main = "Emissions Trends in Baltimore - 1999 to 2008", xlab = "Year", ylab = "Total Emissions", col = "red", lwd = 10)
dev.off()
