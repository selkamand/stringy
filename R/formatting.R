#' Make strings prettier for printing
#'
#' Takes an input string and 'beautify' it by converting from 'programmerStyle' to 'Human Friendly Formatted'
#'
#' @param string A character vector, or something coercible to one.
#' @param capitalisation Which words should be capitalised (see Details for more info)
#' @param trimws trim leading and trailing and whitespace
#' @param space_camel turn camelCase into camel space (flag)
#' @param space_snake turn snake_case into snake space  (flag)
#' @param space_bracket turn \code{bracketed(words)} into \code{bracketed (words)}  (flag)
#' @return human friendly formatted version of input string (character)
#'
#' @details
#' \strong{Capitalisation Options}
#'
#'  | foo | bar |
#'    | :--- | --- |
#'  | title | This is Title Case |
#'  | all | Every Word Is Capitalised |
#'  | first | First word is capitalised |
#'  | lowercase | every letter is lower case |
#'  | unchanged | Whatever is INPUT IS OUTPUT |
#'
#' @export
prettify <- function(string,
                     capitalisation = c('all', 'first', 'title', 'lower', 'unchanged'),
                     trimws = TRUE,
                     space_camel = TRUE,
                     space_snake = TRUE,
                     space_bracket = TRUE
                     ){

  capitalisation <- rlang::arg_match(capitalisation)

  # snake_case to snake case
  if(space_snake)
    string <- gsub(x=string, pattern = "_", replacement = " ")

  # camelCase to camel Case
  if(space_camel){
    string <- gsub(x=string, pattern = "([a-z])([A-Z])", replacement = "\\1 \\2")
  }

  # word(brackets) to word (brackets)
  if(space_bracket){
    # left side space
    string <- gsub(x=string, pattern = '([a-zA-Z])([\\(\\{\\[\\<])', replacement = '\\1 \\2')
  }

  # Trim whitespace (left and right)
  if(trimws){
    string <- trimws(string)
  }

  # Apply Case Formatting
  if(capitalisation == "title")
    string <- tools::toTitleCase(text = string)
  else if(capitalisation == "all"){
    string <- gsub(x=string, pattern = "^([a-z])",  perl = TRUE, replacement = ("\\U\\1"))
    string <- gsub(x=string, pattern = " (\\(?[a-z])",  perl = TRUE, replacement = (" \\U\\1"))
  }
  else if(capitalisation == "first"){
    string <- gsub(x=string, pattern = "([A-Z])",  perl = TRUE, replacement = ("\\L\\1"))
    string <- gsub(x=string, pattern = "^([a-z])",  perl = TRUE, replacement = ("\\U\\1"))
  }
  else if(capitalisation == "lower"){
    string <- gsub(x=string, pattern = "([A-Z])",  perl = TRUE, replacement = ("\\L\\1"))
  }
  else if(capitalisation == "unchanged"){
    # do nothing
  }


  # # Autodetect units (and move to brackets)
  # if (autodetect_units) {
  #   string <- sub("\\sm(\\s|$)", " (m)", string)
  #   string <- sub("\\smm(\\s|$)", " (mm)", string)
  #   string <- sub("\\sm(\\s|$)", " (cm)", string)
  #   string <- sub("\\sm(\\s|$)", " (km)", string)
  #   string <- sub("\\sg(\\s|$)", " (g)", string)
  #   string <- sub("\\skg(\\s|$)", " (kg)", string)
  #   string <- sub("\\smg(\\s|$)", " (mm)", string)
  #   string <- sub("\\soz(\\s|$)", " (oz)", string)
  #   string <- sub("\\slb(\\s|$)", " (lb)", string)
  #   string <- sub("\\sin(\\s|$)", " (in)", string)
  #   string <- sub("\\sft(\\s|$)", " (ft)", string)
  #   string <- sub("\\syd(\\s|$)", " (yd)", string)
  #   string <- sub("\\smi(\\s|$)", " (mi)", string)
  # }
  #
  # # Add space after apostrophe
  # if (space_after_apostrophe) {
  #   string <- gsub(x = string, pattern = "([[:alnum:]]\\')([^[:space:]])", replacement = "\\1 \\2")
  # }




  return(string)
}

