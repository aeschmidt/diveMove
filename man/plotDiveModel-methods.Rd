% $Id: plotDiveModel-methods.Rd 200 2008-11-04 03:06:40Z sluque $
\name{plotDiveModel-methods}
\docType{methods}
\alias{plotDiveModel-methods}

\alias{plotDiveModel}
\alias{plotDiveModel,diveModel,missing-method}
\alias{plotDiveModel,numeric,numeric-method}
\alias{plotDiveModel,TDRcalibrate,missing-method}

% -------------------------------------------------------------------------

\title{ Methods for plotting models of dive phases }


\description{ Methods for function \code{plotDiveModel}. }


\usage{
\S4method{plotDiveModel}{diveModel,missing}(x, diveNo)

\S4method{plotDiveModel}{numeric,numeric}(x, y, times.s, depths.s, d.crit, a.crit,
              diveNo=1, times.deriv, depths.deriv,
              d.crit.rate, a.crit.rate)

\S4method{plotDiveModel}{TDRcalibrate,missing}(x, diveNo)
}


\arguments{

  \item{x}{A \code{\link{diveModel}} (diveMode,missing method),
    \code{\link{numeric}} vector of time step observations
    (numeric,numeric method), or \code{\link{TDRcalibrate}} object
    (TDRcalibrate,numeric method).}

  \item{y}{Numeric object with depth observations at each time step.}

  \item{diveNo}{Integer representing the dive number selected for
    plotting.}

  \item{times.s}{Numeric vector with time steps used to generate the
    smoothing spline (i.e. the knots, see \code{\link{diveModel}}.}

  \item{depths.s}{Numeric vector with smoothed depth (see
  \code{\link{diveModel}}).}

  \item{d.crit}{Integer denoting the index where descent ends in the
    observed time series (see \code{\link{diveModel}}).}

  \item{a.crit}{Integer denoting the index where ascent begins in the
    observed time series (see \code{\link{diveModel}}).}

  \item{times.deriv}{Numeric vector representing the time steps where
    the derivative of the smoothing spline was evaluated
    \code{\link{diveModel}}.}

  \item{depths.deriv}{Numeric vector representing the derivative of the
    smoothing spline evaluated at \code{times.deriv}
    \code{\link{diveModel}}.}

  \item{d.crit.rate}{Vertical rate of descent corresponding to the
    quantile used (see \code{\link{diveModel}}.}

  \item{a.crit.rate}{Vertical rate of ascent corresponding to the
    quantile used (see \code{\link{diveModel}}.}

}


\section{Methods}{

  All methods produce a double panel plot.  The top panel shows the
  depth against time, the cubic spline smoother, the identified descent
  and ascent phases (which form the basis for identifying the rest of
  the dive phases), while the bottom panel shows the first derivative of
  the smooth trace.

  \describe{

    \item{\code{signature(x = "diveModel", y = "missing")}}{ Given a
      \code{\link{diveModel}} object and (possibly) the dive number that
      it corresponds to, the plot shows the model data. }

    \item{\code{signature(x = "numeric", y = "numeric")}}{ This is the
      main method, which requires all aspects of the model to be
      provided. }

    \item{\code{signature(x = "TDRcalibrate", y = "missing")}}{ Given a
      \code{\link{TDRcalibrate}} object and a dive number to extract
      from it, this method plots the observed data and the model. }
    
}}


\seealso{ \code{\link{diveModel}} }

% -------------------------------------------------------------------------

\examples{

## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)

## 'diveModel' method
dm <- getDiveModel(dcalib, 100)
plotDiveModel(dm, diveNo=100)

## 'TDRcalibrate' method
plotDiveModel(dcalib, diveNo=100)

}


\author{Sebastian P. Luque \email{spluque@gmail.com}}

\keyword{methods}