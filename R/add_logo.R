#' Add a logo to your plot or image
#' This function places a logo at one of the corners of your image/plot
#' @param plot_path url or local file for the plot
#' @param logo_path url, local file for the logo, or one of the built in logos. Can be a character string in c('brookings','es', 'gs', 'fp', 'metro', 'global', 'bi', 'bc', 'cc', 'ccf', 'ceaps', 'cepm', 'chp', 'cmep', 'csd', 'cti', 'crm', 'cue', 'cuse', 'doha', 'hc', 'tsinghua')
#' @param logo_position Optional. Valid options are 'top left', 'top right', 'bottom left', and 'bottom right'. Default logo position is 'bottom right'.
#' @param logo_scale Optional. The portion of the plot width the logo should occupy. The default is 5 which means that the logo will be 1/5th of the plot width.
#' @param height_padding Optional. Control the y axis position of a logo by specifying the padding proportion. Default is 4.5% padding.
#' @param width_padding Optional. Control the x axis position of a logo by specifying the padding proportion. Default is 1% padding.
#'
#' @return
#' @export
#' @import magick
#'
add_logo <- function(plot_path, logo_path =  c('brookings','es', 'gs', 'fp', 'metro', 'global', 'bi', 'bc', 'cc', 'ccf', 'ceaps', 'cepm', 'chp', 'cmep', 'csd', 'cti', 'crm', 'cue', 'cuse', 'doha', 'hc', 'tsinghua'), logo_position = 'bottom left', logo_scale = 5, height_padding = 0.045, width_padding = 0.02){

  # Requires magick R Package https://github.com/ropensci/magick

  # Useful error message for logo position
  if (!logo_position %in% c("top right", "top left", "bottom right", "bottom left")) {
    stop("Error Message: Uh oh! Logo Position not recognized\n  Try: logo_positon = 'top left', 'top right', 'bottom left', or 'bottom right'")
  }


  if(logo_path %in% c('brookings','es', 'gs', 'fp', 'metro', 'global', 'bi', 'bc', 'cc', 'ccf', 'ceaps', 'cepm', 'chp', 'cmep', 'csd', 'cti', 'crm', 'cue', 'cuse', 'doha', 'hc', 'tsinghua')){
    logo_path <- match.arg(logo_path)

    logo_path <- system.file(package = 'ggbrookings', glue::glue('logos/{logo_path}.png'))
  } else{
    logo_path
  }
  # read in raw images
  plot <- magick::image_read(plot_path)
  logo_raw <- magick::image_read(logo_path)

  # get dimensions of plot for scaling
  plot_height <- magick::image_info(plot)$height
  plot_width <- magick::image_info(plot)$width

  # default scale to 1/10th width of plot
  # Can change with logo_scale
  logo <- magick::image_scale(logo_raw, as.character(plot_width/logo_scale))

  # Get width of logo
  logo_width <- magick::image_info(logo)$width
  logo_height <- magick::image_info(logo)$height

  # Set position of logo
  # Position starts at 0,0 at top left
  # Use 0.01 for 1% - aesthetic padding

  if (logo_position == "top right") {
    x_pos = plot_width - logo_width - width_padding * plot_width
    y_pos = height_padding * plot_height
  } else if (logo_position == "top left") {
    x_pos = width_padding * plot_width
    y_pos = height_padding * plot_height
  } else if (logo_position == "bottom right") {
    x_pos = plot_width - logo_width - width_padding * plot_width
    y_pos = plot_height - logo_height - height_padding * plot_height
  } else if (logo_position == "bottom left") {
    x_pos = width_padding * plot_width
    y_pos = plot_height - logo_height - height_padding * plot_height
  }

  # Compose the actual overlay
  magick::image_composite(plot, logo, offset = paste0("+", x_pos, "+", y_pos))

}
