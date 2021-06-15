data {
  int <lower = 1> n;
  vector[n] x;
  vector[n] y;
}
parameters {
  vector[2] beta;
}
model {
  y ~ normal(beta[1] + x * beta[2], 1);
  beta ~ normal(0, 1);
}
