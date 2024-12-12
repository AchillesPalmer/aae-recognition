# aae-recognition

This repository contains files for the final project of **LING 227** at Yale on the ability of GPT-2 to recognize features of African American English (AAE). It should be possible to run all scripts as is, but see below for details on dependencies.

## Files in this repository:
- `data_gen.ipynb`
- `data.csv`
- `gpt_test.ipynb`
- `gpt-results.csv`
- `analysis.R`
- `aae-rec.pdf`

---

### File Descriptions

#### `data_gen.ipynb`
- Produces the file `data.csv`.  
- **Dependencies**: None.

#### `data.csv`
- The dataset used for the experiment in the paper. The output of `data_gen.ipynb`.

#### `gpt_test.ipynb`
- Depends on a `data.csv` file with the format produced by `data_gen.ipynb`.  
- **Required Packages**: `torch`, `pandas`, and `transformers`.  
- Produces the file `gpt-results.csv`.

#### `gpt-results.csv`
- The results of the experiment in the paper. The output of `gpt_test.ipynb.ipynb`.

#### `analysis.R`
- Performs the statistical tests described in the paper.  
- Depends on `gpt-results.csv` (format produced by `gpt_test.ipynb`).  
- **Required Packages**: `readr`, `ggplot2`, and `broom`.  
- Outputs the results of logistic regression and produces a `.png` plot.

#### `aae-rec.pdf`
- The (unpublished) paper associated with this repository.

---
