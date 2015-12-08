#ui.R

require(shiny)
require(shinydashboard)
require(leaflet)

dashboardPage(
  dashboardHeader(
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Crosstab", tabName = "crosstab", icon = icon("dashboard")),
      menuItem("Line Chart", tabName = "linechart", icon = icon("th")),
      menuItem("Barchart", tabName = "barchart", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "crosstab",
        textInput(inputId = "title", 
                  label = "Crosstab Title",
                  value = "Overtime Ratio (High/Low)"),
        actionButton(inputId = "clicks1",  label = "Click me"),
        plotOutput("distPlot1")
      ),
      
      # Second tab content
      tabItem(tabName = "linechart",
        actionButton(inputId = "clicks2",  label = "Click me"),
        plotOutput("distPlot2")
      ),
      
      # Third tab content
      tabItem(tabName = "barchart",
        actionButton(inputId = "clicks3",  label = "Click me"),
        plotOutput("distPlot3")
      )
    )
  )
)
  