# Author: Jeremiah Anderson
# Email: jeanderson@bnl.gov
# License: GPLv3.0
# Date created: 2020-12-28
# Date last modified:

#' A function to read LI-600 data files.
#'
#' This function will read LI-600 main data files and remove secondary headers.
#' See \link{LI600_read_flash} for reading flash files.
#'
#' @param file_loc  file containing flash data.  Same format as \link[utils]{read.csv}.
#' @importFrom utils read.csv type.convert
#' @export


LI600_read_data <- function(file_loc){
  li600_df <- type.convert(read.csv(file_loc, skip=1)[-1,], as.is=T)
  return(li600_df)
}
