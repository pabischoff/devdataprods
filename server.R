library(shiny)
library(googleVis)
library(maptools)
library(ggmap)
library(grDevices)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      #import data
      population <- read.csv("population.csv", header=TRUE, sep=",")
      coordinates <- read.csv("coordinates.csv", header=TRUE, sep=",")
      
      population$Poblacion <- as.numeric(population$Poblacion)
      
      #create map
      mapimage <- get_map(location = c(long = -66.59, lat = 18.22), zoom = 8, source = "google", 
                          maptype="roadmap")

      # put coordinates into population dataset
      population$x_long <- coordinates$x_long[match(population$Municipio, coordinates$municipio)]
      population$y_lat <- coordinates$y_lat[match(population$Municipio, coordinates$municipio)]
      
      #render the plot
      output$map <- renderPlot({
            
            ggmap(mapimage, legend = "bottomleft") +
                  coord_fixed(xlim = c(-67.5, -64.8), ylim =c(17.8, 18.6)) +
                  geom_point(data=population[population$An.o==input$year,], 
                             aes(x = x_long, y = y_lat, size = Poblacion/969*10, 
                                 color = Poblacion*-1), alpha = .5) +
                  labs(color="Population (thousands)") +
                  scale_size(range = c(1, 10), guide='none')            
       })
})


#Historical data of the population of Puerto Rico by municipalities.
#Since 1899 to 2010. The information is organized in a cross-tabulation.
#Population censuses conducted by the US Department of War and the US Census Bureau.
#Based on data collected and base published by the Graduate Program
#in Demography of the Medical Sciences Campus of the University of Puerto Rico.