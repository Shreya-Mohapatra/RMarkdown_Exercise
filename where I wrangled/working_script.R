# ctrl + shift + enter to run whole script
# to create git repository AFTER you've already created a folder, project etc:
# tools > project options > GIT?SVN > set "version control system" to "git" 

# in case you change the username or email ID, use these to update:
# replace with new username: git config --global user.name Shreya-Mohapatra
# replace with new email: git config --global user.email 96.shreyamohapatra@gmail.com

# repo: https://github.com/Shreya-Mohapatra/RMarkdown-Exercise.git

# git remote set-url --add <https://github.com/Shreya-Mohapatra/RMarkdown-Exercise.git>

devtools::install_github("jumpingrivers/datasauRus")

library("ggplot2")
library("datasauRus")
library(tidyverse)
library(here)
library(gganimate)
library(gifski)

datasaurus_dozen

# CODE CHUNK FOR RMD - didn't work
# ```{r Knitr Dev Version, message=FALSE, warning=FALSE, include=FALSE}

# we need the dev version of knitr to be able to knit gif into a pdf
# devtools::install_github('yihui/knitr')

# ```

# --------------- NON-UNIFIED VERSION ------------

# creating plot
simple <- datasaurus_dozen %>%
  ggplot(aes(x = x, y = y, colour = dataset)) +
  geom_point() +
  theme_bw() +
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol = 3)
# viewing plot
simple
# saving plot
ggsave(here("figs", "tester.png"))

# creating animation
scatter_viz <- simple +
  transition_states(dataset,3,3) +
  ease_aes('cubic-in-out')+
  labs(title = "{closest_state}") +
  theme(plot.title = element_text(size=22,hjust = 0.5),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())
# view animation
scatter_viz
# save animation
anim_save(here("figs", "simpleanimated.gif"))

# --------------- UNIFIED VERSION ------------

# creating plot
notsosimple <- datasaurus_dozen %>% 
  ggplot(aes(x= x, y= y)) +
  geom_point() +
  theme_set(theme_bw())
# viewing plot
notsosimple
# saving plot
ggsave(here("figs", "tester2.png"))

# creating animation
scatter_viz2 <- notsosimple +
  transition_states(dataset,3,3) +
  ease_aes('cubic-in-out')+
  labs(title = "{closest_state}") +
  theme(plot.title = element_text(size=22,hjust = 0.5),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())
# view animation
scatter_viz2
# save animation
anim_save(here("figs", "notsosimpleanimated.gif"))
          