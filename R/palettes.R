#' Brookings Institution palettes
#'
#' Vectors with hex-color codes that correspond to the color palettes outlined in the Brookings Style Guide.
#' x
#'
#' @source Brookings Style Guide
#' x
#'
#'
#' @family brookings palettes
#' @rdname brookings_palettes
#' @export
brookings_colors <-
  c(`brookings blue` = '#003A79',
    # Brand blue
    brand_blue_90 = '#022A4E',
    brand_blue_80 = '#003A70',
    brand_blue_70 = '#1A4E80',
    brand_blue_60 = '#326295',
    brand_blue_50 ='#517EAD',
    brand_blue_40 =   '#7098C3',
    brand_blue_30 =   '#8DADD0',
    brand_blue_20 =   '#A8BDD5',
    brand_blue_10 = '#DDE5ED',

    #Vivid blue
    vivid_blue_90 = '#023147',
    vivid_blue_80 ='#004B6E',
    vivid_blue_70 ='#00649F',
    vivid_blue_60 ='#1479BB',
    vivid_blue_50 ='#1E8AD6',
    vivid_blue_40 ='#3398EA',
    vivid_blue_30 ='#5AADF6',
    vivid_blue_20 ='#8AC6FF',
    vivid_blue_10 ='#BFDFFC',

    # Teal
    teal_90 = "#032B30",
    teal_80 = "#09484F",
    teal_70 = '#116470',
    teal_60 = '#1C8090',
    teal_50 = '#2A9AAD',
    teal_40 = '#3EB2C6',
    teal_30 = '#59C6DA',
    teal_20 = '#7CD9EA',
    teal_10 = '#A6E9F5',

    # Green
    green_90 = "#1A3404",
    green_80 ='#294D0A',
    green_70 ='#33660F',
    green_60 ='#45821B',
    green_50 ='#5CA632',
    green_40 ='#7DBF52',
    green_30 ='#9CD674',
    green_20 ='#BDED9D',
    green_10 ='#DEF5CC',

    # Yellow
    yellow_90 ='#594C09',
    yellow_80 = '#877414',
    yellow_70 ='#C7A70A',
    yellow_60 ='#E0BB00',
    yellow_50 ='#F5CC00',
    yellow_40 ='#FFDD00',
    yellow_30 ='#FFE926',
    yellow_20 ='#FFF170',
    yellow_10 ='#FFF9C2',

    # Orange
    orange_90 ='#663205',
    orange_80 ='#994B08',
    orange_70 ='#B85B0A',
    orange_60 = '#F26D00',
    orange_50 ='#FF851A',
    orange_40 ='#FF9E1B',
    orange_30 ='#FFB24D',
    orange_20 ='#FEC87F',
    orange_10 ='#FBD9A5',

    # Red
    red_90 ='#660507',
    red_80 ='#A00D11',
    red_70 ='#CD1A1C',
    red_60 ='#E22827',
    red_50 ='#ED3A35',
    red_40 ='#F75C57',
    red_30 ='#F98B83',
    red_20 ='#FCB0AA',
    red_10 ='#FDD7D4',

    # Magenta
    magenta_90 ='#510831',
    magenta_80 ='#8D1655',
    magenta_70 ='#A82168',
    magenta_60 ='#BF317B',
    magenta_50 ='#D2468E',
    magenta_40 ='#E160A2',
    magenta_30 ='#EC81B7',
    magenta_20 ='#F5A8CF',
    magenta_10 ='#FAD4E7',

    # Purple
    purple_90 ='#3E2C72',
    purple_80 = '#533C91',
    purple_70 ='#6A50AD',
    purple_60 = '#7C60BF',
    purple_50 ='#8E72D0',
    purple_40 ='#9C82D9',
    purple_30 ='#B59DEA',
    purple_20 ='#D0BEF5',
    purple_10 ='#E9E0FC',

    # Grey
    `PMS 427 C` = "#D0D3D4"
  )

#' Function to extract brookings colors as hex codes
#'
#' @param ... Character names of Brookings_colors
#'
brookings_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (brookings_colors)

  brookings_colors[cols]
}

#' @rdname brookings_palettes
#'
brookings_palettes <- list(
  # BRAND COLORS
  # Use colors from the brand palette whenever possible.
  brand1 = brookings_cols("brookings blue", "vivid_blue_20", "orange_40"),
  brand2 = brookings_cols("brookings blue","orange_40", "PMS 427 C"),
  # Analogous
  #Different shades of the same hue, or of similar hues can be used when the associated
  #values are related
  analogous1 = brookings_cols('brookings blue', 'vivid_blue_20'),
  analogous2 = brookings_cols('brookings blue', 'teal_40'),

  # CONTRASTING
  # Colors on the opposite ends of the spectrum. Use Brookings Blue with Secondary colors.
  contrasting1 = brookings_cols("brookings blue", "orange_40"),
  contrasting2 = brookings_cols("brookings blue", "yellow_50"),

  # SEMANTIC
  # Where applicable, use colors that are associated with certain concepts. For e.g., option 1 shows male and female data, and option 2 show pros and cons or positive and negative data.
  semantic1 = brookings_cols("teal_30", "red_40"),
  semantic2 = brookings_cols("teal_60", "red_80", "yellow_60"),
  semantic3 = brookings_cols("teal_30", "red_40", "yellow_40"),
  pos_neg1= brookings_cols("green_50", "red_70"),
  pos_neg2 = brookings_cols("green_50", "yellow_50", "red_70"),


  # POLITICAL
  # Use red and blue
  # of similar intensity to represent data related to political parties in the US.
  # Do not use the Brand Blue color family to represent a political party.
  political1 = brookings_cols("vivid_blue_60", "red_50"),
  political2 = brookings_cols("vivid_blue_30", "red_30"),
  political3 = brookings_cols("vivid_blue_60", "red_50", "yellow_60"),
  political4 = brookings_cols("vivid_blue_30", "red_30", "yellow_30"),

  # CATEGORICAL
  categorical = c("#2599adff", "#00649fff", "#fd9d1fff", "#f5cc05ff", "#de60a1ff", "#9e0d12ff"),

  # SEQUENTIAL
  sequential1 = c("#00649fff", "#0f78baff", "#1c8ad6ff", "#2e97eaff", "#56adf6ff",
                        "#87c4feff", "#bcdefbff"),
  sequential2 = c("#0d636fff", "#008080ff", "#009a80ff", "#2bb275ff", "#6dc960ff", "#b1dc44ff", "#fce829ff"),

  # Diverging
  diverging = c("#0f78baff", "#739fceff", "#b1c5deff", "#efefefff", "#f6b5a9ff", "#f07867ff", "#e02928ff"),

  # MISCELLANEOUS
  # A pleasing option using Brookings Blue and accent yellow
  misc = brookings_cols("brookings blue", "teal_40", "yellow_50")

)

#' Return function to interpolate a brookings color palette
#'
#' @param palette Character name of palette in brookings_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
brookings_pal <- function(palette = "brand1", reverse = FALSE, ...) {
  pal <- brookings_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scales in the Brookings style

#' @param palette Character name of brookings_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or scale_color_gradientn(), used respectively when discrete is TRUE or FALSE.
#'
#' @section Palettes:
#' \describe{
#'   \item{Analogous}{Different shades of the same hue, or of similar hues can be used when the associated values are related.}
#'   \item{Contrasting}{Colors on the opposite ends of the spectrum. Use Brookings Blue with Secondary colors.}
#'   \item{Semantic}{Where applicable, use colors that are associated with certain concepts. For e.g., semantic1, semantic2, and semantic3 could show subsets of gender data (female, male and other).}
#'   \item{Positive & Negative}{Shows pros, cons and neutral, or positive, negative and neutral data.}
#'   \item{Political}{Use red and blue of similar intensity to represent data related to political parties in the US. Yellow in political3 and political4 represents ‘Independent’ category}
#'   \item{Categorical}{Use categorical palettes to distinguish discrete categories of data that do not have an inherent ordering.}
#'   \item{Sequential}{Sequential palettes can be used to show an inherent order or variations in numeric values.}
#'   \item{Diverging}{Diverging palettes are useful when dealing with negative and positive values or a range of values that have two extremes with a baseline central value, like zero. The Brookings diverging palette should uses two distinct hues of similar brightness and saturation with a neutral color in the middle. Using a discrete set of colors with evenly distributed gradation can improve clarity of values relative to a continuous palette.}
#'   \item{Misc}{A pleasing option using Brookings Blue and accent yellow.}
#' }
#'
#' @name scales_brookings
NULL

#' @rdname scales_brookings
#' @export
scale_color_brookings <- function(palette = "brand1", discrete = TRUE, reverse = FALSE, ...) {
  pal <- brookings_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("brookings_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @rdname scales_brookings
#' @export
scale_fill_brookings <- function(palette = "brand1", discrete = TRUE, reverse = FALSE, ...) {
  pal <- brookings_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("brookings_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
