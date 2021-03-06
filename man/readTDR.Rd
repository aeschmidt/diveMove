\name{readTDR}

\alias{readTDR}
\alias{createTDR}

% -------------------------------------------------------------------------

\title{Read comma-delimited file with "TDR" data}



\description{Read a delimited (*.csv) file containing time-depth
  recorder (\dfn{TDR}) data from various \acronym{TDR} models.  Return a
  \code{TDR} or \code{TDRspeed} object. \code{createTDR} creates an
  object of one of these classes from other objects.}


\usage{
readTDR(file, dateCol=1, timeCol=2, depthCol=3, speed=FALSE,
        subsamp=5, concurrentCols=4:6,
        dtformat="\%d/\%m/\%Y \%H:\%M:\%S", tz="GMT", \ldots)
createTDR(time, depth,
          concurrentData=data.frame(matrix(ncol=0, nrow=length(time))),
          speed=FALSE, dtime, file)
}


\arguments{

  \item{file}{character: a string indicating the path to the file to
    read.  This can also be a text-mode connection, as allowed in
    \code{\link{read.csv}}.}

  \item{dateCol}{integer: column number containing dates, and
    optionally, times.}

  \item{timeCol}{integer: column number with times.}

  \item{depthCol}{integer: column number containing depth readings.}

  \item{speed}{logical: whether speed is included in one of the columns
    of concurrentCols.}

  \item{subsamp}{numeric scalar: subsample rows in \code{file} with
    \code{subsamp} interval, in s.}

  \item{concurrentCols}{integer vector of column numbers to include as
    concurrent data collected.}

  \item{dtformat}{character: a string specifying the format in which the
    date and time columns, when pasted together, should be interpreted
    (see \code{\link{strptime}}).}

  \item{tz}{character: a string indicating the time zone assumed for the
    date and time readings.}

  \item{\ldots}{Passed to \code{\link{read.csv}}}

  \item{time}{A \code{POSIXct} object with date and time readings for
    each reading.}

  \item{depth}{numeric vector with depth readings.}

  \item{concurrentData}{\code{\link{data.frame}} with additional,
    concurrent data collected.}

  \item{dtime}{numeric scalar: sampling interval used in seconds.  If
    missing, it is calculated from the \code{time} argument.}

}


\details{The input file is assumed to have a header row identifying each
  field, and all rows must be complete (i.e. have the same number of
  fields).  Field names need not follow any convention.  However, depth
  and speed are assumed to be in m, and \eqn{m \cdot s^{-1}}{m/s},
  respectively, for further analyses.

  If \var{speed} is TRUE and concurrentCols contains a column named
  speed or velocity, then an object of class \code{\link{TDRspeed}} is
  created, where speed is considered to be the column matching this
  name.}


\note{Although \code{\link{TDR}} and \code{\link{TDRspeed}} classes
  check that time stamps are in increasing order, the integrity of the
  input must be thoroughly verified for common errors present in text
  output from \acronym{TDR} devices such as duplicate records, missing
  time stamps and non-numeric characters in numeric fields.  These
  errors are much more efficiently dealt with outside of \acronym{GNU}
  \R using tools like \code{GNU awk} or \code{GNU sed}, so
  \code{\link{diveMove}} does not currently attempt to fix these
  errors.}


\value{An object of class \code{\link{TDR}} or \code{\link{TDRspeed}}.}

% -------------------------------------------------------------------------

\examples{

## Do example to define object zz with location of dataset
utils::example("dives", package="diveMove",
               ask=FALSE, echo=FALSE)
srcfn <- basename(zz)
readTDR(zz, speed=TRUE, sep=";", na.strings="", as.is=TRUE)

## Or more pedestrian
tdrX <- read.csv(zz, sep=";", na.strings="", as.is=TRUE)
date.time <- paste(tdrX$date, tdrX$time)
tdr.time <- as.POSIXct(strptime(date.time, format="\%d/\%m/\%Y \%H:\%M:\%S"),
                       tz="GMT")
createTDR(tdr.time, tdrX$depth, concurrentData=data.frame(speed=tdrX$speed),
          file=srcfn, speed=TRUE)

}


\author{Sebastian P. Luque \email{spluque@gmail.com}}


\keyword{manip}% at least one, from doc/KEYWORDS
