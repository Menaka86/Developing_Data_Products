library(UsingR)
library(shiny)
stormdata <- data.table(read.table("F:/Data_Science_Coursera/Developing_Data_Products/stormdata.csv"))
stormdata$Date <- as.Date(stormdata$Date)

shinyServer(
        function(input, output) {
                output$newPlot <- renderPlot({
                        year <- input$Year

                        ggplot(stormdata) +
                                geom_point(data = stormdata[DamageType == "Health"][as.numeric(format(Date, "%Y")) <= year],
                                           aes(x = Event, y = healthSums, color = EventType, size = Freq)) +
                                geom_point(data = stormdata[DamageType == "Economic"][as.numeric(format(Date, "%Y")) <= year],
                                           aes(x = Event, y = economicSums, color = EventType, size = Freq)) +
                                facet_wrap(~ DamageType, scales = "free") +
                                theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 14)) +
                                scale_fill_hue(l = 45) +
                                labs(x = "Storm Type",
                                     y = "Total Damage",
                                     title = "Total Damage per Storm Type, by type of consequence")
                })
        })