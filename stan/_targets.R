library(targets)
library(stantargets)
source("R/functions.R")
tar_option_set(packages = "tidyverse")
options(clustermq.scheduler = "multicore") #<<
list(
  tar_stan_mcmc_rep_summary(
    name = model, stan_files = "model.stan", data = simulate_data(),
    batches = 160, reps = 25, variables = "beta",
    summaries = list(
      ~posterior::quantile2(.x, probs = c(0.025, 0.25, 0.75, 0.975)),
      rhat = posterior::rhat
    ),
  ),
  tar_target(coverage, calculate_coverage(model))
)
