#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

shinyUI(fluidPage(

    titlePanel("Chick Growth Data"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("time",
                        "Age of Chicks (day)",
                        min = 0,
                        max = 21,
                        value = 0),
     
            checkboxGroupInput("diet", "Diet type:",
                          c("Diet 1"=1, "Diet 2"=2,"Diet 3"=3, "Diet 4"=4), selected = c(1,2,3,4))
                     ),
        
        mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("User Guide", 
                            h3("This app is to investigate the impact of diet on chick growth"),
                            h5("The data frame chickweight is from R and has 578 rows and 4 columns from an experiment on the effect of diet on early growth of chicks."),
                            h5("In tab of Box Plot, move the slider in the left side panel to see the weight of chicks at each selected day."),
                            h5("In tab of Line Plot, choose one or more diet types in the left side panel to see the chick growth with different diet types.")
                       ),
                        tabPanel("Box Plot", br(), plotOutput("growthplot1")),
                        tabPanel("Line Plot", br(), plotOutput("growthplot2"))
            
                )
            )
    )))
