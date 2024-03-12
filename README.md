# Inverse-relationship-between-species-competitiveness-and-intraspecific-trait-variability-
Data and R codes for ”Inverse relationship between species competitiveness and intraspecific trait variability may enables species coexistence in experimental seedling communities“

Introduction: This document provides an overview of the data and code used in this study titled “Inverse relationship between species competitiveness and intraspecific trait variability may enable species coexistence in experimental seedling communities”.

In this study, we initially calculated the individual time variability (ITV) and the relative importance index (RII) for each species in three competitive experiments using 999 simulations. Due to the extensive computational requirements, the results were exported as an RData file and subsequently utilized for generating figures and tables. To enhance the reliability of the outcomes, all data underwent calculation in both a seven-dimensional trait space and a dimension-reduced PC1-PC3 trait space. The resulting data sets were exported for analysis, with file names suffixed with “PCA3” to indicate dimensionality reduction.
Data Description:

1.	Computed Results Data:

a)	output_allresults_2sp_homo.RData": Data pertaining to ITV and RII for species in two-species homogeneous experiments across 7 trait dimensions.

b)	"output_allresults_2sp_homo_PCA3.RData": Similar data as above, but with dimension-reduced (3 dimensions) ITV and RII results for two-species homogeneous experiments.

c)	"output_allresults_7sp_homo.RData": Data concerning ITV and RII for species in seven-species homogeneous experiments across 7 trait dimensions.

d)	"output_allresults_7sp_homo_PCA3.RData": Similar data as above, but with dimension-reduced (3 dimensions) ITV and RII results for seven-species homogeneous experiments.

e)	"output_allresults_7sp_heter.RData": Data regarding ITV and RII for species in seven-species heterogeneous experiments across 7 trait dimensions.

f)	"output_allresults_7sp_heter_PCA3.RData": Similar data as above, but with dimension-reduced (3 dimensions) ITV and RII results for seven-species heterogeneous experiments.

g)	"HV_RII_envs9.RData": Data encompassing ITV and RII for species in seven-species homogeneous experiments across 9 different environmental zones, across 7 trait dimensions.

h)	"HV_RII_envs9_PCA3.RData": Similar data as above, but with dimension-reduced (3 dimensions) ITV and RII results for seven-species homogeneous experiments across 9 different environmental zones.

2.	Code Files:

a)	"Calculate_ITV_RII_PhaseI_2sp_homo.Rmd": R Markdown file for computing ITV and RII for two-species homogeneous experiments.

b)	"Calculate_ITV_RII_PhaseI_7sp_homo.Rmd": R Markdown file for computing ITV and RII for seven-species homogeneous experiments.

c)	"Calculate_ITV_RII_PhaseII_7sp_heter.Rmd": R Markdown file for computing ITV and RII for seven-species heterogeneous experiments.

d)	"Output-all-tables-and-figures.Rmd": R Markdown file responsible for generating figures and tables from the computed results.

e)	"core_functions_for_ITV.R": R script containing core functions for computing ITV.


f)	"theme_Publication.R": R script containing core functions for generating publication-quality plots.


Note: The ITV and RII were computed for each species across three different competitive experiments using 999 simulations. The computations were conducted in both a seven-dimensional trait space and a dimension-reduced (PC1-PC3) trait space for robustness.
