librarian::shelf(tidyverse, palmerpenguins, ggbrookings )
devtools::load_all()



# font_add(family = 'myriad-pro', regular = 'inst/fonts/MYRIADPRO-REGULAR.OTF',
#          bold = 'inst/fonts/MYRIADPRO-BOLD.OTF',
#          italic = 'inst/fonts/MYRIADPRO-CONDIT.OTF',
#          bolditalic = 'inst/fonts/MYRIADPRO-BOLDIT.OTF')
showtext_auto()
showtext_opts(dpi = 300)
theme_set(theme_thp())

ggplot(penguins, aes(x = flipper_length_mm,
                     y = body_mass_g)) +
  geom_point(aes(color = sex),
             size = 2,
             show.legend = FALSE) +
  scale_color_brookings('thp_gender', na.translate = FALSE) +
  labs(title = "Penguin flipper and body mass",
       subtitle = "Dimensions for <span style = 'color:#6E2585;'>**male**</span> and <span style = 'color:#006983;'>**female**</span> Adelie, Chinstrap and Gentoo Penguins at Palmer Station LTER",
       caption = '**Source:** Palmer Penguins<br>',
       tag = 'FIGURE 3',
       x = "Flipper length (mm)",
       y = "Body mass (g)",
       color = "Penguin sex") +
  facet_wrap(. ~ species, nrow = 3, ncol = 1) +
  scale_x_continuous(expand = expansion()) +
  scale_y_continuous(expand = expansion())

ggsave("penguins.png", dpi=300, height=5.5, width=4, units="in", bg = '#FAFAFA')

penguins_plot <- add_logo('penguins.png', logo_path = 'thp', 'bottom right', 5, height_padding = 0.02)


image_write(penguins_plot, "penguins.png")
