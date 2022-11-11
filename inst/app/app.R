#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a line graph
ui <- fluidPage(

    # Application title
    titlePanel("Monthly Salary according Gender Data"),

    
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
 

  

      output$line <- renderPlot({
      #g <- reactive({input$gen}) don't use reactive for simple plots
      dataframe_plot <- koladaapi()
      genderplot=dataframe_plot[dataframe_plot$gender==input$gen,]
      year_axis=unique(dataframe_plot[["year"]])
      ggplot2::ggplot(genderplot, ggplot2::aes(x = year, y = value )) +  #
        ggplot2::geom_line() +
        ggplot2::geom_point(size = 4, shape = 21, fill = "white") 
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
