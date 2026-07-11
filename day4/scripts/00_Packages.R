# Install pak package 
install.packages("pak")

# CRAN Packages (data management + visualization)
cran_pkgs <- c("tidyverse", "ggsci", "ggthemes", "ggpubr", "tidyplots")
pak::pkg_install(cran_pkgs)

# Bioconductor for Bioinformatics 
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.23")

# Install bioconductor packages 
bio_pkgs <- c("DESeq2", "TCGAbiolinks")
pak::pkg_install(bio_pkgs)

# Load packages 
library(pak)
library(DESeq2)