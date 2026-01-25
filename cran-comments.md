## Test environments
* Local R installation: R 4.5.1 on macOS (Apple Silicon)
* win-builder: devel and release
* R-hub: ubuntu-gcc-release

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs.

## Notes
This release adds a new vignette (“Working with NYC 311 Data”) and updates the
NYC 311 wrappers: `nyc_311()` now targets the 2020–present dataset and a new
function, `nyc_311_2010_2019()`, provides access to the historical 2010–2019
dataset.

The package provides access to publicly available NYC Open Data APIs
(https://data.cityofnewyork.us/). All examples that require live HTTP requests
are wrapped in `\dontrun{}` to avoid failures when network access is unavailable
or the API is slow.

The package includes testthat tests for API-facing functions. Network-dependent
tests use vcr/webmockr cassettes for local/CI testing and are skipped on CRAN
via `skip_on_cran()` (no network access is required during CRAN checks).
