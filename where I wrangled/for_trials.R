
DatasaurusDozen <- read.table(here("data", file = 'DatasaurusDozen.tsv'))

DD <- DatasaurusDozen %>% subset(DatasaurusDozen$V1 != "dataset")
p <- DD %>% 
  ggplot(aes(x= `V2`, y= `V3`)) +
  geom_point() +
  theme_set(theme_bw())
p

scatter_viz <- p +
  transition_states(V1,3,3) +
  ease_aes('cubic-in-out')+
  labs(title = "{closest_state}") +
  theme(plot.title = element_text(size=22,hjust = 0.5),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())
scatter_viz
anim_save(here("figs", "DD.gif"))

a_gif <- animate(box_viz, width = 350, height = 350)
b_gif <- animate(scatter_viz, width = 350, height = 350)
c_gif <- animate(bar_viz, width = 350, height = 350)

a_mgif <- image_read(a_gif)
b_mgif <- image_read(b_gif)
c_mgif <- image_read(c_gif)

new_gif <- image_append(c(a_mgif[1], b_mgif[1],c_mgif[1]))
for(i in 2:100){
  combined <- image_append(c(a_mgif[i], b_mgif[i],c_mgif[i]))
  new_gif <- c(new_gif, combined)
}

new_gif