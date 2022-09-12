#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins

        # Show a plot of the generated distribution
        mainPanel(
          uiOutput(outputId = "spu_corr"),
          actionButton("corr", icon("fas fa-magic"), label="Spurious Correlations!", style = 'display: block; margin: auto')
        )
    )


# Define server logic required to draw a histogram
server <- function(input, output) {

  values <- reactiveValues(image_name = sample(list.files('~/Documents/R/Cofounders/Cofounders/www'), 1))
  
observeEvent(input$corr,
                         {
                           list <- list.files('~/Documents/R/Cofounders/Cofounders/www')
                           list <- list[!grepl(values$image_name, list)]
                          values$image_name <- sample(list, 1)
                           
                         })
  

  output$spu_corr <- renderUI({

      img(src = values$image_name, width = '500px')
 
})
}
# Run the application 
shinyApp(ui = ui, server = server)
