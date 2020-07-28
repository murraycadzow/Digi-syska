# can use a shiny interface to interactively fill in the parameters:
knit_with_parameters('scholar/example_parameter_template.Rmd')


# or prgrammatically create reports by iterating over supplied values
ids <- c("B7vSqZsAAAAJ", "amYIKXQAAAAJ&hl")

create_report <- function(id){
  # does create awful file names in this instance because scholar ids are ugly
  # but this function could be altered to make them much nicer

  rmarkdown::render("scholar/example_parameter_template.Rmd", # name of markdown document to use
                    params = list(id = id), # values for the parameter
                    output_file = paste0("report_", id,".html")) # output file name of compiled doc
}


purrr::map(ids, create_report)


# same task but using a for loop instead
# and without creating custom function to make it nicer
for(person in ids){
  rmarkdown::render("scholar/example_parameter_template.Rmd",
                    params = list(id = person),
                    output_file = paste0("report_", person,".html"))
}
