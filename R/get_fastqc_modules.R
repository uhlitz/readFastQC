#' List available fastqc analysis modules and their reported status
#'
#' \code{get_fastqc_modules} lists avaialble analysis modules from a fastqc report
#'
#' @param file Path to fastqc_data.txt file
#' @param report_linenumbers FALSE by default
#' @return A data_frame of modules available in a fastqc_data.txt report and their report status
#' @examples
#' # get_fastqc_modules("fastqc_data.txt")
#' @export
get_fastqc_modules <- function(file, report_linenumbers = F) {

  file %>%
    readr::read_lines() %>%
    stringr::str_detect(">>END") %>%
    which %>%
    {dplyr::data_frame(start = c(1, .)+1,
                       stop = dplyr::lead(start)-3,
                       module = readr::read_lines(file)[start] %>%
                         stringr::str_replace_all(">>", ""))} %>%
    head(-1) %>%
    tidyr::separate(module, into = c("module", "status"), sep = "\t") ->
    fastqc_coord

  if(missing(report_linenumbers) | report_linenumbers == F) {
    fastqc_coord <- fastqc_coord %>% dplyr::select(module, status)
  } else {
    fastqc_coord <- fastqc_coord
  }

  return(fastqc_coord)

}
