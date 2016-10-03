library(shiny)
library(ANLP)
modelsList = readRDS("ngramodels.RDS")
shinyServer(function(input, output, session) {
   observe({
    text <- reactive({input$text})
    predictions <- predict_Backoff(text(),modelsList)
 
    output$prediction1 <- renderUI({actionButton("button1", label = predictions)})
  })
  
})
