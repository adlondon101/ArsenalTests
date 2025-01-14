?mean
5+6
?ChickWeight
a <- 5
b <- 6

a + b
sum(a,b)
ages <- c(a,b)
ages
sum(ages)
names <- c("John", "James")
friends <- data.frame(names,ages)
View(friends)
str(friends)
friends$ages
friends$names
friends[1,1]
friends[ ,1]
friends[1, ]
#Built in data sets to practice with 
data()
View(Titanic)
View(starwars)
#Install data sets to practice with 

install.packages("tidyverse")
data()
library ("tidyverse")
View(starwars)
data("tidyverse")

starwars %>% 
  filter(height>150 & mass <200) %>% 
  mutate(height_in_meters = height/100) %>% 
  select(height_in_meters , mass) %>% 
  arrange(mass) %>% 
  plot()

install.packages("tidyverse")
library(dplyr)
install.packages("dplyr")     # Installs dplyr and magrittr
view(starwars)
install.packages("tidyverse")
library(tidyverse)
view(starwars)
starwars %>% 
  filter(height>150 & mass <200) %>% 
  mutate(height_in_meters = height/100) %>% 
  select(height_in_meters , mass) %>% 
  arrange(mass) %>% 
  #view()
  plot()

view(msleep)
glimpse(msleep)
head(msleep)
class(msleep$name)
names(msleep)
unique(msleep$vore)
missing <- !complete.cases(msleep)

msleep[missing,]
#Clean 
starwars %>% 
  select(name,height, mass)
starwars %>% 
  select(name,mass,height,everything())
install.packages("tidyverse")
library(tidyverse)
starwars %>% 
  select(name,height, mass)
starwars %>% 
  select(name,height, mass, eye_color,everything())
starwars %>% 
  select(name,height, mass, eye_color,everything())
starwars %>% 
  select(name,height, mass, eye_color,everything()) %>% 
  head()
starwars %>% 
  rename("characters" = "name") %>% 
  head()
#Rename field
starwars %>% 
  rename("characters" = "name") %>% 
  head()

#Changing variable type 
class(starwars$hair_color)
starwars$hair_color <- as.factor(starwars$hair_color)
class(starwars$hair_color)
starwars %>% 
  mutate(hair_color=as.character(hair_color)) %>% 
  glimpse()
starwars %>% 
  select(mass,sex) %>% 
  filter(mass < 55 & sex=="male")
starwars %>% 
  select(sex) %>% 
  mutate(sex = recode(sex, 
                      "male" = "man",
                      "female" = "woman"))
#Dealing with missing data 
mean(starwars$height, na.rm = TRUE)

#Reshape data with pivot 
library(gapminder)
library(world_bank_pop)
install.packages("tidyverse")
library(gapminder)
data()
View(women)
install.packages("dplyr")
data()
View(volcano)
View(euro)

plot(pressure)

#Grammer of graphics 
#Data
#Mapping
#geometry
ggplot(data = starwars,
       mapping = aes(x = gender))+
  geom_bar()
install.packages("tidyverse")
library(tidyverse)
ggplot(data = starwars,
       mapping = aes(x = gender))+
  geom_bar()
starwars %>% 
  drop_na(height) %>% 
  filter(sex %in% c("male","female")) %>% 
  ggplot(aes(height,
             colour = sex,
             fill = sex))+
  geom_density(alpha = 0.9)+
  theme_bw()
library(worldfootballR)
data()
