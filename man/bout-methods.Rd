\name{bout-methods}
\docType{methods}
\alias{bout-methods}

\alias{bec2}
\alias{plotBouts}

\alias{plotBouts,nls-method}
\alias{plotBouts,mle-method}
\alias{bec2,nls-method}
\alias{bec2,mle-method}

% -------------------------------------------------------------------------
\title{Methods for Plotting and Extracting the Bout Ending Criterion}


\description{
  Plot results from fitted mixture of 2-process Poisson models, and
  calculate the bout ending criterion.
}


\usage{
\S4method{plotBouts}{nls}(fit, \ldots)
\S4method{plotBouts}{mle}(fit, x, \ldots)
\S4method{bec2}{nls}(fit)
\S4method{bec2}{mle}(fit)
}


\arguments{

  \item{fit}{\code{\link{nls}} or \code{\link[stats4]{mle}} object.}

  \item{x}{Numeric object with variable modelled.}

  \item{\ldots}{Arguments passed to the underlying
    \code{\link{plotBouts2.nls}} and \code{\link{plotBouts2.mle}}.}

}


\section{General Methods}{
  \describe{

    \item{plotBouts}{\code{signature(fit="nls")}: Plot fitted 2-process
      model of log frequency vs the interval mid points, including
      observed data.}

    \item{plotBouts}{\code{signature(x="mle")}: As the \code{nls}
      method, but models fitted through maximum likelihood method.  This
      plots the fitted model and a density plot of observed data.}

    \item{bec2}{\code{signature(fit="nls")}: Extract the estimated bout
      ending criterion from a fitted 2-process model.}

    \item{bec2}{\code{signature(fit="mle")}: As the nls method, but
      extracts the value from a maximum likelihood model.}

  }
}


\seealso{ \code{\link{bouts.mle}}, \code{\link{bouts2.nls}} for examples. }


\references{

  Langton, S.; Collett, D. & Sibly, R.  Splitting behaviour into bouts;
  a maximum likelihood approach Behaviour, 1995, 132, 9-10.

  Sibly, R.; Nott, H. & Fletcher, D. Splitting behaviour into bouts
  Animal Behaviour, 1990, 39, 63-69

}

% -------------------------------------------------------------------------

\author{Sebastian P. Luque \email{spluque@gmail.com}}

\keyword{methods}