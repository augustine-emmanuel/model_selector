#!bin/bash

# Filepaths
FILE_NAME="reports/baseline_MODEL_results.csv"

MARKDOWN_FILE="reports/baseline_MODEL_report.md"

# Sort sccorrding to F1-Score column in numeric descending order
# assign to BEST_MODEL
BEST_MODEL=$(sort -t, -nk5 -nr $FILE_NAME | head -n 1)


# Extract data version, model and metrics
VERSION=$(echo $BEST_MODEL | cut -d, -f1)
MODEL=$(echo $BEST_MODEL | cut -d, -f2)
PRECISION=$(echo $BEST_MODEL | cut -d, -f3)
RECALL=$(echo $BEST_MODEL | cut -d, -f4)
F1_SCORE=$(echo $BEST_MODEL | cut -d, -f5)
ROC_AUC=$(echo $BEST_MODEL | cut -d, -f6)

# check for markdown file and delete if found
# create a new markdown file
if $MARKDOWN_FILE
  then
    rm $MARKDOWN_FILE
    touch $MARKDOWN_FILE
  else
    touch $MARKDOWN_FILE
fi

# create a new markdown file
cat <<-EOF > $MARKDOWN_FILE
# Baseline MODEL Evaluation

- MODEL: $MODEL

- Data VERSION: $VERSION

## Metrics

- F1-Score: $F1_SCORE

- PRECISION: $PRECISION

- ROC-AUC: $ROC_AUC

### Confusion Matrix:

![Confusion matrix](./data${VERSION}_${MODEL}_confusion_matrix.png)
EOF

# exclude best model confusion matrix and report from gitignore
echo -e "\n!data${VERSION}_${MODEL}_confusion_matrix.png\n\n!data${VERSION}_${MODEL}_class_report.csv" >> .gitignore

