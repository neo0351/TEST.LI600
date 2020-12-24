# Author: Jeremiah Anderson
# Email: jeanderson@bnl.gov
# Date created: 2020-12-23
# Date last modified:

#' A function to read LI-600 flash files
#'
#' This function will read LI-600 files, convert data on top of file into
#' columns, and remove secondary headers.
#'
#' @param file_loc  file containing flash data.  Same format as read.csv.
#' @importFrom utils read.csv type.convert
#' @export

LI600_read_flash <- function(file_loc){
  # read data
  flash_df <- read.csv(file_loc)

  # split out flash data and rename
  flash_data <- flash_df[5:nrow(flash_df), 1:4]
  names(flash_data) <- flash_df[3, 1:4]

  # combine flash data with flash info from line 2
  out_df <- type.convert(data.frame(flash_data, flash_df[2,]), as.is=T)
  # combine data and time, convert to POSIX for ease of use later
  out_df$date <- as.POSIXct(paste(out_df$date, out_df$time))
  # Drop time
  out_df <- out_df[,!names(out_df) %in% "time"]

  return(out_df)
}
