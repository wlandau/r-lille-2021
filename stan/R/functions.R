simulate_data <- function(n = 10L) {
  beta <- rnorm(n = 2, mean = 0, sd = 1)
  x <- seq(from = -1, to = 1, length.out = n)
  y <- rnorm(n, beta[1] + x * beta[2], 1)
  list(
    n = n,
    x = x,
    y = y,
    # Hold on to draws from the prior:
    .join_data = list(beta = beta)
  )
}

calculate_coverage <- function(results) {
  results %>%
    group_by(variable) %>%
    summarize(
      coverage_50 = mean(q25 < .join_data & .join_data < q75),
      coverage_95 = mean(q2.5 < .join_data & .join_data < q97.5)
    )
}
