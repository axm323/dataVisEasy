\name{set_annot_cols}
\alias{set_annot_cols}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Set Annotation Colors
}
\description{
Set colors corresponding to both sample and gene annotations stored in the annotations and annotations.genes parameters of the params list object that are passed to a variety of functions in the dataVisEasy package.
}
\usage{
set_annot_cols(annot_cols)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{annot_cols}{
list for specifying colors for both annotations and annotations.genes manually. Not all annotations in these dataframes must be specified here (default colors will be supplied otherwise when necessary) but all levels of the annotations included must be designated a specific color (see examples)
}
}
\details{
Setting up colors for annotations through use of this function allows for a wide range of versatility for all other functions in the package. The names in the list MUST match with the colnames of annotations or annotations.genes dataframes in the params list object. Setting these colors will result in these colors being present whenever the data is colored for annotations in other functions used in the package. If colors are not specified, default color values will be applied when necessary. (Not all annotations need to have custom colors, those that do not will be given default colors while those that are specified will be shown as such.) If not all of the levels of the associated annotations for samples or genes are specified with their corresponding color, they will be set to white when necessary.

Please see \link[dataVisEasy]{params} for more information about accessing and setting up these variables.
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
Add or update values with \link[dataVisEasy]{update_annot_cols}
}
\examples{

##initiate parameters and annotations
initiate_params()
set_annotations(RAGP_annots)

scatterGenes(RAGP_norm, "Th","Chat", color.by = "State")

##set up list for color annotations and set colors
state.cols <- RColorBrewer::brewer.pal(6,"Set1"); names(state.cols) <- LETTERS[1:6]
annot_cols <- list('Connectivity'=c("SAN-Projecting"="blue","Non-SAN-Projecting"="violet",
                   "No Info Available"="grey"),
                   'Animal'=c("PR1534"="#0571b0","PR1643"="#ca0020","PR1705"="#92c5de",
                   "PR1729"="#f4a582"),
                   "State"=c(state.cols))
set_annot_cols(annot_cols)


scatterGenes(RAGP_norm, "Th","Chat", color.by = "State")

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
