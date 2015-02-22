# Code Book
This file contains descriptors for variables created by the `run_analytis.R` script in order of instantiation.

```
1a. readData(type="train", dataPath="./dataset", extension=".txt")

Variable				Class				Values/Explanation
sourcePath				character			Relative path to the Samsung dataset, e.g. "./dataset/train" or "./dataset/test".
features				data.frame			Single column, containing labels (character) for each feature.
activityLabels			data.frame			Single column, containing labels (character) for each activity type.
data					data.frame			Dataset (either training or testing) as read from "./dataset/(train|test)/X_(train|test).txt", with column names from features applied.
labels					data.frame			Single column, containing activity labels for each observation in the data object.
subjects				data.frame			Single column, containing subject labels for each observation in the data object.
results					data.frame			Combined data containing filtered (mean/std) columns from data object with corresponding activityName/subject included.

1b. Global environment
Variable				Class				Values/Explanation
combined				data.frame			Output of readData function (see above).
averages				data.frame			Grouped averages of combined data by subject & activityName.

```