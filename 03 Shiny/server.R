# server.R
require("jsonlite")
require("RCurl")
require(ggplot2)
require(dplyr)
require(shiny)
require(shinydashboard)
require(leaflet)
require(DT)
require(scales)

shinyServer(function(input, output) {
    
      df1 <- eventReactive(input$clicks1, {data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", 'skipper.cs.utexas.edu:5001/rest/native/?query=
"select Division, POSITION_TITLE, round(avg(Current_annual_salary),0) as avg 
from Salary
where department_name = \\\'Sheriffs Office\\\'
group by Division, Position_Title;"
')), httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_by2578', PASS='orcl_by2578', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', verbose = TRUE))))
      })
      output$distPlot1 <- renderPlot(height=750, width=1500, {             
            plot <- ggplot() + 
              coord_cartesian() +
              scale_x_discrete() +
              scale_y_discrete() +
              labs(x=paste("DIVISION"), y=paste("POSITION_TITLE")) +
              layer(data=df1(), 
                    mapping=aes(x=DIVISION, y=POSITION_TITLE, label=AVG), 
                    stat="identity", 
                    stat_params=list(), 
                    geom="text",
                    geom_params=list(colour="black", size = 8), 
                    position=position_identity()
              ) +
              theme(axis.text.x = element_text(angle = 90, hjust = 1), axis.text.y = element_text(vjust=.5))
              
            plot 
      }) 

      observeEvent(input$clicks, {
            print(as.numeric(input$clicks))
      })

# Begin code for Second Tab:

      df2 <- eventReactive(input$clicks2, {data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", 'skipper.cs.utexas.edu:5001/rest/native/?query=
"select GENDER, yr, round(sum(Current_Annual_salary),0) as sum 
from salary
group by GENDER, yr;"
')), httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_by2578', PASS='orcl_by2578', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', verbose = TRUE))))
        })

      output$distPlot2 <- renderPlot(height=750, width=1500, {
            plot2 <- ggplot() + 
              coord_cartesian() + 
              scale_x_discrete() +
              scale_y_continuous(limits=c(0, 25000000), labels= comma) +
              labs(title='Current Annual Salary - By Year Hired') +
              labs(x="YEAR", y=paste("Current Annual Salary")) +
              layer(data=df2(), 
                    mapping=aes(x=YR, y=SUM, color=GENDER), 
                    stat_params=list(), 
                    geom="line",
                    geom_params=list(), 
                    position=position_identity()
              ) +
              theme(axis.text.x = element_text(angle = 90, hjust = 1))
            
              plot2
      })

# Begin code for Third Tab:

      df3 <- eventReactive(input$clicks3, {data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", 'skipper.cs.utexas.edu:5001/rest/native/?query=
"SELECT Range, Count(Full_Name) As Count
FROM Salary
Group By Range;"
')), httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_by2578', PASS='orcl_by2578', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', verbose = TRUE))))
      })
      output$distPlot3 <- renderPlot(height=750, width=1500, {
            plot3 <- ggplot() + 
              coord_cartesian() + 
              scale_x_discrete() +
              scale_y_discrete() +
              labs(title='Histogram Current Annual Salary') +
              labs(x="RANGE", y="COUNT") +
              layer(data=df3(), 
                    mapping=aes(x=RANGE, y=COUNT), 
                    stat = "identity",
                    stat_params=list(), 
                    geom="histogram",
                    geom_params=list(),
                    position=position_identity()
              ) +
              geom_vline(yintercept=245.945)
              plot3
      })
})