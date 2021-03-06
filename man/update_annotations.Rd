\name{update_annotations}
\alias{update_annotations}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update Sample Annotations
}
\description{
Update sample annotations stored in annotations parameter of the params list object. See \link[dataVisEasy]{set_annotations} for intially setting the annotations.
}
\usage{
update_annotations(annotation, values)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{annotation}{
title of annotation to be updated or added. If already found in the colnames of the annotations data frame, the previous values for that column will be replaced with the supplied values here. If not found in the colnames of the annotations data frame, values will be added as a new annotation column under the name indicated.
}
  \item{values}{
values corresponding to the annotation to be updated or added.
}
}
\details{
If the name of the supplied annotation already exists, will overwrite the previous values. Number of values in updated annotation do not need to be the same length as the pre-existing annotations. This function will merge the annotations, see \link[dplyr]{full_join}. Any missing values will be set to "No_Annot" signifying that no annotation was provided. This is especially useful if annotating clusters where the genes being clustered and annotated is a subset of all genes present, see \link[dataVisEasy]{extractClusters} if added annotations are identifications of cluster groups. If new or updated values should be shown in the heatmap, must rerun \link[dataVisEasy]{set_annot_samps}. To add specific colors for the new annotations, see \link[dataVisEasy]{set_annot_cols} and \link[dataVisEasy]{update_annot_cols}
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
See \link[dataVisEasy]{set_annotations} for how to set up the initial annotations
}
\examples{
##initiate parameters and annotations
initiate_params()
set_annotations(RAGP_annots)
set_annot_samps(c("Connectivity","Animal","State"))

#view heatmap, extract samples for state A
myHeatmapByAnnotation(RAGP_norm, groupings = "State")
state.A <- subsetSamples(RAGP_norm, group = "State", take.out = "A")

##view heatmap of state A alone and identify clusters
myHeatmap(state.A, col.groups = 3)

##extract clusters of identified state A substates
heatmap.A <- myHeatmap(state.A, col.groups = 3, show.colnames = TRUE)
state.A.sub <- extractClusters(state.A, heatmap = heatmap.A, to.extract = "samples",
  nclusters = 3, SampleGroup_Name = "State_A_Substates")

##update annotations with new cluster identifications, function will properly merge samples
update_annotations("State_A_Substates", state.A.sub)

##reset tracks for heatmaps and visualize
set_annot_samps(c("Connectivity","Animal","State", "State_A_Substates"))
myHeatmapByAnnotation(RAGP_norm, groupings = "State")

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
