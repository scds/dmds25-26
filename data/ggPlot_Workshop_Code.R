install.packages("tidyverse")

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

#if you want to add your own excel file:
example <-read_csv(“/users/subhanya/Desktop/filename.csv”)

#Cars Plot
view(mtcars)
head(mtcars)

mtcars_viz <- ggplot(data=mtcars, aes(x=wt,y=mpg, color=qsec)) +
  geom_point(aes(color = qsec), size=4)+
  
#Adds a Trendline over existing plot
  geom_smooth(linewidth=5)+ 
  labs(title="Comparing Car Weights to MPG", subtitle="Looking from Years 2000-2015", y="Miles Per Gallon")

#we have to run this separately to display the plot
mtcars_viz

#Making a Bar Graph

bar <- ggplot(data = mpg, aes(x = class)) +
  geom_bar(aes(fill = class)) +
  labs(
    title = "Types of Vehicles",
    subtitle = "From fuel economy data for popular car models (1999-2008)",
    x = "Vehicle Class",
    y = "Count",
    fill = "Types of Cars"
  )

bar

#Making a Stacked Bar Graph

bar <- ggplot(data = mpg, aes(x = class, fill = trans)) +
  geom_bar(position = "stack") + #try changing position to “dodge” instead 
  scale_fill_manual(
    values = c(
      "red", "purple", "pink", "blue", "grey",
      "black", "white", "navy", "lavender", "wheat"
    )
  ) +
  labs(
    title = "Types of Vehicles",
    subtitle = "From fuel economy data for popular car models (1999-2008)",
    x = "Vehicle Class",
    y = "Count",
    fill = "Transmission Type"
  )

bar

#HeatMap (is good for categorical and quantitative data) diamonds dataset has a mix of both 

head(diamonds)
di_viz <- ggplot(diamonds,aes(x=cut, y=color)) +
  geom_bin_2d() +
  
  scale_fill_gradient(low="white", high="purple")
di_viz

#adding some extra elements

view(txhousing)

#we will start by filtering what we want
Dallas_Sales <- filter(txhousing, city == "Dallas")

#now building the plot
Dallas_Viz <- ggplot(Dallas_Sales, aes(x = year, y = sales)) +
  geom_point() +
  geom_smooth() +
  labs(
    title = "Dallas House Sales from 2000-2015",
    subtitle = "Analyzing Housing Trends",
    x = "Year",
    y = "Number of Sales"
  )

Dallas_Viz

#Final Graph Display

Dallas_Sales <- filter(txhousing, city == "Dallas")

ggplot(Dallas_Sales, aes(x = year, y = sales)) +
  # 1. Base Data Layers
  geom_point(position = "jitter", alpha = 0.4, color = "steelblue") +
  geom_smooth(color = "darkblue", se = FALSE) +
  
  # 2. Reference Line & Annotation
  geom_vline(xintercept = 2008, linetype = "dashed", color = "firebrick") +
  annotate("text", x = 2008.5, y = 2800, label = "2008 Recession", color = "firebrick", hjust = 0) +
  annotate("rect", xmin = 2007, xmax = 2009, ymin = -Inf, ymax = Inf, alpha = 0.2, fill = "yellow") + # Highlight band
  
  # 3. Scales & Labels
  scale_x_continuous(breaks = seq(2000, 2015, by = 2)) +
  labs(
    title = "Dallas House Sales (2000–2015)",
    subtitle = "Monthly sales volume with 2008 economic benchmark",
    x = "Year",
    y = "Monthly Sales Count"
  ) +
  
  # 4. Theme Formatting
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    panel.background = element_rect(fill = "#FFE4E1", color = NA), #Removes the border line around the rectangle so there is no dark outline edge around the plot.
    panel.grid.major = element_line(color = "white"), 
    panel.grid.minor = element_blank() #removes minor grid lines and just keeps main ones
  )

Dallas_Sales