\name{distSpeed}

\alias{distSpeed}

% -------------------------------------------------------------------------

\title{Calculate distance and speed between locations}


\description{Calculate distance, time difference, and speed between
  pairs of points defined by latitude and longitude, given the time at
  which all points were measured.}


\usage{
distSpeed(pt1, pt2, method=c("Meeus", "VincentyEllipsoid"))
}
%- maybe also 'usage' for other objects documented here.


\arguments{

  \item{pt1}{A matrix or \code{\link{data.frame}} with three columns;
    the first a \code{POSIXct} object with dates and times for all
    points, the second and third numeric vectors of longitude and
    latitude for all points, respectively, in decimal degrees.}

  \item{pt2}{A matrix with the same size and structure as \code{pt1}.}

  \item{method}{character indicating which of the distance algorithms
    from \code{\link[geosphere]{geosphere-package}} to use (only default
    parameters used).  Only \code{Meeus} and \code{VincentyEllipsoid}
    are supported for now.}

}


\value{A matrix with three columns: distance (km), time difference (s),
  and speed (m/s).}

% -------------------------------------------------------------------------

\examples{

## Using the Example from '?readLocs':
utils::example("readLocs", package="diveMove",
               ask=FALSE, echo=FALSE)

## Travel summary between successive standard locations
locs.std <- subset(locs, subset=class == "0" | class == "1" |
                   class == "2" | class == "3" &
                   !is.na(lon) & !is.na(lat))
## Default Meeus method
locs.std.tr <- by(locs.std, locs.std$id, function(x) {
    distSpeed(x[-nrow(x), 3:5], x[-1, 3:5])
})
lapply(locs.std.tr, head)

## Particular quantiles from travel summaries
lapply(locs.std.tr, function(x) {
    quantile(x[, 3], seq(0.90, 0.99, 0.01), na.rm=TRUE) # speed
})
lapply(locs.std.tr, function(x) {
    quantile(x[, 1], seq(0.90, 0.99, 0.01), na.rm=TRUE) # distance
})

## Travel summary between two arbitrary sets of points
pts <- seq(10)
(meeus <- distSpeed(locs[pts, 3:5], locs[pts + 1, 3:5]))
(vincenty <- distSpeed(locs[pts, 3:5],
                       locs[pts + 1, 3:5],
                       method="VincentyEllipsoid"))
meeus - vincenty

}


\author{Sebastian P. Luque \email{spluque@gmail.com}}


\keyword{math}% at least one, from doc/KEYWORDS
\keyword{manip}
