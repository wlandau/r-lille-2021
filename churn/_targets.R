library(targets)
source("R/functions.R")
tar_option_set(packages = c("keras", "tidyverse", "rsample", "recipes", "yardstick"))
list(
  tar_target(file, "data/churn.csv", format = "file"),
  tar_target(data, split_data(file)),
  tar_target(recipe, prepare_recipe(data)),
  tar_target(model1, test_model(data, recipe, act1 = "relu")),
  tar_target(model2, test_model(data, recipe, act1 = "sigmoid")),
  tar_target(model3, test_model(data, recipe, act1 = "softmax"))
)
