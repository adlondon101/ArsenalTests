install.packages("worldfootballR")
library("worldfootballR")
install.packages("tidyverse")
library(worldfootballR)
arsenal_stats <- fb_team_player_stats(
  team_urls = "https://fbref.com/en/squads/18bb7c10/Arsenal-Stats",
  stat_type = "standard",
  time_pause = 3
)
View(arsenal_stats)
head(arsenal_stats)
library("tidyverse")
arsenal_stats %>% 
  drop_na(Min_Playing_Time) %>% 
  filter(Pos %in% c("FW","MF")) %>% 
  ggplot(aes(Min_Playing_Time,
             colour = Pos,
             fill = Pos))+
  geom_density(alpha = 0.9)+
  theme_bw()
mean(arsenal_stats$`G+A_minus_PK_Per_Minutes`)
mean(arsenal_stats$`G+A_minus_PK_Per_Minutes`, na.rm = TRUE)
?filter

filter(arsenal_stats, Gls >= 5)

arsenal_top_scorers <- filter(arsenal_stats, Gls >= 5) #Rename dataset for players with 5> goals

view(arsenal_top_scorers)

arsenal_stats %>% #Pipe transfers the dataset in every line
  group_by(Pos) %>% 
  summarise(mean(xG_Expected, na.rm = TRUE),
            median(xG_Expected, na.rm = TRUE))

# ggplot2 visualisation
ggplot(arsenal_stats, aes(xG_Expected))+
  geom_histogram()+
  labs(x = "Arsenal are the best") 

ggplot(arsenal_stats, aes(Mins_Per_90_Playing_Time))+
  geom_freqpoly()+
  labs(x = "Arsenal are the best") 

#Double up on the graph on on top another
ggplot(arsenal_stats, aes(Mins_Per_90_Playing_Time))+
  geom_freqpoly()+
  geom_histogram()+
  labs(x = "Arsenal are the best") 

ggplot(arsenal_stats, aes(x = xG_Expected,
                          y = Gls,
                          colour = Pos)) + 
  geom_point() +
  geom_smooth(method = lm)

