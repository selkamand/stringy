
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stringy

<!-- badges: start -->

[![R-CMD-check](https://github.com/selkamand/stringy/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/stringy/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

stringy makes it easy to transform strings / character vectors in oddly
specific ways. Common problems stringy solves include:

- Converting variable names to versions that look good as plot axis
  labels (‘camelCase_plus_snake_case’ =\> ‘Camel Case Plus Snake Case’)

## Installation

You can install the development version of stringy from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("selkamand/stringy")
```

## Quick Start

``` r
library(stringy)

ugly_string <- "reallyUglyPoorly_formattedString(not_really_though)"

# Make Pretty
prettytext(string = ugly_string)
#> [1] "Really Ugly Poorly Formatted String (not Really Though)"


# Customise output
prettytext(string = ugly_string, capitalisation = "first")
#> [1] "Really ugly poorly formatted string (not really though)"
```
