% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/causal_forest-scores.R,
%   R/instrumental_forest-scores.R, R/multi_causal_forest-scores.R, R/scores.R
\name{conditional_means.causal_forest}
\alias{conditional_means.causal_forest}
\alias{conditional_means.instrumental_forest}
\alias{conditional_means.multi_causal_forest}
\alias{conditional_means}
\title{Estimate mean rewards \eqn{\mu} for each treatment \eqn{a}}
\usage{
\method{conditional_means}{causal_forest}(object, ...)

\method{conditional_means}{instrumental_forest}(object, ...)

\method{conditional_means}{multi_causal_forest}(object, ...)

conditional_means(object, ...)
}
\arguments{
\item{object}{An appropriate causal forest type object}

\item{...}{Additional arguments}
}
\value{
A matrix of estimated mean rewards
}
\description{
\eqn{\mu_a = m(x) + (1-e_a(x))\tau_a(x)}
}
\section{Methods (by class)}{
\itemize{
\item \code{causal_forest}: Mean rewards \eqn{\mu} for control/treated

\item \code{instrumental_forest}: Mean rewards \eqn{\mu} for control/treated

\item \code{multi_causal_forest}: Mean rewards \eqn{\mu} for each treatment \eqn{a}
}}

\examples{
\donttest{
# Compute conditional means for a multi_causal forest
n <- 500
p <- 10
X <- matrix(rnorm(n * p), n, p)
W <- sample(c("A", "B", "C"), n, replace = TRUE)
Y <- X[, 1] + X[, 2] * (W == "B") + X[, 3] * (W == "C") + runif(n)
forests <- multi_causal_forest(X = X, Y = Y, W = W)
mu.hats <- conditional_means(forests)
head(mu.hats)

# Compute conditional means for a causal forest
n <- 500
p <- 10
X <- matrix(rnorm(n * p), n, p)
W <- rbinom(n, 1, 0.5)
Y <- pmax(X[, 1], 0) * W + X[, 2] + pmin(X[, 3], 0) + rnorm(n)
c.forest <- grf::causal_forest(X, Y, W)
mu.hats <- conditional_means(c.forest)
}
}
