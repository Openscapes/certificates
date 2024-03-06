library(googlesheets4)
# library(tidyverse)


## Test: Render a single pdf with default values for params

quarto::quarto_render(
  input = "certificate-pathways-template.qmd",
  output_format = "pdf",
  output_file = "report-test.pdf"
)


## Render a pdf for each row in 'certificates_data_pathways_2024' Google Sheet

participants <- read_sheet("https://docs.google.com/spreadsheets/d/1HEv1q4TCvE8dM1ZgZubXo8pBgIQwITFzOf589lV9D4I/")

for (i in 1:nrow(participants)) {
  row <- participants[i,]
  quarto::quarto_render(
    input = "certificate-pathways-template.qmd",
    output_format = "pdf",
    output_file = paste0(row$participant_name, "_Certificate_Pathways-to-Open-Science2024.pdf"),
    execute_params = list(
      participant_name = row$participant_name
    )
  )
}


