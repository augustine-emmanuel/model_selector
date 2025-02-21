#!bin/bash
file_name="reports/baseline_model_results.csv"

markdown_file="reports/baseline_model_report.md"

best_model=$(sort -t, -nk5 -nr $file_name | head -n 1)

version=$(echo $best_model | cut -d, -f1)
model=$(echo $best_model | cut -d, -f2)
precision=$(echo $best_model | cut -d, -f3)
recall=$(echo $best_model | cut -d, -f4)
F1_score=$(echo $best_model | cut -d, -f5)
roc_auc=$(echo $best_model | cut -d, -f6)

if $markdown_file
  then
    rm $markdown_file
  else
    touch $markdown_file
fi
cat <<-EOF > $markdown_file
# Baseline Model Evaluation

- Model: $model

- Data Version: $version

## Metrics

- F1-Score: $F1_score

- Precision: $precision

- ROC-AUC: $roc_auc

### Confusion Matrix:

![Confusion matrix](./data${version}_${model}_confusion_matrix.png)
EOF

echo -e "\n!data${version}_${model}_confusion_matrix.png\n\n!data${version}_${model}_class_report.csv" >> .gitignore
