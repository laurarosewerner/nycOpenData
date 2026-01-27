# Street Hail Livery (SHL) Drivers - Active

Downloads Street Hail Livery (SHL) Drivers - Active data from NYC Open
Data.

## Usage

``` r
nyc_street_hail_livery_active(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Street-Hail-Livery-SHL-Drivers-Active/5tub-eh45/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Street Hail Livery (SHL) Drivers - Active data.

## Details

NYC TLC licensed drivers that are currently active, in good standing and
authorized to operate Street Hail Livery (SHL) vehicles. This list is
accurate to the date and time represented in the Last Date Updated and
Last Time Updated fields.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_street_hail_livery_active(limit = 2)
  small_sample

  nyc_street_hail_livery_active(filters = list(status_description = "SHL UNRESTRICTED"))
}
#> # A tibble: 10,000 × 7
#>    license_number name            status_code status_description expiration_date
#>    <chr>          <chr>           <chr>       <chr>              <chr>          
#>  1 5947911        MEJIA,ISAAC,G   1           SHL UNRESTRICTED   2028-09-26T00:…
#>  2 5964957        TAVERAS,SANCHE… 1           SHL UNRESTRICTED   2026-12-02T00:…
#>  3 6061478        SURMAVA,ZVIAD   1           SHL UNRESTRICTED   2026-12-21T00:…
#>  4 5172977        HUSSAIN,QAZI,A… 1           SHL UNRESTRICTED   2028-08-10T00:…
#>  5 5798853        PEREZ-RAMIREZ,… 1           SHL UNRESTRICTED   2026-08-17T00:…
#>  6 5383922        MAMUN,ABDULLAH… 1           SHL UNRESTRICTED   2027-03-10T00:…
#>  7 878097         VITTINI,JACINT… 1           SHL UNRESTRICTED   2026-10-15T00:…
#>  8 5265431        HOSSAIN,ANWAR   1           SHL UNRESTRICTED   2028-09-07T00:…
#>  9 5779398        DEVILLABEJJANI… 1           SHL UNRESTRICTED   2026-04-24T00:…
#> 10 6044560        CHEN,GAOSHAN    1           SHL UNRESTRICTED   2026-10-17T00:…
#> # ℹ 9,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
# }
```
