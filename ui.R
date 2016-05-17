library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
      
      # Application title
      titlePanel("Population of Puerto Rican cities, 1899-2010"),
      
      
      # Sidebar with a slider input for the number of bins
      sidebarLayout(
            sidebarPanel(
                  selectInput("year","Year",c("1899"=1899,"1910"=1910,"1920"=1920,
                                              "1930"=1930,"1935"=1935,"1940"=1940,
                                              "1950"=1950,"1960"=1960,"1970"=1970,
                                              "1980"=1980,"1990"=1990,"2000"=2000,
                                              "2010"=2010)
                              ),
                  h3("Documentation"),
                  p("This map graphically displays the population of cities in Puerto Rico by year. Select a year from the dropdown menu above to reload the map."),
                  a("Github", href="https://github.com/pabischoff/devdataprods")
            ),
            
            # Show a plot of the generated distribution
            mainPanel(
                  plotOutput("map"),
                  p("Historical data of the population of Puerto Rico by municipalities.Since 1899 to 2010. The information is organized in a cross-tabulation. Population censuses conducted by the US Department of War and the US Census Bureau. Based on data collected and base published by the Graduate Program in Demography of the Medical Sciences Campus of the University of Puerto Rico."),
                  p("Sources:"),
                  p("https://datahub.io/dataset/poblacion-de-puerto-rico-1899-2010"),
                  p("https://datahub.io/dataset/coordenadas-geograficas-de-los-municipios-de-puerto-rico")
            )
                  )
))