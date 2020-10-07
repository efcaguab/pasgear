## code to prepare `cambodia_iri` dataset goes here
library(magrittr)

iri_cambodia <- readr::read_csv("data-raw/iri_cambodia.csv") %>%
  janitor::clean_names()

usethis::use_data(iri_cambodia, overwrite = TRUE)
