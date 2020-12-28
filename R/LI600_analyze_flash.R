# Author: Jeremiah Anderson
# Email: jeanderson@bnl.gov
# License: GPLv3.0
# Date created: 2020-12-28
# Date last modified:

#' A function to read and plot LI600 flash data
#'
#' This is a convenience function that combines \link{LI600_read_flash} and \link{LI600_plot_flash}.
#'
#' @param file_loc  file containing flash data.  Same format as \link[utils]{read.csv}.
#' @param main_title  main plot title.
#' @export

LI600_analyze_flash <- function(file_loc, main_title){
  LI600_plot_flash(LI600_read_flash(file_loc), main_title=NULL)
}
