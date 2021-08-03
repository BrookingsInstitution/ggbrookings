#' View brookings palettes
#'
#'\code{brookings_view_palette} displays the colors and hexadecimal codes for colors in brookings palettes.
#'
#' @param palette Options are `brand1`, `brand2`, `analogous1`, `analogous2`, `contrasting1`, `contrasting2`, `gender1`, `gender2`, `gender3`, `pos_neg1`, `pos_neg2`, `political1`, `political2`, `political3`, `political4`, `categorical`, `sequential1`, `sequential2`, `diverging`, and `misc`
#'
#' @export
#'
#' @examples
#' brookings_view_palette()
#' brookings_view_palette('brand1')
#'
#' @section Palettes:
#' \describe{
#'   \item{Analogous}{Different shades of the same hue, or of similar hues can be used when the associated values are related.}
#'   \item{Contrasting}{Colors on the opposite ends of the spectrum. Use Brookings Blue with Secondary colors.}
#'   \item{Semantic}{Where applicable, use colors that are associated with certain concepts. For e.g., semantic1, semantic2, and semantic3 could show subsets of gender data (female, male and other).}
#'   \item{Positive & Negative}{Shows pros, cons and neutral, or positive, negative and neutral data.}
#'   \item{Political}{Use red and blue of similar intensity to represent data related to political parties in the US. Yellow in political3 and political4 represents ‘Independent’ category}
#'   \item{Misc}{A pleasing option using Brookings Blue and accent yellow.}
#' }
brookings_view_palette <- function(palette = 'brand1') {
  if(!(palette %in% names(brookings_palettes))){
    stop(paste(palette,"is not a valid palette name for brookings_palettes.\n"))
  }
  palette = brookings_palettes[[palette]]
  color_palette <- unname(rev(palette))
  print(paste0("c(", paste(color_palette, collapse = ", "), ")"))
  scales::show_col(palette)
}
