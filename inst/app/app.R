#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Monthly Salary according Gender Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("gen",
                        "select Gender:",
                        choices = c("K","M","T"),
                        selected = "K")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("line")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # url <- "https://api.kolada.se/v2/data/kpi/N00053/municipality/1860"
  # r <- httr::GET(url)
  # r$content
  # 
  # httr::status_code(r) # r$status_code
  # httr::headers(r)
  # #str(content(r))
  # #content(r, "text")
  # muni <- jsonlite::fromJSON(url)
  # muni <- as.data.frame(muni)
  # muni
  # muni$values.values
  # 
  # 
  # 
  # str(muni)
  # str(muni$values.values[[1]])
  # str(muni$values.values[[1]][c(2,4)])
  # muni$values.values[[1]][c(2,4)]
  # str(muni$values.period[1])
  # muni$values.values[[1]][c(2,4)]
  # 
  # #df = paste(muni$values.period[1], unlist(muni$values.values[1]) 
  # df_1 = as.data.frame(NA, ncol=3)
  # df = as.data.frame(NA, ncol=3)
  # 
  # for (i in 1:14) {
  #   for (j in 1:3) {
  #     a <- cbind(muni$values.period[i], muni$values.values[[i]][c(2,4)][j,])
  #     df[nrow(df)+1,1:3] <- a
  #   }
  #   #df_1[nrow(df)+1,] <- df
  #   
  # }
  # df <- df[-1,]
  #rm(df_1)
  #colnames(df) <- c('year','gender','value')

      output$line <- renderPlot({
      #g <- reactive({input$gen}) don't use reactive for simple plots
      dataframe_plot <- koladaapi()
      genderplot=dataframe_plot[dataframe_plot$gender==input$gen,]
      year_axis=unique(dataframe_plot[["year"]])
      ggplot2::ggplot(genderplot, aes(x = year, y = value )) +  geom_line() +
      geom_point(size = 4, shape = 21, fill = "white") 
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
