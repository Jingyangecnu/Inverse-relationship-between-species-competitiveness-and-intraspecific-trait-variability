# This script is core functions for the paper "Competition induces higher intraspecific trait variability in inferior than in superior tree species" by Yang et al., 2024.

# Prepare trait data for analysis
# Create species and trait labels
species <- paste0("sp", 1:7)
trait_names <- paste0("trait", 1:3)

# Generate a data frame with simulated trait values under two competition treatments for each species
trait_data <- data.frame(
  species = rep(species, each = 40 * 2),
  competition_treatment = rep(c("competition-free", "competition"), each = 280),
  trait1 = rnorm(560, 1, 2),
  trait2 = rnorm(560, 10, 50),
  trait3 = rnorm(560, 100, 10)
)

# Function to calculate the Bao's coefficient of variation (CV4)
CV4 <- function(trait_sample) {
  # Exclude NA values
  trait_sample <- trait_sample[!is.na(trait_sample)]
  
  if(length(trait_sample) > 1) {
    N <- length(trait_sample) # Sample size
    y_bar <- mean(trait_sample) # Sample mean
    s2_hat <- var(trait_sample) # Sample variance
    
    # Calculate the squared coefficient of variation (CV^2)
    cv_2 <- s2_hat / y_bar^2
    cv_1 <- sqrt(cv_2) # Coefficient of variation
    
    # Calculate skewness and kurtosis for bias adjustment
    gamma_1 <- sum(((trait_sample - y_bar) / sqrt(s2_hat))^3) / N
    gamma_2 <- sum(((trait_sample - y_bar) / sqrt(s2_hat))^4) / N
    bias2 <- cv_1^3 / N - cv_1 / (4 * N) - cv_1^2 * gamma_1 / (2 * N) - cv_1 * gamma_2 / (8 * N)
    
    cv4 <- cv_1 - bias2
  } else {
    cv4 <- NA # Return NA if there's insufficient data
  }
  
  return(cv4)
}

# Function to calculate the hypervolume value based on trait data
Hypervolume_value <- function(ni, trait_data, trait, sample_size, quantile) {
  if (length(ni) > 2) {
    data <- trait_data[ni, ]
    if (sample_size == "all") {
      sample_data <- data[, colnames(data) %in% trait]
    } else {
      ind_num <- length(data[, 1])
      sample_num <- sample(1:ind_num, sample_size)
      sample_data <- data[sample_num, colnames(data) %in% trait]
      sample_rii <- mean(data[sample_num, ]$RII, na.rm = TRUE)
    }
    bandwidth <- estimate_bandwidth(data = sample_data)
    hypervolume <- hypervolume_gaussian(data = sample_data, name = unique(sample_data$pdname),
                                        kde.bandwidth = bandwidth, quantile.requested = quantile)
    hv <- hypervolume@Volume
  } else {
    hv <- NA
    sample_rii <- NA
  }
  return(c(hv = hv, rii = sample_rii))
}

# Function to simulate hypervolume values across different species
Sim_Hypervolume <- function(n, trait_data, trait, sample_size, quantile, Hypervolume_value) {
  library(hypervolume)
  hvs <- tapply(1:nrow(trait_data), list(trait_data$species), Hypervolume_value, trait_data, trait, sample_size, quantile)
  return(hvs)
}

# Normalize trait data
trait_data[, trait_names] <- scale(trait_data[, trait_names])

# Parameters for hypervolume simulation
quantile <- 0.95
sample_size <- 20
Nrep <- 999
clnum <- detectCores() - 1
cl <- makeCluster(getOption("cl.cores", clnum))
set.seed(1) # Ensure reproducibility

# Parallel computation of hypervolume values
hv <- parLapply(cl, 1:Nrep, Sim_Hypervolume, trait_data, trait_names, sample_size, quantile, Hypervolume_value)

# Perform Principal Component Analysis (PCA) on trait data
trait_data <- trait_data[, colnames(trait_data) %in% trait_names]
trait_stand.pr <- princomp(trait_data, cor = TRUE)
pr <- summary(trait_stand.pr, loadings = TRUE)

# Add PCA scores to the dataset
trait_data$PC1 <- pr$scores[, 1]
trait_data$PC2 <- pr$scores[, 2]
trait_data$PC3 <- pr$scores[, 3]
pca_traits <- c("PC1", "PC2", "PC3")

# Visualize the hypervolume results
plot.HypervolumeList(hvlist, show.legend = FALSE, show.random = TRUE, show.data = TRUE, show.centroid = TRUE, point.alpha.min = 0.05)
