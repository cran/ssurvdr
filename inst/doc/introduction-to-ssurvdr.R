## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(ssurvdr)
dat <- simulate_ssurvdr(n = 100, p = 12, active = 1:3, seed = 2026)
fit <- fit_ssurvdr(dat$X, dat$time, dat$status, d = 2,
                  n_slices = 3, covariance = "mec", backend = "primal")
fit$criteria
path <- fit_ssurvdr_sparse_path(dat$X, dat$time, dat$status,
                               dense_fit = fit, support_grid = c(4, 8, 12))
path$path

## -----------------------------------------------------------------------------
weights <- compute_c1f_weights(fit$basis_fit)
range(weights$weights)
weights$c1f

