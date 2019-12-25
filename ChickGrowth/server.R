#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    
 # Boxplot for Chicks with different diet at certain time
    output$growthplot1 <- renderPlot({

    data_time <- reactive({ChickWeight %>% filter(Time==input$time)})
    
    ggplot(data_time(), aes(Diet, weight))+
        geom_boxplot()+
        geom_point(position=position_jitter(0.2))+
        xlab("Diet Type")+
        ylab("Chick Weight (mg)")+
        ggtitle("Boxplot for the weight of chicks with different diet")
    })
    
    #lineplot for chick growth with different diet
    output$growthplot2 <- renderPlot({
        data_avg <- ChickWeight %>% group_by(Diet,Time) %>% summarise(avg_wt=mean(weight)) %>% ungroup()
        data_avg1 <- data_avg %>% filter(Diet==input$diet)
        ggplot(data_avg1, aes(Time,avg_wt, color=factor(Diet)))+
            geom_point()+
            geom_smooth()+
            xlab("Diet Type")+
            ylab("Average Chick Weight (mg)")+
            ggtitle("Lineplot for the weight of chicks with different diet")
        
    })
    
})
