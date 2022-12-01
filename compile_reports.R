library(dplyr)
library(readxl)

mun_jal <- read_excel("mun_jal.xlsx")


countries <- mun_jal %>% select(Municipio) %>% pull()


for(i in countries){
  rmarkdown::render(input = "example_report.Rmd",
                    output_file = paste0("Ficha_Municipal_", i, ".pdf"),
                    rmarkdown::pdf_document(),
                    params = list(country = i))
}