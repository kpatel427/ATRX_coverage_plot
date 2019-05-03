set.seed(12345)
library(ggplot2)
library(ggbeeswarm)
library(plotly)
library(ggforce)

#install.packages("plotly")

df <- read.table("2018-11-13_FPKM_3_transcripts_per_exon.txt", header=TRUE, sep = "\t")

# To plot by expon_number
#q <- ggplot(df,aes(df$exon_n, df$cov.fpkm, color = df$Sample))+ geom_quasirandom()+ scale_x_continuous(breaks = pretty(df$exon_n, n = 35))+ scale_y_continuous(breaks = pretty(df$cov.fpkm, n = 10))


p <- ggplot(df,aes(df$exon_name, df$FPKM, color = transcript)) + 
  geom_bar(aes(fill = transcript), stat = "identity") +
  #geom_line(alpha = 0.8) +
  #geom_point(size = 0.8) + 
  #scale_x_continuous(breaks = pretty(df$exon_name, n = 36)) +
  scale_y_continuous(breaks = pretty(df$FPKM, n = 5)) +
  theme_bw() +
  labs(title = "FPKM for exons in transcripts across all Models", x = "exon number", y = "FPKM") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 7)) +
  theme(axis.text = element_text(size=7))+  
  facet_grid_paginate(df$transcript ~ df$Model, scales = "fixed", ncol = 4 , nrow = 8) + 
  theme(strip.text.y = element_blank())


# total number of Models = 228
n_pages_needed = 57
pdf("2018-12-03-all-pdx-3-Tx-ATRX.pdf", width=11, height=7)

for (i in seq_len(n_pages_needed)) {
print(ggplot(df,aes(df$exon_name, df$FPKM, group = transcript, color = transcript)) +
  geom_bar(aes(fill = transcript), stat = "identity") +
  scale_y_continuous(breaks = pretty(df$FPKM, n = 10)) +
  theme_bw()+
  labs(title = "FPKM for exons in transcripts across all Models", x = "exon name", y = "FPKM") + 
  theme(axis.text = element_text(size=7), axis.text.x = element_blank())+  
  theme(legend.text=element_text(size=10)) +
  facet_grid_paginate(df$transcript ~ df$Model, scales = "fixed", ncol = 4 , nrow = 3, page = i) + 
  theme(strip.text.y = element_blank()) )
  
# Save as PDF
#ggsave(paste0(Sys.Date(),"-all-pdx-ATRX.pdf"), p, width=45, height=20, units = "cm")

}
dev.off()



#-------------------------------- FPKM vs exon_number for all Models ----------------------------------#
data <- read.delim("2018-11-13_FPKM_3_transcripts_per_exon.txt")
options(scipen = 999)
# Number of Models 
length(unique(data$Model))


# total number of Models = 228
n_pages_needed = 76
pdf("2019-02-08-ALL-PDX-FPKM-exon-number-ATRX.pdf", width=20, height=9)

for (i in seq_len(n_pages_needed)) {
  print(ggplot(data,aes(data$exon_n, data$FPKM, group = transcript, color = transcript)) +
          geom_bar(aes(fill = transcript), stat = "identity", width = 0.5) +
          geom_hline(aes(yintercept = 1),linetype = "dashed") +
          scale_x_continuous(breaks = pretty(data$exon_n, n = 36)) +
          theme_bw() +
          labs(title = "FPKM for exons in all PDX models", x = "exon number", y = "FPKM") + 
          theme(legend.text=element_text(size=15), 
                axis.title.x = element_text(size=15), 
                axis.title.y = element_text(size=15),
                plot.title = element_text(hjust = 0.5,size = 20), 
                legend.title = element_text(size=15)) +
          facet_grid_paginate(data$transcript ~ data$Model, scales = "fixed", ncol = 3 , nrow = 3, page = i) + 
          theme(strip.text.x = element_text(size = 12)) +
          theme(strip.text.y = element_blank()) )
  
}
dev.off()




#for interactive plots
plotly::ggplotly(q)
