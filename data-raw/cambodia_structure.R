## code to prepare `cambodia_iri` dataset goes here
library(magrittr)

cambodia_structure <- readr::read_csv("data-raw/iri_cambodia.csv") %>%
  janitor::clean_names() %>%
  dplyr::select(type, dplyr::contains("percent"), -percent_iri) %>%
  dplyr::mutate(type = dplyr::if_else(type == "N/A", NA_character_, type)) %>%
  dplyr::rename(percent_n = percent_no, percent_freq = percent_frq) %>%
  dplyr::mutate_if(is.numeric, ~ ./100)

usethis::use_data(cambodia_structure, overwrite = TRUE)
