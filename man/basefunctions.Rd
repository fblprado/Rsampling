% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/basefunctions.R
\name{basefunctions}
\alias{basefunctions}
\alias{columns_as_units}
\alias{normal_rand}
\alias{rows_as_units}
\alias{within_columns}
\alias{within_rows}
\title{Shuffling and resampling functions}
\usage{
within_rows(dataframe, cols = 1:ncol(dataframe), replace = FALSE,
  FUN = base::sample)

within_columns(dataframe, cols = 1:ncol(dataframe), stratum = rep(1,
  nrow(dataframe)), replace = FALSE, FUN = base::sample)

normal_rand(dataframe, cols = 1:ncol(dataframe), stratum = rep(1,
  nrow(dataframe)), replace = FALSE, FUN = base::sample)

rows_as_units(dataframe, stratum = rep(1, nrow(dataframe)), replace = FALSE,
  length.out = NULL)

columns_as_units(dataframe, cols = 1:ncol(dataframe), replace = FALSE,
  length.out = NULL)
}
\arguments{
\item{dataframe}{a dataframe with the data to be shuffled or resampled.}

\item{cols}{columns of dataframe that should be selected to be resampled/shuffled. Defaults for all columns.}

\item{replace}{(logical) should the data be permuted (FALSE) or resampled with replacement (TRUE) ?}

\item{FUN}{function used for the sampling procedure. The default is \code{\link[base]{sample}}, and a new
function \code{\link{zfsample}} is provided for sampling with fixed zeroes.}

\item{stratum}{factor or integer vector that separates data in groups or strata. Randomizations will be performed within each level of the stratum. Needs at least two observations in each level. Default is a single-level stratum.}

\item{length.out}{(integer) specifies the size of the resulting data set.
For columns_as_units, a data.frame with length.out columns will be returned, and for
rows_as_units, a data.frame with length.out rows will be returned.
Note that if length.out is larger than the relevant dimension, \code{replace} must also be specified.}
}
\value{
a dataframe with the same structure of those input in \code{dataframe} with values randomized accordingly.
}
\description{
Functions to run (un)restricted sampling with or without replacement in a dataframe.
}
\section{Details}{


Each function performs as close as possible the corresponding options in Resampling Stats add-in for Excel
(www.resample.com) for permutation (shuffling) and sampling with replacement (resampling)
values in tabular data:
\itemize{
  \item \code{normal_rand} corresponds to the 'normal shuffle' and 'normal resample' option.
For shuffling (\code{replace=FALSE}) the data is permuted over all cells of \code{dataframe}.
For resampling (\code{replace=TRUE}) data from any cell can be sampled and attributed to any other cell.
\item \code{within_rows} and \code{within_columns} correspond to the options with the same names.
The randomization is done within each row or column of \code{dataframe}.
So for shuffling the values of each row/column are permuted independently and for
resampling the values are sampled independently from each row/column and attributed only
to cells of the row/column they were sampled.
\item \code{rows_as_units} and \code{columns_as_units} also correspond to the options with the same names.
Each row or column \code{dataframe} is shuffled or resampled as whole.
Only the placement of rows and columns in the dataframe change. The values and their position within each row/column remains the same.
}
All functions assemble the randomized values in a dataframe
of the same configuration of the original. Columns that
were not selected to be randomized with argument \code{cols} are then
bound to the resulting dataframe. The order and names of the rows and columns are preserved, except if \code{length.out}
is specified. In this case, the randomized rows/columns may be shifted to the end of the table.

When both \code{stratum} and \code{length.out} are used, the function will try to keep the proportion of each strata close to the original.
}

\section{References}{


Statistics.com LCC. 2009. Resampling Stats Add-in for Excel User's Guide.
\url{http://www.resample.com/content/software/excel/userguide/RSXLHelp.pdf}
}

