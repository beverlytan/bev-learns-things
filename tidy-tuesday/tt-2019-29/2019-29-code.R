# Tidy Tuesday: week 29, 2019
# Dataset: R4DS Membership

# Load packages
library(tidyverse)

# Load data
r4ds_members <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-16/r4ds_members.csv")

# Explore data
View(r4ds_members)

# Line plots of membership stats over time
(ggplot(r4ds_members, aes(x = date, y = total_membership)) + 
    geom_line() +
    theme_bw())

# I want everything on the same plot 

str(r4ds_members)

r4ds_members_clean <- r4ds_members %>%
  select(date, total_membership, daily_active_members, 
         daily_members_posting_messages) %>%
  gather("type", "value", 2:4)

(ggplot(r4ds_members_clean, aes(x = date, y = value)) + 
    geom_line(aes(colour = type)) +
    theme_bw())

