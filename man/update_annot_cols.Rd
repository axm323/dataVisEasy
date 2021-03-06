\name{update_annot_cols}
\alias{update_annot_cols}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update Annotation Colors
}
\description{
Update sample annotations stored in annotations parameter of the params list object. See \link[dataVisEasy]{set_annotations} for intially setting the annotations.

Update colors corresponding to both sample and gene annotations stored in the annotations and annotations.genes parameters of the params list object that are passed to a variety of functions in the dataVisEasy package. See \link[dataVisEasy]{set_annot_cols} for intially setting the annotations.
}
\usage{
update_annot_cols(annotation, values.list)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{annotation}{
title of annotation to be updated or added. If already found in the names of the annot_cols list, the previous values for that annotation will be replaced with the supplied values here. If not found in the names of the annot_cols list, values will be added as a new item under the name indicated.
}
  \item{values.list}{
values corresponding to the annotation to be updated or added.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

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
to set annot_cols, see \link[dataVisEasy]{set_annot_cols}
}
\examples{

#genemod.cols <- brewer.pal(7,"Set3"); names(genemod.cols) <- LETTERS[1:7]
#update_annot_cols("GeneMods",c(genemod.cols))

##initiate parameters and annotations
initiate_params()
set_annotations(RAGP_annots)


##set up list for color annotations and set colors
annot_cols <- list('Connectivity'=c("SAN-Projecting"="blue","Non-SAN-Projecting"="violet",
                   "No Info Available"="grey"),
                   'Animal'=c("PR1534"="#0571b0","PR1643"="#ca0020","PR1705"="#92c5de",
                   "PR1729"="#f4a582"))
set_annot_cols(annot_cols)

scatterGenes(RAGP_norm, "Th","Chat", color.by = "State")

##add specified color annotations to already existing list
state.cols <- RColorBrewer::brewer.pal(6,"Set1"); names(state.cols) <- LETTERS[1:6]
update_annot_cols("State", state.cols)

scatterGenes(RAGP_norm, "Th","Chat", color.by = "State")


##update and overwrite previous colors
state.cols <-c("red","orange","yellow","green","purple","violet");names(state.cols) <- LETTERS[1:6]
update_annot_cols("State", state.cols)

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
