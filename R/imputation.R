#' Perform Imputation Test
#'
#' This function performs an imputation test using the specified qmd file.
#' Your data should have samples as rows and features as columns. There should
#' be no extra columns.
#'
#' @param data your data variable e.g., mtcars
#' @param output_dir where you want to save the output
#' @param knit_root_dir where you want to generate the report from
#' @param subtitle what you want to call this imputation test
#'
#' @return The result of the imputation test.
#'
#' @examples
#' \dontrun{
#' imputation_test(data = mtcars,
#'                   output_dir = "project1/data/",
#'                   knit_root_dir = "project1/",
#'                   subtitle = "imputation testing for mtcars")
#' }
#'
#' @importFrom rmarkdown render
#' @importFrom ggplot2 ggplot aes geom_col labs scale_y_continuous element_text theme
#' @importFrom cowplot theme_cowplot plot_grid
#' @importFrom dplyr summarise across everything arrange mutate filter select group_by ungroup left_join mutate_all
#' @importFrom tidyr pivot_longer gather
#' @importFrom kableExtra kbl kable_styling scroll_box add_header_above
#' @importFrom stats cor.test
#' @importFrom utils head
#' @importFrom tibble column_to_rownames rownames_to_column
#' @importFrom scales percent_format
#' @importFrom patchwork plot_layout
#' @importFrom parallel makeCluster stopCluster
#' @importFrom doParallel registerDoParallel
#' @importFrom imputeLCMD impute.MAR.MNAR model.Selector
#' @importFrom impute impute.knn
#' @importFrom missForest missForest
#' @importFrom pcaMethods pca completeObs
#' @importFrom missMethods impute_median impute_mean
#'
#' @export
imputation_test <- function(
    data,
    output_dir,
    knit_root_dir,
    subtitle) {
  
  rmarkdown::render(
    input = paste0(system.file(package = "ImputationReport"), "/rmd/imputation.qmd"),
    output_format = "html_document",
    output_dir = output_dir,
    params = list(data = data, subtitle = subtitle))
}
