#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
    titlePanel("COVID-19 Travel Information"),
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput("Travel Health Notice Level"),
                h3("Level"),
                choices = list("Level 1" = 1,
                               "Level 2" = 2,
                               "Level 3" = 3)
            )
        ),

        mainPanel(
           plotOutput("COVIDMap")

        )
    )

# Define server logic required to draw a histogram
install.packages("dplyr")
install.packages("plotly")
install.packages("rgdal")
library(dplyr)
library(plotly)
library(rgdal)
library(leaflet)

server <- function(input, output) {

    output$COVIDmap <- renderPlot({
        
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
