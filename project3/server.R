#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        cars <- mtcars
        
        cy <- switch(input$cyl,
                       four = 4,
                       six = 6,
                       eight = 8)
        
        if (input$auto) {
            auto <- subset(cars, am == 0 & cyl == cy)
        }
        if (input$manl) {
            manl <- subset(cars, am == 1 & cyl == cy)
        }
        
        x_lim <- c(min(cars$wt), max(cars$wt))
        y_lim <- c(min(cars$mpg), max(cars$mpg))
        
        if (input$auto && input$manl) {
            plot(auto$wt, auto$mpg, col="red", xlim=x_lim, ylim=y_lim, xlab="Weight", ylab="MPG")
            points(manl$wt, manl$mpg, col="blue")
        }
        else if (input$auto) {
            plot(auto$wt, auto$mpg, col="red", xlim=x_lim, ylim=y_lim, xlab="Weight", ylab="MPG")
        }
        else if (input$manl) {
            plot(manl$wt, manl$mpg, col="blue", xlim=x_lim, ylim=y_lim, xlab="Weight", ylab="MPG")
        }
        else {
            plot(0, 0, col="blue", xlim=x_lim, ylim=y_lim, xlab="Weight", ylab="MPG")
        }

    })

})
