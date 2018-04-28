### Combine and obesity and fast food maps
## to see if there is a correlation

library(dplyr)
library(maps)
library(ggplot2)
library(mapproj)
library(ggmap)
library(fiftystater)
library(tidyr)

obese_map = read.csv("scrub_obese.csv")
new_obese = obese_map %>%
  separate(col = Locator, 
           into = c("lon", "lat"),
           sep="," ,
           remove = T)

new_obese$LocationDesc = tolower(new_obese$LocationDesc)

j <- ggplot(new_obese, aes(map_id = LocationDesc)) + 
  geom_map(aes(fill = BMI), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  scale_fill_gradient(low = "gray",
                      high = "darkblue") +
  labs(x = "", y = "") +
  theme(legend.position = "bottom", 
        panel.background = element_blank())

j + fifty_states_inset_boxes() 
