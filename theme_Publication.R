theme_Publication <- function(base_size=6, base_family="sans") {
  library(grid)
  library(ggthemes)
  (theme_foundation(base_size=base_size, base_family=base_family)
    + theme(plot.title = element_text(face = "bold",
                                      size = rel(1.33), hjust = -0.05),
            text = element_text(size=base_size),
            panel.background = element_rect(colour = NA),
            plot.background = element_rect(colour = NA),
            panel.border = element_rect(colour = NA),
            axis.title = element_text(size = base_size+1),
            axis.title.y = element_text(angle=90,vjust =2),
            axis.title.x = element_text(vjust = -0.2),
            axis.text = element_text(size=base_size), 
            axis.line = element_line(colour="black"),
            axis.ticks = element_line(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            legend.key = element_rect(colour = NA),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.key.size= unit(0.2, "cm"),
            legend.margin =  ggplot2::margin(0,0,0,0,"mm"),
            legend.title = element_text(size=base_size),
            plot.margin=unit(c(10,5,5,5),"mm"),
            strip.background=element_rect(colour="#f0f0f0",
                                          fill="#f0f0f0"),
            strip.text = element_text(face="bold")
    ))
}

scale_fill_Publication <- function(...){
  library(scales)
  discrete_scale("fill","Publication",
                 manual_pal(values =   c("#386cb0","#fdb462","#7fc97f",
                                         "#ef3b2c","#662506","#a6cee3",
                                         "#fb9a99","#984ea3","#ffff33")),...)
}

scale_colour_Publication <- function(...){
  library(scales)
  discrete_scale("colour","Publication",
                 manual_pal(values = c("#386cb0","#fdb462","#7fc97f",
                                       "#ef3b2c","#662506","#a6cee3",
                                       "#fb9a99","#984ea3","#ffff33")), ...)
}