# MODEL SELECTOR

## Objective
This project is a bash script that automates the process of selecting the best model from a comma seperated file (csv) `baseline_model_results.csv` comprising of 6 columns.
The columns are as follows:
-   DataVersion
-   Model
-	Precision
-	Recall
-	F1-Score
-	ROC-AUC

The ![bash script](./result_comparison.sh) sorts the F1-Score column of the csv file numerically in descending order and selects the first row.

The script automatically generates a report of the best model, its metadata and the confusion matrix. This report is rendered as a markdown ![baseline_model_report.md](reports/baseline_model_report.md)
