# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* Using Rbind data merged from various extracts.
* Then mean and standard deviation measures are taken from the whole dataset. Correct names are assigned from features extract.
* Activity names are extracted from the activities files and substitued in the dataset. 
* we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called `avg_data.txt`, and uploaded to this repository.

# Variables

* `train_x`, `train_y`, `test_x`, `test_y`, `train_subject` and `test_subject` contain the data from the downloaded files.
* `data_x`, `data_y` and `data_subject` contains data set after merging above data sets. 
* `features` contains the correct names for the `data_x` dataset, which are applied to the column names stored in `mean_and_std`.
* activity names added through the `activities` variable.
* `complete_data` merges `data_x`, `data_y` and `data_subject`.
* `avg_data` contains the relevant averages which is stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
