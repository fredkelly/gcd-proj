# Getting and Cleaning Data Course Project

### Running
The file `run_analysis.R` contains a function `readData(type="train", dataPath="./dataset", extension=".txt")` responsible for reading the files (expected at the relative `./dataset` path). This function returns the combined dataset as described in part 4 of the task description.

The foot of the `run_anaylsis.R` calls the `readData` function to produce a `combined` output, which is then averaged and written out to the file `./averages.txt` as described in part 5 of the task description.

The `averages` comprises a `data.frame` of 180 rows and 68 columns (66 features and a `subject` and `activityName` label).

### Packages
The `run_analysis.R` file makes use of the `ddply` function from the `plyr` package.