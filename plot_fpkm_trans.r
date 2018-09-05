set.seed(12345)
library(ggplot2)
library(ggbeeswarm)
library(wesanderson)

df <- read.csv("FPKM_transcripts.csv", header=TRUE)

# To plot by expon_number
#q <- ggplot(df,aes(df$exon_n, df$cov.fpkm, color = df$Sample))+ geom_quasirandom()+ scale_x_continuous(breaks = pretty(df$exon_n, n = 35))+ scale_y_continuous(breaks = pretty(df$cov.fpkm, n = 10))

q <- ggplot(df,aes(df$transcript, df$FPKM, color = df$transcript)) + geom_quasirandom(grouponX=TRUE,alpha = 1)
q <- q  + labs(title = "Total FPKM for transcripts across all Models", x = "transcript", y = "Total FPKM") + theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 7))
q + facet_wrap(df$Sample ~ .,scales = "free",ncol = 8)
