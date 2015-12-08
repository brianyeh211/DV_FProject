  require(scales)
df$year = substr(df$DATE_FIRST_HIRED, 0,4)

      df %>% group_by(GENDER, year) %>% summarise(sum=sum(CURRENT_ANNUAL_SALARY)) %>% ggplot(data=., aes(x=year, y=sum, group=GENDER, colour=GENDER)) +
        geom_line() + ylab("Current Annual Salary") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      scale_y_continuous(limits=c(0, 25000000), labels= comma)
      
      
      
      dfc <- df %>% filter(DEPARTMENT_NAME=="Sheriffs Office") %>% group_by(DIVISION, POSITION_TITLE) %>% summarise(avg = round(mean(CURRENT_ANNUAL_SALARY)), digit=0)
      

                ggplot() + 
              coord_cartesian() +
              scale_x_discrete() +
              scale_y_discrete() +
              labs(x=paste("DIVISION"), y=paste("POSITION_TITLE")) +
              layer(data=dfc, 
                    mapping=aes(x=DIVISION, y=POSITION_TITLE, label=avg), 
                    stat="identity", 
                    stat_params=list(), 
                    geom="text",
                    geom_params=list(colour="black", size = 2.5), 
                    position=position_identity()
              ) +  theme(axis.text.x = element_text(angle = 90, hjust = 1), axis.text.y = element_text(vjust=.5))

