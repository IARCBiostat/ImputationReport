#' Perform Imputation Test
#'
#' This function performs an imputation test using the specified qmd file.
#' Your data should have samples as rows and features as columns. There should
#' be no extra columns.
#'
#' @param data your data variable e.g., mtcars
#' @param output_dir where you want to save the output
#' @param root_dir where you want to generate the report from
#' @param subtitle what you want to call this imputation test
#'
#' @return The result of the imputation test.
#'
#' @examples
#' \dontrun{
#' imputation_test(data = mtcars,
#'                 output_dir = "project1/data/",
#'                 root_dir = "project1/",
#'                 subtitle = "imputation testing for mtcars")
#' }
#'
#' @export
imputation_test <- function(
    data,
    output_dir,
    root_dir,
    subtitle) {

  rmarkdown::render(
    input = paste0(system.file(package = "ImputationReport"), "/rmd/imputation.qmd"),
    output_format = "html_document",
    output_dir = output_dir,
    root_dir = root_dir,
    params = list(data = data, subtitle = subtitle))
}
