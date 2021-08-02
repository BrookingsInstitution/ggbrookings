## code to prepare `animal_rescues` dataset goes here

# Setup -------------------------------------------------------------------
librarian::shelf(tidyverse, systemfonts, ggtext, ragg)
scoobydoo <-
  readr::read_csv(
    'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv',
    na = 'NULL'
  )
# Tidy --------------------------------------------------------------------
scoobydoo <-
  scoobydoo %>%
  pivot_longer(
    starts_with('caught'),
    names_to = 'caught_by',
    names_prefix = 'caught_',
    values_to = 'caught'
  ) %>%
  mutate(caught_by = snakecase::to_title_case(caught_by)) %>%
  separate_rows(monster_type, sep = ',', convert = TRUE) %>%
  drop_na(monster_type) %>%
  filter(monster_type != '') %>%
  mutate(
    across(monster_type,
           ~ str_trim(.x) %>% as_factor),
    monster_type = recode(monster_type,
                          Possessed = "Possessed Object",
                          Disguise = "Disguised")
  )


usethis::use_data(scoobydoo, overwrite = TRUE)
