set.seed(12345)
library(ggplot2)
library(ggbeeswarm)
library(wesanderson)

df <- read.csv("ATRX_exon_coverage_NBLsamples.csv", header=TRUE)

# To plot by expon_number
#q <- ggplot(df,aes(df$exon_n, df$cov.fpkm, color = df$Sample))+ geom_quasirandom()+ scale_x_continuous(breaks = pretty(df$exon_n, n = 35))+ scale_y_continuous(breaks = pretty(df$cov.fpkm, n = 10))

q <- ggplot(df,aes(df$exon_n, df$cov.fpkm, color = df$Sample)) + geom_quasirandom(grouponX=TRUE,alpha = 0.8)+ scale_x_continuous(breaks = pretty(df$exon_n, n = 34)) + scale_y_continuous(breaks = pretty(df$cov.fpkm, n = 10))
q <- q  + labs(title = "Coverage for transcripts across all samples", x = "exon number", y = "Coverage") + theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 7))
q + facet_grid(df$transcript ~ .,scales="free")
