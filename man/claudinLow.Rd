\name{claudinLow}
\alias{claudinLow}
\title{Claudin-low classification for Breast Cancer Data}
\description{
Subtyping method for identifying Claudin-Low Breast Cancer Samples. 
Code generously provided by Aleix Prat. 
}
\usage{
claudinLow(x, classes="", y, nGenes="", priors="equal", 
  std=FALSE, distm="euclidean", centroids=FALSE)
}
\arguments{
  \item{x}{the data matrix of training samples, or pre-calculated centroids}
  \item{classes}{a list labels for use in coloring the points}
  \item{y}{the data matrix of test samples}
  \item{nGenes}{the number of genes selected when training the model}
  \item{priors}{'equal' assumes equal class priors, 'class' calculates them based on proportion in the data}
  \item{std}{when true, the training and testing samples are standardized to mean=0 and var=1}
  \item{distm}{the distance metric for determining the nearest centroid, can be one of euclidean, pearson, or spearman}
  \item{centroids}{when true, it is assumed that x consists of pre-calculated centroids}
}

\references{
Aleix Prat, Joel S Parker, Olga Karginova, Cheng Fan, Chad Livasy, Jason I Herschkowitz, Xiaping He, and Charles M. Perou (2010) "Phenotypic and molecular characterization of the claudin-low intrinsic subtype of breast cancer", \emph{Breast Cancer Research}, \bold{12}(5):R68
}
\examples{
data(claudinLowData)

#Training Set
train <- claudinLowData
train$xd <-  medianCtr(train$xd)
# Testing Set
test <- claudinLowData
test$xd <-  medianCtr(test$xd)

# Generate Predictions
predout <- claudinLow(x=train$xd, classes=as.matrix(train$classes$Group,ncol=1), y=test$xd)

# Obtain results
results <- cbind(predout$predictions, predout$distances)
#write.table(results,"T.E.9CELL.LINE_results.txt",sep="\t",col=T, row=F)
}
\seealso{
\code{\link[genefu]{medianCtr}}, \code{\link[genefu]{claudinLowData}}
}


