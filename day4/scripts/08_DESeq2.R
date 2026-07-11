# =============================================================
# Differential Gene Expression Analysis with DESeq2
# Teaching example using the built-in "airway" RNA-seq dataset
# =============================================================
# The airway dataset: RNA-seq of 4 human airway smooth muscle
# cell lines, each treated with dexamethasone vs untreated.
# It is the standard teaching dataset for DESeq2.
# =============================================================

# ---- Packages ----
# Install once (Bioconductor). airway ships the example counts.
# BiocManager::install(c("DESeq2", "airway"))

library(DESeq2)
library(airway)
library(tidyverse)

# ---- 1. Load the example data ----
data("airway")
airway

# Set "untrt" (untreated) as the reference level so that
# log2 fold changes are treated vs untreated.
airway$dex <- relevel(airway$dex, ref = "untrt")

# Peek at the sample information (the design table)
colData(airway)

# Peek at the raw count matrix (genes x samples)
head(assay(airway))

# ---- 2. Build the DESeqDataSet ----
# design = ~ dex  -> compare treated vs untreated
dds <- DESeqDataSet(airway, design = ~ dex)

# ---- 3. Pre-filter low-count genes ----
# Keep genes with at least 10 reads total. Speeds things up and
# removes noise from genes with almost no data.
keep <- rowSums(counts(dds)) >= 10
dds  <- dds[keep, ]

# ---- 4. Run the DESeq2 pipeline ----
# This one call does: size-factor normalization, dispersion
# estimation, and the negative-binomial Wald test.
dds <- DESeq(dds)

# ---- 5. Extract results ----
res <- results(dds, contrast = c("dex", "trt", "untrt"))

# Order by adjusted p-value (most significant first)
res <- res[order(res$padj), ]

# Summary of up / down regulated genes at FDR < 0.1
summary(res)
head(res)

# How many genes pass FDR < 0.05 ?
sum(res$padj < 0.05, na.rm = TRUE)

# ---- 6. Shrink log2 fold changes ----
# Shrinkage gives more reliable fold-change estimates for ranking
# and for the MA plot (pulls noisy low-count genes toward zero).
resLFC <- lfcShrink(dds, coef = "dex_trt_vs_untrt", type = "apeglm")

# ---- 7. Save the results table ----
res_df <- as.data.frame(res) |>
  rownames_to_column("gene_id")

write.csv(res_df,
          "results/tables/deseq2_results.csv",
          row.names = FALSE)

# ---- 8. Visualization ----

# 8a. MA plot: mean expression vs log2 fold change
png("results/figures/MA_plot.png", width = 900, height = 700)
plotMA(resLFC, ylim = c(-3, 3), main = "MA plot (shrunken LFC)")
dev.off()

# 8b. PCA: do treated and untreated samples separate?
# vst = variance stabilizing transform (for visualization only)
vsd <- vst(dds, blind = FALSE)
pca_plot <- plotPCA(vsd, intgroup = "dex") +
  labs(title = "PCA of samples") +
  theme_bw()
ggsave("results/figures/PCA_plot.png", pca_plot,
       width = 7, height = 5, dpi = 300)

# 8c. Volcano plot: significance vs fold change
res_df <- res_df |>
  mutate(
    sig = case_when(
      padj < 0.05 & log2FoldChange >  1 ~ "Up",
      padj < 0.05 & log2FoldChange < -1 ~ "Down",
      TRUE                              ~ "NS"
    )
  )

volcano <- ggplot(res_df, aes(log2FoldChange, -log10(padj), color = sig)) +
  geom_point(alpha = 0.6, size = 1) +
  scale_color_manual(values = c(Up = "firebrick",
                                Down = "steelblue",
                                NS = "grey70")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(title = "Volcano plot: treated vs untreated",
       x = "log2 fold change", y = "-log10 adjusted p-value",
       color = NULL) +
  theme_bw()

ggsave("results/figures/volcano_plot.png", volcano,
       width = 7, height = 6, dpi = 300)

# ---- 9. Top genes ----
# 10 most significant genes
res_df |>
  arrange(padj) |>
  head(10)
