install.packages("dplyr")
install.packages("plotly")
install.packages("rgdal")
library(dplyr)
library(plotly)
library(rgdal)
library(leaflet)

download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="TM_WORLD_BORDERS_SIMPL-0.3.zip")

unzip("TM_WORLD_BORDERS_SIMPL-0.3.zip")

myspdf = readOGR(dsn=getwd(), layer="TM_WORLD_BORDERS_SIMPL-0.3")
head(myspdf)
summary(myspdf)

leaflet(data=myspdf) %>% 
  addTiles() %>% 
  setView(lat=50.05, lng=86.62 , zoom=2) %>% 
  addPolygons(fillColor = "green", weight = 2,
              highlight = highlightOptions(weight = 2,
                                           color = "red",
                                           fillOpacity = 0.7,
                                           bringToFront = TRUE),
              label=~NAME)

countries <- data.frame(NAME = c("China", "Iran", "South Korea", "Europe"),
                        POP2005 = c(1304000000, 70420000, 48180000, 462000000),
                        lat = c(35, 32.43, 35.91, 54.53),
                        lng = c(105, 53.69, 127.77, 15.26))

countries %>%
  leaflet() %>%
  addTiles() %>%
  addCircles(weight = 1, radius = sqrt(countries$POP2005)*30)




