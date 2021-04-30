// model.stan
data {
  int <lower = 1> n;
  vector[n] x;
  vector[n] y;
}
parameters {
  real alpha;
  vector[n] beta;
}
model {
  y ~ normal(alpha + x .* beta, 1);
  alpha ~ normal(0, 1);
  beta ~ normal(0, 1);
}
