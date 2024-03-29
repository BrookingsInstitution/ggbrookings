#' Import and register Inter font
#'
#' \code{import_inter()} tests to see if Inter is imported and registered. If
#' Inter, isn't imported and registered, then \code{import_inter()} imports and
#' registers Inter with
#' \href{https://github.com/wch/extrafont}{library(extrafont)}.
#'
#' Note: Inter must be installed on your computer for \code{import_inter()} to
#' work. Inter is Brooking's main font. To install, visit
#' \href{https://fonts.google.com/specimen/Inter}{Google fonts} and click
#' "Download family". Unzip and open each of the .ttf files and click install.
#'
#'
#' @md
#' @export
import_inter <- function() {
  if (sum(grepl("[Ii]nter$", extrafont::fonts())) > 0) {
    "Inter is already imported and registered."
  } else {

    # get a list of all fonts on the machine
    local_fonts <- systemfonts::system_fonts()

    # subset the list to just inter fonts
    inter_fonts <- local_fonts[grepl(pattern = "[Ii]nter", x = local_fonts$family), ]

    # create a vector of directories where inter fonts are located
    inter_directories <- unique(gsub("[Ii]nter.*\\.ttf", "", inter_fonts$path))

    # import the inter fonts
    extrafont::font_import(paths = inter_directories, pattern = "[Ii]nter")

    # register the fonts
    extrafont::loadfonts()
  }
}




#' @title Import THP fonts
#' @description Imports Photina, Helvetica Neue, and Myriad Pro
#' @details import_*() functions taken from hrbrthemes.
#' @seealso
#'  \code{\link[extrafont]{font_import}}
#' @rdname import_thp_fonts
#' @export
#' @importFrom extrafont font_import

import_thp_fonts <- function() {

  if (sum(grepl("[Mm]yriad Pro$", extrafont::fonts())) > 0) {
    print("Myriad Pro is already imported and registered.")
  } else{
    import_myriad_pro()
  }
  # Photina
  if (sum(grepl("[Pp]hotina", extrafont::fonts())) > 0) {
    print("Photina is already imported and registered.")
  } else{
  import_photina()
  }

  # Helvetica
  if (sum(grepl("[Hh]elveticaNeueLT", extrafont::fonts())) > 0) {
    print("Helvetica is already imported and registered.")
  } else{
    import_helvetica()
  }

}



import_photina <- function() {
  photina_font_dir <- system.file("fonts", "Photina", package = "ggbrookings")

  suppressWarnings(suppressMessages(extrafont::font_import(paths = photina_font_dir, prompt = FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      photina_font_dir
    )
  )
}

import_helvetica <- function(){
  helvetica_font_dir <- system.file("fonts", "Helvetica", package = "ggbrookings")

  suppressWarnings(suppressMessages(extrafont::font_import(paths = helvetica_font_dir, prompt = FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      helvetica_font_dir
    )
  )
}

import_myriad_pro <- function(){
  myriad_pro_font_dir <- system.file("fonts", "Myriad-Pro", package = "ggbrookings")

  suppressWarnings(suppressMessages(extrafont::font_import(paths = myriad_pro_font_dir, prompt = FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      myriad_pro_font_dir
    )
  )
}




#' Register Hamilton Fonts
#'
#' @param dpi set dpi (default is 300)
#'
#' @export
register_thp_fonts <- function(dpi = 300){

 path <- system.file(package = "ggbrookings", 'fonts')

    sysfonts::font_add(family = 'photina',
                       regular = glue::glue('{path}/Photina/Photina.ttf'))
    sysfonts::font_add(
      family = 'myriad-pro',
      regular = glue::glue('{path}/Myriad-Pro/MYRIADPRO-REGULAR.OTF'),
      bold = glue::glue('{path}/Myriad-Pro/MYRIADPRO-SEMIBOLD.OTF'),
      italic = glue::glue('{path}/Myriad-Pro/MYRIADPRO-CONDIT.OTF'),
      bolditalic = glue::glue('{path}/Myriad-Pro/MYRIADPRO-BOLDIT.OTF')
    )

    sysfonts::font_add(
      family = 'helvetica',
      regular = glue::glue('{path}/Helvetica/HelveticaNeueLTStd-Lt.OTF'),
      bold = glue::glue('{path}/Helvetica/HelveticaNeueLTStd-Md.OTF'),
    )

    showtext::showtext_auto()
    showtext::showtext_opts(dpi = dpi)
}


