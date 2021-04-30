simulate_data <- function(n = 10L) {
  alpha <- rnorm(n = 1, mean = 0, sd = 1)
  beta <- rnorm(n = n, mean = 0, sd = 1)
  x <- seq(from = -1, to = 1, length.out = n)
  y <- rnorm(n, alpha + x * beta, 1)
  list(
    n = n,
    x = x,
    y = y,
    # Hold on to prior draws:
    .join_data = list(alpha = alpha, beta = beta)
  )
}
