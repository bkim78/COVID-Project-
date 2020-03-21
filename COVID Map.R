install.packages("dplyr")
install.packages("plotly")
install.packages("rgdal")
install.packages("magrittr")
install.packages("devtools")
devtools::install_github("rstudio/fontawesome")

library(dplyr)
library(plotly)
library(rgdal)
library(leaflet)
library(magrittr)

download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="TM_WORLD_BORDERS_SIMPL-0.3.zip")

unzip("TM_WORLD_BORDERS_SIMPL-0.3.zip")

myspdf = readOGR(dsn=getwd(), layer="TM_WORLD_BORDERS_SIMPL-0.3")
head(myspdf)
summary(myspdf)

content <- paste(sep = "<br/>",
                 "<b><a href = 'https://www.cdc.gov/coronavirus/2019-ncov/travelers/map-and-travel-notices.html'> CDC Geographic Risk Assessment for COVID-19 Transmission</a></b>", 
                 "Level 3 Travel Health Notice",
                 "Widespread ongoing transmission with restrictions on entry to the United States")

icons = awesomeIcons(icon = "bullhorn", library = "glyphicon",
                     markerColor = "red", iconColor = "white", spin = FALSE,
                     extraClasses = NULL, squareMarker = FALSE, iconRotate = 0,
                     fontFamily = "monospace", text = NULL)
  
leaflet(data=myspdf) %>% 
  addTiles() %>% 
  setView(lat=55, lng= 50 , zoom= 2) %>% 
  addPolygons(fillColor = "green", weight = 2,
              highlight = highlightOptions(weight = 2,
                                           color = "red",
                                           fillOpacity = 0.7,
                                            bringToFront = TRUE),
              label=~NAME) %>%
  addAwesomeMarkers(lat = c(35.9, 32.4, 47.5, 50.5, 49.8, 56.3, 58.6, 61.9, 46.2, 51.2, 39.1, 47.2, 64.9, 41.9, 56.9, 55.2, 49.8, 35.9, 52.1, 51.9, 39.4, 46.2, 48.7, 40.5, 60.1, 46.8, 43.7, 53.1), 
             lng = c(104.2, 53.7, 14.6, 4.5, 15.5, 9.5, 25, 25.7, 2.2, 10.5, 21.8, 19.5, 19.1, 12.6, 24.6, 23.9, 6.1, 14.4, 5.3, 19.1, 8.2, 15, 19.7, 3.7, 18.6, 8.2, 7.4, 7.7), 
             popup = content, icon = icons 
             )
  


