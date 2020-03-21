library(stringr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)

dat.deaths = read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv")

dat.deaths = dat.deaths %>%
  rename_all(funs(str_replace(., "X", "")))

dat.deaths

dat.deaths = dat.deaths %>%
  select(-Lat, -Long, -Province.State) %>%
  group_by(Country.Region) %>%
  summarise_all(sum) 

dat.deaths = dat.deaths %>%
  mutate(total_deaths = rowSums(dat.deaths[2:ncol(dat.deaths)])) %>%
  arrange(desc(total_deaths)) %>%
  head(20) 

dat2.deaths = dat.deaths %>%
  select(-total_deaths) 

setnames(dat2.deaths, old = colnames(dat2.deaths[, 2:ncol(dat2.deaths)]), new = as.character(as.Date(colnames(dat2.deaths[, 2:ncol(dat2.deaths)]), format = "%m.%d.%y")))

dat.long.deaths = gather(dat2.deaths, colnames(dat2.deaths[,2:ncol(dat2.deaths)]), key = "date", value = "deaths")
dat.long.deaths

plot.deaths = ggplot(dat.long.deaths, aes(x = date, y = deaths, col = Country.Region, group = 1))
plot.deaths = plot.deaths + geom_line() + theme(axis.text.x=element_text(angle=90,hjust=1)) + ylab("Total Deaths") + ggtitle("Total Deaths by Day")
ggplotly(plot.deaths)


