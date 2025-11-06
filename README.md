
# nycOpenData <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/NYC_logo.svg/64px-NYC_logo.svg.png" align="right" width="60"/>

An R package providing easy access to datasets from the [NYC Open
Data](https://data.cityofnewyork.us/) platform.  
The first release (`v0.1.0`) includes the `nyc_311()` function for
retrieving NYC 311 Service Request data in a tidy format.

------------------------------------------------------------------------

## Installation

From **CRAN** (once published)

- install.packages(“nycOpenData”)

Or the development version from **GitHub**

- devtools::install_github(“martinezc1/nycOpenData”)

## Example

``` r
# # Get 5,000 most recent 311 requests
# library(nycOpenData)
# data <- nyc_311(limit = 5000)
# # Filter by agency and city
# filtered <- nyc_311(
#   limit = 2000,
#   filters = list(agency = "NYPD", city = "BROOKLYN")
# )
# 
# head(filtered)
```

## About

`nycOpenData` is designed to make New York City’s open datasets
accessible directly from R — no API keys or manual downloads required.
This package is ideal for students, educators, and researchers who want
to work with real-world data quickly and reproducibly. The first release
(v0.1.0) introduces:

- nyc_311() — for pulling 311 Service Request data

Future releases will include additional functions for:

- For-Hire Vehicles (FHV) – Active
- Parking Violations
- Motor Vehicle Collisions (NYPD)
- and other high-demand NYC Open Data APIs.

## Author

Christian Martinez

<c.martinez0@outlook.com>

GitHub: martinezc1

Developed as part of PSYC 7750G – Reproducible Psychological Research at
Brooklyn College.
