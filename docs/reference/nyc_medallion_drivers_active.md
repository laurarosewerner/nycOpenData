# Medallion Drivers - Active

Downloads Medallion Drivers - Active data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_active(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Drivers-Active/jb3k-j3gp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Medallion Drivers - Active data.

## Details

This is a list of drivers with a current TLC Driver License, which
authorizes drivers to operate NYC TLC licensed yellow and green taxicabs
and for-hire vehicles (FHVs). This list is accurate as of the date and
time shown in the Last Date Updated and Last Time Updated fields.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_medallion_drivers_active(limit = 2)
  small_sample

  nyc_medallion_drivers_active(filters = list(type = "MEDALLION TAXI DRIVER"))
}
#> # A tibble: 10,000 × 6
#>    license_number name                   type  expiration_date last_updated_date
#>    <chr>          <chr>                  <chr> <chr>           <chr>            
#>  1 5434338        ZHAGUI,TRANSITO,C      MEDA… 2026-05-08T00:… 2026-01-27T00:00…
#>  2 6110901        HOSSAIN,MOHAMMED,EMAM  MEDA… 2028-08-15T00:… 2026-01-27T00:00…
#>  3 5490789        HOSSAIN,MD,B           MEDA… 2028-08-05T00:… 2026-01-27T00:00…
#>  4 5119828        ASAFO-ADJEI,EDWARD     MEDA… 2028-11-21T00:… 2026-01-27T00:00…
#>  5 5442897        RUIZ-AMADOR,ERICK,JUN… MEDA… 2026-07-12T00:… 2026-01-27T00:00…
#>  6 6006824        NAQVI,SHAMSHER,HAIDER  MEDA… 2028-12-07T00:… 2026-01-27T00:00…
#>  7 6075595        GEORGI,DENIS           MEDA… 2027-07-22T00:… 2026-01-27T00:00…
#>  8 6059721        KOSTRYKIN,DMYTRO       MEDA… 2026-12-18T00:… 2026-01-27T00:00…
#>  9 6020239        VASQUEZ CABREJA,JOSE,… MEDA… 2026-03-10T00:… 2026-01-27T00:00…
#> 10 5850384        LEGERET,SANCHEZ,EDISO… MEDA… 2027-03-27T00:… 2026-01-27T00:00…
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: last_updated_time <chr>
# }
```
