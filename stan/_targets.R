library(targets)
library(stantargets)
source("R/functions.R")
tar_option_set(packages = "tidyverse")
options(clustermq.scheduler = "multicore")
list(
  tar_stan_mcmc_rep_summary(
    model,
    "model.stan",
    simulate_data(),
    batches = 80,
    reps = 25,
    variables = c("alpha", "beta"),
    summaries = list(
      ~posterior::quantile2(.x, probs = c(0.025, 0.975)),
      rhat = posterior::rhat
    )
  ),
  tar_target(
    coverage,
    model %>%
      group_by(variable) %>%
      summarize(rate = mean(q2.5 < .join_data & .join_data < q97.5))
  )
)
