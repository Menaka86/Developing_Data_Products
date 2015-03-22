library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Damage caused by storm events across the US, from 1995-2011"),
        sidebarPanel(
                sliderInput('Year', 'Slide to see cumulative damages up to a given year',
                            value = 2005,
                            min = 1995,
                            max = 2011, step = 0001,)
        ),
        mainPanel(
                plotOutput('newPlot')
        )
))