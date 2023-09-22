

library(shiny)
library(tidyverse)

proj_22 <- read_csv("proj22.csv") 

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Projections by Grade: 2022-2023"),

        # Show a plot of the generated distribution
        mainPanel(
           tableOutput("table1"),
           downloadButton("downloadData", "Download")
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$table1 <- renderTable({
        # generate bins based on input$bins from ui.R
        proj_22
    })
    
    output$downloadData <- downloadHandler(
      filename = function() {
        # Use the selected dataset as the suggested file name
        paste0("proj_22", ".csv")
      },
      content = function(file) {
        # Write the dataset to the `file` that will be downloaded
        write.csv(proj_22, file)
      }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
