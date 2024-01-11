#' @importFrom utils browseURL
#' @import rmarkdown

MixEDACluster <- function(data,
                          output_format = rmarkdown::html_document(theme = "yeti"),
                          mixedData = TRUE,
                          ContVar,
                          CatVar,
                          output_dir = getwd(),
                          output_file = "report.html",
                          Title = "Data Profiling Report") {

  report_dir <- system.file("rmd/clustering_rmarkdown.rmd",
                            package = "MixEDACluster")

  suppressWarnings(
    rmarkdown::render(
      input = report_dir,
      output_format = output_format,
      output_dir = output_dir,
      output_file = output_file,
      params = list(data = data, mixedData = mixedData, ContVar = ContVar,
                    CatVar = CatVar, set_title = Title)
    )
  )

  report_path <- path.expand(file.path(output_dir, output_file))
  browseURL(report_path)
}
