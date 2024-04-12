
# Modified from Data Profesor, 
####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)


# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  theme = "cerulean","My first app for fossils",),  # <--- To use a theme, uncomment this
                  
                  tabPanel("Fossil species",
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", "Genus:", ""),
                             textInput("txt2", "Species:", ""),
                             
                           ), # sidebarPanel
                           mainPanel(
                             h1("Fossils"),
                             
                             h4("The scientific name"),
                             verbatimTextOutput("txtout"),
                             
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  
                
                  
                  tabPanel("Fossil localities",
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", "Location:", ""),
                             textInput("txt2", "coordinates:", ""),
                             
                           ), # sidebarPanel
                         
                             mainPanel(
                             h1("Fossils locations"),
                             
                             h4("Geography"),
                             verbatimTextOutput("txtout"),
                             
                           ),
                  
                  
                 
                  
                ) # navbarPage
      )

# Define server function  
server <- function(input, output) {
  
  output$txtout <- renderText({
    paste( input$txt1, input$txt2, sep = " " )
  })
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)
