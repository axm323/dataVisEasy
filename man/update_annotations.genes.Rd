\name{update_annotations.genes}
\alias{update_annotations.genes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update Gene Annotations
}
\description{
Update gene annotations stored in annotations.genes parameter of the params list object. See \link[dataVisEasy]{set_annotations.genes} for intially setting the annotations.
}
\usage{
update_annotations.genes(annotation, values)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{annotation}{
title of annotation to be updated or added. If already found in the colnames of the annotations.genes data frame, the previous values for that column will be replaced with the supplied values here. If not found in the colnames of the annotations.genes data frame, values will be added as a new annotation column under the name indicated.
}
  \item{values}{
data frame of values corresponding to the annotation to be updated or added (gene names should be in rownames).
}
}
\details{
If the name of the supplied annotation already exists, will overwrite the previous values. Number of values in updated annotation do not need to be the same length as the pre-existing annotations. This function will merge the annotations, see \link[dplyr]{full_join}. Any missing values will be set to "No_Annot" signifying that no annotation was provided. This is especially useful if annotating clusters where the genes being clustered and annotated is a subset of all genes present, see \link[dataVisEasy]{extractClusters} if added annotations are identifications of cluster groups.  If new or updated values should be shown in the heatmap, must rerun  \link[dataVisEasy]{set_annot_genes}. To add specific colors for the new annotations, see \link[dataVisEasy]{set_annot_cols} and \link[dataVisEasy]{update_annot_cols}.
}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}

%\references{
%% ~put references to the literature/web site here ~
%}
\author{
~~Alison Moss~~
}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See \link[dataVisEasy]{set_annotations.genes} for how to set initially
Works the same as for sample annotations, see \link[dataVisEasy]{update_annotations} for examples
}

%\examples{
%}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
