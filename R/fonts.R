#' Import and register Roboto font
#'
#' \code{import_roboto()} tests to see if Roboto is imported and registered. If
#' Roboto, isn't imported and registered, then \code{import_roboto()} imports and
#' registers Roboto with
#' \href{https://github.com/wch/extrafont}{library(extrafont)}.
#'
#' Note: Roboto must be installed on your computer for \code{import_roboto()} to
#' work. Roboto is Brooking's main font. To install, visit
#' \href{https://fonts.google.com/specimen/roboto}{Google fonts} and click
#' "Download family". Unzip and open each of the .ttf files and click install.
#'
#'
#' @md
#' @export
import_roboto <- function() {
  if (sum(grepl("[Rr]oboto$", extrafont::fonts())) > 0) {
    "Roboto is already imported and registered."
  } else {

    # get a list of all fonts on the machine
    local_fonts <- systemfonts::system_fonts()

    # subset the list to just roboto fonts
    roboto_fonts <- local_fonts[grepl(pattern = "[Rr]oboto", x = local_fonts$family), ]

    # create a vector of directories where roboto fonts are located
    roboto_directories <- unique(gsub("[Rr]oboto.*\\.ttf", "", roboto_fonts$path))

    # import the roboto fonts
    extrafont::font_import(paths = roboto_directories, pattern = "[Rr]oboto")

    # register the fonts
    extrafont::loadfonts()
  }
}

import_photina <- function() {


  if (sum(grepl("[Pp]hotinaMTW04-Regular$", extrafont::fonts())) > 0) {
    "Photina is already imported and registered."
  } else {

    # get a list of all fonts on the machine
    local_fonts <- systemfonts::system_fonts()

    # subset the list to just photina fonts
    photina_fonts <- local_fonts[grepl(pattern = "[Pp]hotina", x = local_fonts$family), ]

    # create a vector of directories where photina fonts are located
    photina_directories <- unique(gsub("[Pp]hotina.*\\.ttf", "", photina_fonts$path))

    # import the photina fonts
    extrafont::font_import(paths = photina_directories, pattern = "[Pp]hotina", prompt = FALSE)

    # register the fonts
    extrafont::loadfonts()
  }
}
