# Author: Jeremiah Anderson
# Email: jeanderson@bnl.gov
# License: GPLv3.0
# Date created: 2020-12-24
# Date last modified:

#' A function to plot LI600 flash data
#'
#' This function will plot the flash data from the LI600 to aid in ensuring
#' proper flash parameters are used.  It will plot the full plot and
#' top 5%, 2.5%, and 1%.
#'
#' @param flash_df  flash data frame.  Data frame should only contain data from a single flash.
#' @param main_title  main plot title.
#' @importFrom graphics axis mtext par points
#' @export

LI600_plot_flash <- function(flash_df, main_title=NULL){
  opar <- par(no.readonly = T)

  x_range <- range(flash_df$TIME)
  y_max <- max(flash_df$FLR)
  y_min <- min(flash_df$FLR)
  y_diff <- y_max-y_min

  title_list <- c("100%", "Top 1%", "Top 2.5%", "Top 5%")
  y_min_list <- c(y_min, y_max*0.99, y_max*0.975, y_max*0.95)

  par(mar=c(2,3,1,0.1) + 0.1, mfrow=c(2,2), oma=c(0,0,2,0))

  for(i in 1:4){
    plot(x_range, c(y_min_list[i], y_max), type="n", ylab=NA, xlab=NA, xaxt="n", yaxt="n")
    axis(side=2, las=2, font=2)
    axis(side=1, las=1, font=2)
    points(flash_df$TIME, flash_df$FLR, pch=16)
    mtext(title_list[i], side=3, line=0, font=2)
  }
  
  if(is.null(main_title)){
    mtext(flash_df$flashId[1], side=3, line=0, font=2, outer=T)
  }else if(!is.null(main_title)){
    mtext(main_title, side=3, line=0, font=2, outer=T)
  }

  par(opar)
  return(NULL)
}
