library(plyr)

readData <- function(type="train", dataPath="./dataset", extension=".txt") {
  sourcePath = file.path(dataPath, type)
  
  filePath <- function(name) {
    file.path(sourcePath, paste(name, "_", type, extension, sep=""))
  }
  
  # read labels
  features = read.table(file.path(dataPath, "features.txt"), colClasses=list(NULL, "character"), col.names=list("","name"))
  activityLabels = read.table(file.path(dataPath, "activity_labels.txt"), colClasses=list(NULL, "character"), col.names=list("","name"))
  
  data = read.table(filePath("X"), col.names=features$name)
  labels = read.table(filePath("y"), col.names=list("id"), stringsAsFactors=T)
  subjects = read.table(filePath("subject"), col.names=list("subject"), stringsAsFactors=T)
  
  # filter mean/std columns
  data = data[, grep("(std|mean)\\(\\)", features$name)]
  
  # join data points with corresponding subject number
  results = data.frame(data, subjects)

  # add the activity labels based on the label value
  results$activityName = activityLabels$name[labels$id]

  results
}

# all data (means and standard deviation)
combined = rbind(readData("test"), readData("train"))

# averaged values per activity & subject
averages = ddply(combined, .(subject, activityName), numcolwise(mean))

# write final dataset to file
write.table(averages, file="./averages.txt", row.names=F)