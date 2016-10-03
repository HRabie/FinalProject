library(shiny)
library(shinythemes)

shinyUI(
navbarPage("", theme = shinytheme("spacelab"),
  tabPanel(HTML(""),
                            
fluidRow(
column(5),column(10,tags$head(), tags$div(

  h1("Prediction of Next word, Final Course Project")
  ,
 tags$textarea(id = 'text', placeholder='Enter your text here',rows=2, class='form-control',""),
   HTML("<div id='buttons'>"),
   uiOutput("prediction1",inline = T)
 ),
   HTML("</div>"),align="center"), column(3))),
                   

hr(h2("By:Hassan Rabie"),h4("3rd-October, 2016")),
tags$span(h4("Due to the ram memory constraint, I build the prediction model only on 1% from the data files"))
                   
                   ))
