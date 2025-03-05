# ImputationReport

## What
This package provides a general function `imputation_test()` that will produce a simple report for different imputation methods for your specific data. 

It takes complete data (i.e., features with no missing values) from your data and introduces random missing values at 5%, 10%, 20%, 30%, 40%, 50%, 60%, 70%, 80%, and 90%. We then perform the following imputation methods:

1. 1/5th of lowest detected value (5th)
2. left censored missing data (lcmd)
3. k-nearest neighbours (KNN; does not work with >50% missingness - mean is used for >50% missingness)
4. probabilistic PCA (PPCA; does not work with complete sample missingness)
5. median
6. mean
7. random forest (RF)

After imputation we compare the actual value with the imputed value using root-mean-square error (RMSE) and R^2^. NOTE: R^2^ is not reflective of prediction accuracy but can indicate the correlation between the actual and imputed values. RMSE is calculated as: 

<center>
$\sqrt{\text{mean}\left((\text{actual} - \text{predicted})^2\right)}$
</center>

Where $actual$ is the value from the complete data prior to replacement with `NA` and $predicted$ is the imputed value of said missing data. The figure below gives values for all models at all % missing and the table shows the most accurate model for each % missing tested; the lower the RMSE the better the model fit; the higher the R^2^ the more correlated the actual and imputed values are. 

## How
A single function takes a dataframe, the location where you want to save the report, and a label (subtitle) to attach to the report. The report and a cache will be saved in the location provided. A simulated dataframe (`data(data_features)`) and a [report](https://github.com/IARCBiostat/ImputationReport/inst/imputation.html) generated from this are provided as an example. A preview of the report can be seen [here](https://html-preview.github.io/?url=https://github.com/IARCBiostat/ImputationReport/inst/imputation.html)

```r
ImputationReport::imputation_test(
  data = data_features, 
  output_dir = "/path/to/save/report/", 
  subtitle = "my report"
  )
```

## References

1. left-censored missing data imputation performed using [`{imputeLCMD}`](https://www.rdocumentation.org/packages/imputeLCMD/versions/2.1)
2. k nearest neighbours imputation performed using [`{impute}`](https://www.rdocumentation.org/packages/impute/versions/1.46.0)
3. probabilistic PCA performed using [`{pcaMethods}'](https://www.rdocumentation.org/packages/pcaMethods/versions/1.64.0)
4. median imputation performed using [`{missMethods}`](https://www.rdocumentation.org/packages/missMethods/versions/0.4.0)
5. mean imputation performed using [`{missMethods}`](https://www.rdocumentation.org/packages/missMethods/versions/0.4.0)
6. random forest imputation performed using [`{missForest}`](https://www.rdocumentation.org/packages/missForest/versions/1.5)
