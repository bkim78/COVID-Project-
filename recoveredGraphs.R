library(stringr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)

dat.rec = read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv")

dat.rec = dat.rec %>%
  rename_all(funs(str_replace(., "X", "")))

dat.rec = dat.rec %>%
  select(-Lat, -Long, -Province.State) %>%
  group_by(Country.Region) %>%
  summarise_all(sum) 

dat.rec = dat.rec %>%
  mutate(total_recovered = rowSums(dat.rec[2:ncol(dat.rec)])) %>%
  arrange(desc(total_recovered)) %>%
  head(20) 

dat2.rec = dat.rec %>%
  select(-total_recovered) 

setnames(dat2.rec, old = colnames(dat2.rec[, 2:ncol(dat2.rec)]), new = as.character(as.Date(colnames(dat2.rec[, 2:ncol(dat2.rec)]), format = "%m.%d.%y")))

dat.long.rec = gather(dat2.rec, colnames(dat2.rec[,2:ncol(dat2.rec)]), key = "date", value = "recovered") 
dat.long

plot.rec = ggplot(dat.long.rec, aes(x = date, y = recovered, col = Country.Region, group = 1))
plot.rec = plot.rec + geom_line() + theme(axis.text.x=element_text(angle=90,hjust=1)) + ylab("Total Recovered") + ggtitle("Total People Recovered by Day")
ggplotly(plot.rec)


