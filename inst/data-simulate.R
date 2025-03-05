# Generate example data for `process_data()`
rm(list=ls())
set.seed(821)

# data: feature data ====
n_rows <- 100
n_cols <- 101
# Generate random IDs
ids <- paste0("ID_", seq(1:n_rows))
# Generate random data for features
data_features <- matrix(runif(n_rows * (n_cols - 1)), nrow = n_rows)
# Create dataframe
data_features <- data.frame(ID_sample = ids, data_features)
colnames(data_features)[2:n_cols] <- paste0("feature_", 1:(n_cols - 1))

# Introduce missing values
# 5% missing for 50 columns and 50 rows (randomly selected)
num_cols_missing <- 50
num_rows_missing <- 50

# Randomly select columns and rows (excluding the first column)
missing_cols <- sample(2:n_cols, num_cols_missing)
missing_rows <- sample(1:n_rows, num_rows_missing)

for (i in missing_cols) {
  for (j in missing_rows) {
    if (runif(1) < 0.05) {  # 5% chance of setting to NA
      data_features[j, i] <- NA
    }
  }
}

# check ====
missing_pct_row <- rowMeans(is.na(data_features[, 2:n_cols]))
missing_pct_col <- colMeans(is.na(data_features[, 2:n_cols]))
data_complete <- data_features %>%
  select(where(function(x) all(!is.na(x))))

# write ====
save(data_features, file = "data/data_features.rda")
