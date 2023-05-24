# #TidyTuesday | 2023-05-16 | Tornados
# Data Source is NOAA's National Weather Service Storm Prediction Center

# Installing Packages-----------------------------------------------------
install.packages('tidyverse')
install.packages('tidytuesdayR')
install.packages('ggplot2')


# libraries ---------------------------------------------------------------
library(tidyverse)
library(tidytuesdayR)
library(ggplot2)

# load data ---------------------------------------------------------------
tuesdata <- tidytuesdayR::tt_load(2023, week = 20)

tornados <- tuesdata$tornados


# Create a line plot of loss over time, excluding NA values
loss_data_clean <- na.omit(tornados)

# Calculate the minimum and maximum values, excluding NA values
min_year <- min(loss_data_clean$yr)
max_year <- max(loss_data_clean$yr)

# Calculate the breaks for the x-axis
breaks <- seq(min_year, max_year, by = 10)

ggplot(data = loss_data_clean, aes(x = yr, y = loss)) +
  geom_line(color = "steelblue", size = 1.5) +
  geom_point(color = "steelblue", size = 3) +
  labs(x = "Year", y = "Loss", title = "Loss Over Time") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14, face = "bold"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = breaks) +
  scale_y_continuous(labels = scales::comma) +
  geom_smooth(method = "lm", se = FALSE, color = "darkorange", linetype = "dashed")

