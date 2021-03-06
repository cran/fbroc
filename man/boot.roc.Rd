% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fbroc.roc.R
\name{boot.roc}
\alias{boot.roc}
\title{Bootstrap ROC curve}
\usage{
boot.roc(pred, true.class, stratify = TRUE, n.boot = 1000,
  use.cache = FALSE, tie.strategy = NULL)
}
\arguments{
\item{pred}{A numeric vector. Contains predictions. \code{boot.roc} assumes
that a high prediction is evidence for the observation belonging to the
positive class.}

\item{true.class}{A logical vector. TRUE indicates the sample belonging to the
positive class.}

\item{stratify}{Logical. Indicates whether we use stratified bootstrap.
Default to TRUE. Non-stratified bootstrap is not yet implemented.}

\item{n.boot}{A number that will be coerced to integer. Specified the 
number of bootstrap replicates. Defaults to 1000.}

\item{use.cache}{If true the bootstrapping results for the
ROC curve will be pre-cached. This increases speed when the object is used often, but also
takes up more memory.}

\item{tie.strategy}{How to handle ties. See details below.}
}
\value{
A list of class \code{fbroc.roc}, containing the elements:
\item{prediction}{Input predictions.}
\item{true.class}{Input classes.}
\item{roc}{A data.frame containing the thresholds of the ROC curve and the TPR and FPR at these
thresholds.}
\item{n.thresholds}{Number of thresholds.}
\item{n.boot}{Number of bootstrap replicates.}
\item{use.cache}{Indicates if cache is used for this ROC object}
\item{tie.strategy}{Used setting how to handle ties in predictors.}
\item{n.pos}{Number of positive observations.}
\item{n.neg}{Number of negative observations.}
\item{auc}{The AUC of the original ROC curve.}
\item{boot.tpr}{If the cache is enabled, a matrix containing the bootstrapped TPR at the thresholds.}
\item{boot.fpr}{If the cache is enabled, a matrix containing the bootstrapped FPR at the thresholds.}
}
\description{
\code{boot.roc} calculates the ROC curve, initializes the settings
and calculates the bootstrap results for the true and false
positive rate at every relevant threshold. Missing values are removed with 
a warning prior to bootstrapping.
}
\section{Caching}{

If you enable caching, \code{boot.roc} calculates the requested number of bootstrap samples and
saves the TPR and FPR values for each iteration. This can take up a sizable portion of memory,
but it speeds up subsequent operations. This can be useful if you plan to use the ROC curve
multiple \code{fbroc} functions.
}

\section{Ties}{

You can set this parameter to either 1 or 2. If your numerical predictor has no ties, both settings
will produce the same results. 
If you set \code{tie.strategy} to 1 the ROC curve is built by connecting the TPR/FPR pairs for
neighboring thresholds. A tie.strategy of 2 indicates that the TPR calculated at a specific FPR
is the best TPR at a FPR smaller than or equal than the FPR specified. Defaults to 2.
}

\examples{
y <- rep(c(TRUE, FALSE), each = 500)
x <- rnorm(1000) + y
result.boot <- boot.roc(x, y)
}
\seealso{
\url{http://www.epeter-stats.de/roc-curves-and-ties/}, \code{\link{plot.fbroc.roc}}, 
\code{\link{print.fbroc.roc}}
}
