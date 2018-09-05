set.seed(12345)
library(ggplot2)
library(ggbeeswarm)
library(plotly)

#install.packages("plotly")

df <- read.csv("FPKM_transcripts_per_exon_1.csv", header=TRUE)

# To plot by expon_number
#q <- ggplot(df,aes(df$exon_n, df$cov.fpkm, color = df$Sample))+ geom_quasirandom()+ scale_x_continuous(breaks = pretty(df$exon_n, n = 35))+ scale_y_continuous(breaks = pretty(df$cov.fpkm, n = 10))

q <- ggplot(df,aes(df$exon_n, df$FPKM, color = df$transcript)) + 
  geom_line(alpha = 0.8) +
  geom_point(size = 0.8) + scale_x_continuous(breaks = pretty(df$exon_n, n = 35)) 
q <- q  + labs(title = "FPKM for exons in transcripts across all Models", x = "exon number", y = "FPKM") + theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 5.5))
q <- q + facet_wrap(. ~df$Model, ncol = 5) + theme_bw(base_size = 9)
q

#for interactive plots
plotly::ggplotly(q)
