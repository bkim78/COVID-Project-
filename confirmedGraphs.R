library(stringr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)

dat = read.csv("https://raw.githubusercontent.com/CSSEGISanddata/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")

dat = dat %>%
  rename_all(funs(str_replace(., "X", "")))

dat

dat = dat %>%
  select(-Lat, -Long, -Province.State) %>%
  group_by(Country.Region) %>%
  summarise_all(sum) 

dat = dat %>%
  mutate(total_cases = rowSums(dat[2:ncol(dat)])) %>%
  arrange(desc(total_cases)) %>%
  head(20) 

dat2 = dat %>%
  select(-total_cases) 

setnames(dat2, old = colnames(dat2[, 2:ncol(dat2)]), new = as.character(as.Date(colnames(dat2[, 2:ncol(dat2)]), format = "%m.%d.%y")))

dat.long = gather(dat2, colnames(dat2[,2:ncol(dat2)]), key = "date", value = "cases")
dat.long

plot = ggplot(dat.long, aes(x = date, y = cases, col = Country.Region, group = 1))
plot = plot + geom_line() + theme(axis.text.x=element_text(angle=90,hjust=1)) + ggtitle("Total Confirmed Cases by Day")
ggplotly(plot)


