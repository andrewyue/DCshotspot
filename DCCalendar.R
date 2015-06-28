library(ggplot2)	# Load the necessary libraries, extrafont used here
library(grid)		# to allow for the use of Myriad Web Pro
library(extrafont)	#
source("~/DCCalendar/multiplot.R")	# code containing multiplot function
# Load in raw data
Raw_Data <- read.delim("~/DCCalendar/Raw_Data.txt", header=FALSE)
Raw_Data[["Rdatetime"]] = as.POSIXct(Raw_Data[["V3"]]*(60*60*24), origin="1899-12-30", tz="GMT")	
# Prepare new columns in the data frame for data selection - full month name, numeric hour, and 4-digit mmdd
Raw_Data$month = strftime(Raw_Data$Rdatetime, format="%B")
Raw_Data$hour = as.numeric(strftime(Raw_Data$Rdatetime, format="%H", tz="GMT")) + as.numeric(strftime(Raw_Data$Rdatetime, format="%M", tz="GMT"))/60
Raw_Data$monthday = strftime(Raw_Data$Rdatetime, format = "%m%d")
# Set the dates we want to remove from the raw data
bad_dates = c("0101", "0703", "0704", "0705", "1231")
# And perform the cut
Good_Data = subset(Raw_Data, !(Raw_Data$monthday %in% bad_dates))
# Generate month data frames
jan = subset(Good_Data, Good_Data$month == "January")
feb = subset(Good_Data, Good_Data$month == "February")
mar = subset(Good_Data, Good_Data$month == "March")
apr = subset(Good_Data, Good_Data$month == "April")
may = subset(Good_Data, Good_Data$month == "May")
jun = subset(Good_Data, Good_Data$month == "June")
jul = subset(Good_Data, Good_Data$month == "July")
aug = subset(Good_Data, Good_Data$month == "August")
sep = subset(Good_Data, Good_Data$month == "September")
oct = subset(Good_Data, Good_Data$month == "October")
nov = subset(Good_Data, Good_Data$month == "November")
dec = subset(Good_Data, Good_Data$month == "December")
# Prepare the month histograms
m1=ggplot(jan, aes(hour, fill=cut(..x..,c(7.5,17.25))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("January")+coord_cartesian(ylim=c(0,200))+xlab("Time of Day")+ylab("Incidents")+annotate("text", x=12.375, y=30, family="Myriad Web Pro", label ="Daylight hours",size=4)+annotate("rect",xmin=7.5, xmax = 17.25, ymin=0, ymax=50,fill="orange",alpha=0.1)+theme(text=element_text(family="Myriad Web Pro", size=24))
m2=ggplot(feb, aes(hour, fill=cut(..x..,c(7,17.75))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("February")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m3=ggplot(mar, aes(hour, fill=cut(..x..,c(7,19))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("March")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m4=ggplot(apr, aes(hour, fill=cut(..x..,c(6.5,19.75))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("April")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m5=ggplot(may, aes(hour, fill=cut(..x..,c(6,20.5))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("May")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m6=ggplot(jun, aes(hour, fill=cut(..x..,c(5.75,20.5))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("June")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m7=ggplot(jul, aes(hour, fill=cut(..x..,c(6,20.5))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("July")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m8=ggplot(aug, aes(hour, fill=cut(..x..,c(6.25,20))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("August")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m9=ggplot(sep, aes(hour, fill=cut(..x..,c(6.75,19.25))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("September")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m10=ggplot(oct, aes(hour, fill=cut(..x..,c(7.25,18.5))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("October")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m11=ggplot(nov, aes(hour, fill=cut(..x..,c(6.75,17))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("November")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
m12=ggplot(dec, aes(hour, fill=cut(..x..,c(7.25,16.75))))+geom_histogram(binwidth=.25, )+guides(fill=FALSE)+guides(fill=FALSE)+scale_x_continuous(breaks=c(0,6,12,18,24))+ggtitle("December")+coord_cartesian(ylim=c(0,200))+ylab("")+theme(text=element_text(family="Myriad Web Pro", size=24))+xlab("")
# And plot them in a single view
multiplot(m1,m5,m9,m2,m6,m10,m3,m7,m11,m4,m8,m12, cols = 4, title="ShotSpotter Gunshot Incidents in Washington DC, 2006-2013",titlefont = "Myriad Web Pro", titlesize=40)
