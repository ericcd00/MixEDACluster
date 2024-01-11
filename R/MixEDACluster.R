
MixEDACluster <- function(data,
                          mixedData,
                          ContVar,
                          CatVar,
                          OutputDir,
                          OutputFile,
                          Title) {

  report_dir <- system.file("rmd/clustering_markdown.rmd", 
                            package = "MixEDACluster")  
  
  suppressWarnings(render(
    input = report_dir,
    output_format = output_format,
    OutputFile = OutputFile,
    OutputDir = OutputDir,
    params = list(data = data, mixedData = mixedData, ContVar = ContVar, 
                  CatVar = CatVar, Title = Title)
  ))
  
  report_path <- path.expand(file.path(OutputDir, OutputFile))
  browseURL(report_path)
  
}
