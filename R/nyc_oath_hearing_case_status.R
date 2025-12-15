#' OATH Hearings Division Case Status
#'
#' Downloads OATH Hearings Division Case Status data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing OATH Hearings Division Case Status data.
#'
#' @details
#' The OATH Hearings Division Case Status dataset contains information about alleged public safety and quality of life violations that are filed and adjudicated through the City’s administrative law court, the NYC Office of Administrative Trials and Hearings (OATH) and provides information about the infraction charged, decision outcome, payments, amounts and fees relating to the case.
#' The summonses listed in this dataset are issued and filed at the OATH Hearings Division by City enforcement agencies.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/City-Government/OATH-Hearings-Division-Case-Status/jz4z-kudi/about_data>
#'
#' @examples
#' # Quick example (fetch 5 rows)
#' small_sample <- nyc_oath_hearing_case_status(limit = 5)
#' head(small_sample)
#'
#' \donttest{
#' nyc_oath_hearing_case_status(limit = 5000)
#' nyc_oath_hearing_case_status(filters = list(respondent_address_borough = "BROOKLYN"))
#' }
#' @export
nyc_oath_hearing_case_status <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/jz4z-kudi.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "hearing_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", filters, "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  resp <- httr::GET(endpoint, query = query_list)
  httr::stop_for_status(resp)
  data <- jsonlite::fromJSON(httr::content(resp, as = "text"), flatten = TRUE)
  tibble::as_tibble(data)
}
