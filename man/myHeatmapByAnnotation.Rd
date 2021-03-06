\name{myHeatmapByAnnotation}
\alias{myHeatmapByAnnotation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create a Customizable Heatmap of Expression Data while Separating the Data to be Grouped by a Specified Annotation
}
\description{
Creates a heatmap of supplied expression data with options to subset for specific genes/variables and with a variety of customizable options for aesthetics. Draws from params list object for parameters such as the range of the plotted data, the colors used. Annotations are drawn from annotations for samples/observations and annotations.genes for genes/variables both stored in the params list object(although other options are available, see below). See params for more information on these parameters and how to specify them.
}
\usage{
myHeatmapByAnnotation(data, list = NULL, exact = TRUE, groupings, groupings.gaps = NULL,
  groupings.genes = FALSE, groupings.genes.gaps = NULL, method = "pearson",
  linkage = "complete", NA.handling = "pairwise.complete.obs", clust.rows = TRUE,
  clust.cols = TRUE, scale.rows = FALSE, row.groups = NA, col.groups = NA,
  gaps.row = TRUE, gaps.row.spec = NULL, gaps.col = TRUE, gaps.col.spec = NULL,
  gap.width = 1, main = NULL, order.by.gene = NULL, order.by.sample = NULL,
  fontsize.row = 10, fontsize.col = 10, show.rownames = T, show.colnames = F,
  treeheight.row = 20, treeheight.col = 20, cell.width = NA, cell.height = NA,
  hide.plot = FALSE, na.fix = FALSE, na.offset = 2, is.raw.Ct = FALSE,
  show.legend = TRUE, show.annotations = TRUE, drop.annot.levels = TRUE,
  annotation.names.row = TRUE, annotation.names.col = TRUE,border.color = NA,
  na.color = "grey90")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
numeric data matrix with samples/observations in the columns and genes/variables in the rows
}
  \item{list}{
character vector of genes/variables to be pulled out of the data matrix for viewing. If left as NULL, all the rownames of the supplied data matrix will be plotted
}
  \item{exact}{
whether or not to search for exact or inexact matches of 'list' in 'data'. If exact = T (default) heatmap will plot genes/variables that exactly match the list supplied. If set to FALSE, will search for inexact matches.
}
  \item{groupings}{
groupings describing how the columns should be split, must be supplied or set to FALSE if separating columns by annotation is not desired. If params$annotations have been set, can accept a character vector of length 1 to 3 referring to the annotations data frame stored in params. If character vector is of length 2 or 3, samples will be sorted by each annotation consecutively allowing a variety of organizations for samples with multiple annotations. Can also accept a named factor or a data frame where the first column of the data frame will be used for the annotations and the names and rownames of the factor and data frame respectively match the colnames of the data. In all of these cases, the order and length of the named annotations need not match that of the colnames of the data supplied. Subsetting and ordering will be done within the function. The final option is to supply an unnamed factor, in which case the annotations indicated by the factor must match the order of the colnames in the data for accurate representation. See params and set_annotations for more information.
}
  \item{groupings.gaps}{
numeric vector the same length as a character vector supplied to groupings if it points to annotations in params$annotations. The default of NULL will result in a gap in between each annotation specified. Mostly useful in scenarios where 2 or 3 levels are provided and allows flexibility in how they will be displayed. Numeric values provided also work in tandem with each other. For example a vector of c(1,1) for a supplied groupings vector of length 2 will place 1 space in between levels of the first annotation and an additional space in between levels of the second annotaiton. A vector of c(0,1) will still order the samples by the annotations as indicated but will only place gaps in between the levels of the second annotation supplied.
}
  \item{groupings.genes}{
groupings describing how the rows should be split if desired. If params$annotations.genes have been set, can accept a character vector of length 1 to 3 referring to the annotations data frame stored in params. If character vector is of length 2 or 3, genes/variables will be sorted by each annotation consecutively allowing a variety of organizations for genes with multiple annotations. Can also accept a named factor or a data frame where the first column of the data frame will be used for the annotations and the names and rownames of the factor and data frame respectively match the rownames of the data. In all of these cases, the order and length of the named annotations need not match that of the rownames of the data supplied. Subsetting and ordering will be done within the function. The final option is to supply an unnamed factor, in which case the annotations indicated by the factor must match the order of the rownames in the data for accurate representation. See params and set_annotations.genes for more information.
}
  \item{groupings.genes.gaps}{
same as groupings.gaps but corresponding to the annotations supplied in groupings.genes
}
  \item{method}{
method to be used to calculate distance matrix for clustering. Accepts values to be passed to cor() such as "pearson" (default), "spearman", and "kendall" which well then be coerced to a distance matrix or any options accepted by dist()
}
  \item{linkage}{
linkage clustering method used for clustering and to be passed to hclust().  Accepts all methods accepted by hclust()
}
  \item{NA.handling}{
how missing values should be handled in the case of correlations, passed to the "use" argument of cor()
}
  \item{clust.rows}{
should rows be clustered, default = TRUE. When TRUE, rows will be clustered within each annotation
}
  \item{clust.cols}{
should columns be clustered, default = TRUE. When TRUE, columns will be clustered within each annotation
}
  \item{scale.rows}{
whether or not the rows should be scaled. Default is not to scale rows with options to median center, "median", or zscore, "zscore". Regardless of method used, the range of the heatmap will still be linked to the range indicated in the params list object.
}
  \item{row.groups}{
numeric to be passed to cutree(). Will split the dendrogram into the number of groups indicated. Only usable if groupings.genes is not provided
}
  \item{col.groups}{
numeric to be passed to cutree(). Will split the dendrogram into the number of groups indicated. Only usable if groupings is set to FALSE
}
  \item{gaps.row}{
logical: if gaps should be inserted between annotations of rows. Can also be achieved by setting groupings.genes.gaps to 0 if referring to annotations.genes stored in params. In the case of supplied factor or dataframe, gaps will be placed between each level of the annotation unless set to FALSE
}
  \item{gaps.row.spec}{
option to specify and override the gaps inserted in between the annotations in the rows. Numeric vector indicating specific placements of gaps along the rows
}
  \item{gaps.col}{
logical: if gaps should be inserted between annotations of columns. Can also be achieved by setting groupings.gaps to 0 if referring to annotations stored in params. In the case of supplied factor or dataframe, gaps will be placed between each level of the annotation unless set to FALSE
}
  \item{gaps.col.spec}{
option to specify and override the gaps inserted in between the annotations in the columns. Numeric vector indicating specific placements of gaps along the columns
}
  \item{gap.width}{
numeric indicating the width of gaps along both rows and columns. Works in tandem with both gaps.row.spec/gaps.col.spec and groupings.gaps/groupings.genes.gaps where the indicated gaps from the previous arguments will be widened by the factor indicated.
}
  \item{main}{
title of heatmap. Default will display "Genes of Interest:" followed by the genes supplied in the list argument with the clustering method and linkage displayed underneath.
}
  \item{order.by.gene}{
optional character equal to one of the rownames of the data to order the columns of the data by increasing levels of indicated row. If groupings is supplied, each group of the annotations will be ordered by the supplied gene.
}
  \item{order.by.sample}{
optional character equal to one of the colnames of the data to order the rows of the data by increasing levels of indicated column. If groupings.genes is supplied, each group of the row annotaitons will be ordered by the supplied sample.
}
  \item{fontsize.row}{
size of font for row names
}
  \item{fontsize.col}{
size of font for column names
}
  \item{show.rownames}{
logical: value determining if rownames should be displayed, default = TRUE
}
  \item{show.colnames}{
logical: value determining if colnames should be displayed, default = FALSE
}
  \item{treeheight.row}{
the height of a dendrogram tree for rows, if these are clustered. Default value 20 points.
}
  \item{treeheight.col}{
the height of a dendrogram tree for columns if these are clustered. Default value 20 points.
}
  \item{cell.width}{
individual cell width in points. If left as NA, then the values depend on the size of plotting window.
}
  \item{cell.height}{
individual cell height in points. If left as NA, then the values depend on the size of plotting window.
}
  \item{hide.plot}{
should the plot be displayed
}
  \item{na.fix}{
logical: should missing values be treated as NA or be set to a low value (see na.offset). Values will still be colored gray in heatmap but may aid in clustering when many missing values are present.
}
  \item{na.offset}{
option to treat missing/NA values as an offset from the minimum value. Ex a value of 2 will set missing values to min(data) - 2. Values will still be colored gray in heatmap but may aid in clustering when many missing values are present.
}
  \item{is.raw.Ct}{
logical. If set to TRUE, will reverse the scale of the data to indicate low values as high expression as in the case of raw Ct values from qPCR, in this case, missing values will also be set to a high value to reflect low expression level.
}
  \item{show.legend}{
logical: should legend be shown
}
  \item{show.annotations}{
logical: should annotation legend be shown
}
  \item{drop.annot.levels}{
logial: should annotations not included in the output heatmap be shown in the annotation legend.
}
  \item{annotation.names.row}{
logial value showing if the names for row annotation tracks should be drawn
}
  \item{annotation.names.col}{
logial value showing if the names for column annotation tracks should be drawn
}
  \item{border.color}{
color for borders, default set to NA
}
  \item{na.color}{
color for cells with NA values
}
}
\details{
This function utilizes pheatmap to display a heatmap of supplied data with the options to group both samples and genes by any annotations attributed to them. User can specify the genes/variables to be displayed in the heatmap which will be subset within the function itself. All samples/observations supplied will be plotted. myHeatmapByAnnotation() draws many of its parameters from the params object. params$scale.range indiates the range of data to be displayed in the heatmap. Values outside this range will be squished to fit this range after clustering where values above will be indicated with the highest expression levels and values below will be indicated with the lowest expression level. params$scale.colors holds the colors used in the heatmap and params$n.colors.range is a numeric value indicating how many diffrent colors should be allowed. For both groupings and groupings.genes, the function will refer to annotations and annotations.genes respectively within the params object. Subset of the annotations present in annot_samps and annot_genes within the params object indicate which annotations should be present along the top and left side of the heatmap.If the colors corresponding to the levels of these annotations are specified in params$annot_cols, the inicated colors will be used, if not supplied, defualt colors will be assigned to show the annotation levels. For more information on the setting of parameters found in the params list object, see params and the associated functions to set and update these values with set_'parameter' where 'parameter' is equal to any of the above parameters listed above.A subtitle for the heatmap indicates the method for clustering/creation of a distance matrix and the linkage method used for clustering.

For more details on how the groupings and groupings.genes as well as the corresponding gaps are created from an input of a character vector pointing to annotations and annotations.genes stored in the params list object, see \link[dataVisEasy]{makefactorgroup}
}
\value{
a pheatmap object
}
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
See \link[dataVisEasy]{params}, \link[dataVisEasy]{set_scale.range}, \link[dataVisEasy]{set_scale.colors}, \link[dataVisEasy]{set_n.colors.range},\link[dataVisEasy]{set_annotations}, \link[dataVisEasy]{set_annotations.genes}, \link[dataVisEasy]{set_annot_samps}, \link[dataVisEasy]{set_annot_genes}, and \link[dataVisEasy]{set_annot_cols} for more information on setting up annotations and associated colors.
}
\examples{
##initiate parameters, set up annotations
initiate_params()
set_annotations(RAGP_annots)
set_annot_samps(c("Connectivity","Animal","State")) ##which annotations show up in heatmap

##specify colors of annotations
state.cols <- RColorBrewer::brewer.pal(6,"Set1"); names(state.cols) <- LETTERS[1:6]
annot_cols <- list('Connectivity'=c("SAN-Projecting"="blue","Non-SAN-Projecting"="violet",
                          "No Info Available"="grey"),
                   'Animal'=c("PR1534"="#0571b0","PR1643"="#ca0020","PR1705"="#92c5de",
                            "PR1729"="#f4a582"),
                   "State"=c(state.cols))
set_annot_cols(annot_cols)



##plot heatmap according to annotations, adjust width
myHeatmapByAnnotation(RAGP_norm, groupings = "State")
myHeatmapByAnnotation(RAGP_norm, groupings = "State", gap.width = 3)

##ordering by specific gene will order in each annotation group separately
myHeatmapByAnnotation(RAGP_norm, list = c("Th","Chat","Gal","Sst","NeuN","Adra1b","Chrm2"),
    groupings = "State", order.by.gene = "Th")
myHeatmapByAnnotation(RAGP_norm, list = c("Th","Chat","Gal","Sst","NeuN","Adra1b","Chrm2"),
    groupings = "State", order.by.gene = "Chrm2")

##plot according to multiple annotations, specify gaps between annotations
myHeatmapByAnnotation(RAGP_norm, groupings = c("Connectivity","State"))
myHeatmapByAnnotation(RAGP_norm, groupings = c("Connectivity","State"), groupings.gaps = c(0,3))
myHeatmapByAnnotation(RAGP_norm, groupings = c("Animal","Connectivity","State"),
  groupings.gaps = c(0,1,3))

#separate by annotations in not shown heatmap tracks
myHeatmapByAnnotation(RAGP_norm, groupings = "Sex")

##customize gaps
myHeatmapByAnnotation(RAGP_norm, groupings = "Sex", gaps.col.spec = c(100, 200, 300, 400))

#see \link[dataVisEasy]{myHeatmap} for more examples of aesthetics
#all the above specifications can be applied to gene annotations (if available) as well

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
