

library(quantmod)
library(xts)
library(lubridate)
Sys.setlocale("LC_ALL","English")





shinyServer(
        function(input, output) {
                output$chart <- renderPlot({ years<- input$years
                                             Stock <- input$Stock
                                             today <- Sys.Date()
                                             start <- today - years(years)
                                             n <- input$n
        
                                             
                                                validate(
                                                             need(nrow(getSymbols( Stock, from = start , to = today, src = "yahoo" , env=NULL))  > 30, 
                                                                       label = "The Stock that you have chosen has beend traded for less than 30 days which is too short a time period to look for trends. This is probably because this Stock has just recently entered the NASDAQ. Please choose another Stock to play with the ADX parameter"))
                                                ts <- getSymbols( Stock, from = start , to = today, src = "yahoo" , env=NULL)
                                             chartSeries(ts, theme=chartTheme("white"), cex.lab=2)
                                             addADX( n = n)
                                             
                })
                
        }
)