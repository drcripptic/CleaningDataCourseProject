# Read Me

## Project Overview

The goal of this project was to tidy and reshape data collected from gyroscope and accelerometer output from users of Samsung Galaxy II smartphones. These users carried out a limited set of 6 activities (walking, walking up stairs, walking down stairs, sitting, standing, laying) while carrying their smartphones. Labelling was done by hand by examing videos. A summary of the original data can be found at (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Contents of Repo

* run_analysis.R -- this script will load the data, transform it (see code book for details and output) and output a tidy data summary
* README.md -- this file
* CodeBook.md -- contains descriptions of the data transformations and variables

## Additional Comments

* The reshape2 package is required to run run_analysis.R
* The data should be the following folder structure (with run_analysis.R in the working drectory):
	- ./activity_labels.txt
	- ./features.txt
	- ./train/subject_train.txt
	- ./train/y_train.txt
	- ./train/X_train.txt	
	- ./test/subject_test.txt
	- ./test/y_test.txt
	- ./test/X_test.txt
* In violation of the course style (and somewhat against the Google R style guide), variable names are in camelCase. This is to aid readability for long variable names.