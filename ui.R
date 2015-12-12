

library(quantmod)
Stocks <- stockSymbols(exchange = c("NASDAQ"), quiet = FALSE)$Symbol

shinyUI(fluidPage(
        
        titlePanel("Effect of ADX's 'amount of periods' parameter in time series trend detection"),
       
        plotOutput('chart'),
        
        hr(),
        
        fluidRow(
                column(10,
                        h6(
                          "The blue line indicates the presence of a trend, the green the presence of a positive trend and the red the presence of a negative trend. These lines are computed using an algorithm called ADX. The higher the line in the graph, the stronger the trend in the time series. Play around with the parameter that defines the amount of periods considered in ADX calculations to see how the ADX lines change. You can use Nasdaq Stock prices' time series which are btw downloaded live as you use this App")
                       )),
        
        fluidRow(
                column(4,
                       h5("How many years to analyse?"),
                       sliderInput('years', '',  
                                   min=1, max=10, value=1, step=1)),
                       
                column(4, offset = 0.5, h5("Periods in ADX exponential moving average."
                                          ),
                       sliderInput('n', '', 
                                   min=1, max=40, value=14 , step=1)),
                column(4, offset = 0.5, h5("Select a Stock's Symbol from the dropdown or write the a Stock's ticker in the box below. Only Nasdaq US is currenlty supported"),
                       selectInput('Stock', '', c(Stocks), selected = 'GOOG')
                       )

                )
        ))
