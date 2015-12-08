#!/usr/bin/env Rscript

require(ggplot2)
require(tikzDevice)

data <- read.csv("throughput.csv")

nps <- function(d) { d * 1000000 / 3600 }

tikz("../../throughput.tex",width=5,height=5)

ggplot(data=data, aes(x=threads, y=nps(mph),
       group=parser, shape=parser)) +
  geom_line(size=0.5) + geom_point(size=3) +
  xlab("CPU Threads") + ylab("Names/Second") +
  scale_shape_discrete(name="Parser",
                       breaks=c("gnparser","biodiversity","gbif-parser")) +
  scale_x_discrete(breaks=seq(0,13,2)) +
  theme(
      legend.key = element_rect(fill = "white"),
      legend.background = element_rect(fill = "white", color="black", size=0.3),
      legend.position = c(0.8,0.35),
      panel.grid.major = element_line(colour = "white"),
      axis.line = element_line(colour = "black"),
      axis.ticks = element_line(colour = "black"),
      axis.text = element_text(colour = "black", size = 10),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white")
    )
dev.off()
