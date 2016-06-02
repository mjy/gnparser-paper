#!/usr/bin/env Rscript

require(ggplot2)
require(tikzDevice)
require(grid)

data <- read.csv("throughput.csv")

nps <- function(d) { d * 1000000 / 3600 }

tikz("../../throughput.tex",width=4.5,height=4.5)

ggplot(data=data, aes(x=threads, y=nps(mph),
       group=parser, shape=parser)) +
  geom_line(size=0.5) + geom_point(size=3) +
  xlab("CPU Threads") + ylab("Names/Second") +
  scale_shape_discrete(name="Parser",
                       breaks=c("gnparser", "gbif-parser", "biodiversity")) +
  scale_x_continuous(breaks = c(2, 4, 6, 8, 10, 12)) +
  scale_y_continuous(limits = c(0,37000),
                     breaks = c(0, 10000, 20000, 30000, 37000)) +
  theme(
      legend.key = element_rect(fill = "white"),
      legend.background = element_rect(fill = "white", color="black", size=0.3),
      legend.position = c(0.8,0.35),
      panel.grid.major = element_line(colour = "white"),
      axis.line.x = element_line(colour = "black"),
      axis.line.y = element_line(colour = "black"),
      axis.title.y = element_text(vjust = 1, margin=margin(0,10,0,0)),
      axis.ticks = element_line(colour = "black"),
      axis.text = element_text(colour = "black", size = 10),
      # panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white")
    )
dev.off()
