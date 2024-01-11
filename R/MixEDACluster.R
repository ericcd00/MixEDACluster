#' @importFrom utils browseURL
#' @import rmarkdown

MixEDACluster <- function(data,
                          output_format = rmarkdown::html_document(toc = TRUE, theme = "yeti"),
                          mixedData = TRUE,
                          ContVar,
                          CatVar,
                          output_dir = getwd(),
                          output_file = "report.html",
                          set_title = "Clustering Report") {
  # Sanity checks
  if (missing(data) || missing(ContVar) || missing(CatVar)) {
    stop("There are missing parameters. Check if all the parameters are filled.")
  }

  if (!is.character(ContVar) || length(ContVar) == 0) {
    stop("The parameter *ContVar* must be a string vector.")
  }

  if (!is.character(CatVar) || length(CatVar) == 0) {
    stop("The parameter *CatVar* must be a string vector.")
  }

  report_dir <- system.file("rmd/clustering_rmarkdown.rmd",
                            package = "MixEDACluster")

  suppressWarnings(
    rmarkdown::render(
      input = report_dir,
      output_format = output_format,
      output_dir = output_dir,
      output_file = output_file,
      params = list(data = data, mixedData = mixedData, ContVar = ContVar,
                    CatVar = CatVar, set_title = set_title)
    )
  )

  report_path <- path.expand(file.path(output_dir, output_file))
  browseURL(report_path)
}
