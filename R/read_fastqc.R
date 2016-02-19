#' Read in a fastqc_data.txt file.
#'
#' \code{readFastQC} parses a fastqc_data.txt file reported by fastqc,
#' a quality control tool for high throughput sequence data.
#'
#' @param file Path to fastqc_data.txt file
#' @param module Module to extract from fastqc_data.txt file
#' @return A data_frame with fastqc report values for the queried module
#' @examples
#' read_fastqc("fastqc_data.txt", "Sequence Length Distribution")
#' @export
read_fastqc <- function(file, module = "Basic Statistics") {

  m <- module
  fastqc_coord <- get_fastqc_modules(file, report_linenumbers = T) %>%
    filter(module == m)

  read_tsv(file,
           skip = fastqc_coord$start,
           n_max = fastqc_coord$stop - fastqc_coord$start) %>%
    setNames(c(str_sub(names(.)[1], 1L+1), names(.)[-1]))

}

