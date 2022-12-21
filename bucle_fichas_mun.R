library(dplyr)
library(readxl)

mun_jal <- read_excel("mun_jal.xlsx")


municipios <- mun_jal %>% select(Municipio) %>% pull()


for(i in municipios){
  rmarkdown::render(input = "ficha_municipal_noviembre.Rmd",
                    output_file = paste0("Ficha_Municipal_", i, ".pdf"),
                    rmarkdown::pdf_document(),
                    params = list(country = i))
}