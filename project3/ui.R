#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Comparing Motor Vehicles"),
    
    p("This widget displays vehicle data in an interactive manner and allows the user to compare automatic and transmission MPG and weight factors with their cylinders as indepent variables."),
    p("To use this app select from the checkboxes and radio buttons to modify what is displayed on the graph. The checkboxes include selection for automatic and manual transmission vehicles, the radio buttons are for the number of cylinders in the vehicles. Different selection will graph different data points onto the screen."),
    
    sidebarLayout(
        sidebarPanel(
            checkboxInput("auto", "Automatic", FALSE),
            checkboxInput("manl", "Manual", FALSE),
            radioButtons("cyl", "Cylinders: ",
                         c("four" = "four",
                           "six" = "six",
                           "eight" = "eight"))
        ),
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
