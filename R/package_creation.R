#' NYC 311 Service Requests
#'
#' Downloads NYC 311 Service Request data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing 311 Service Request data.
#' @examples
#' \dontrun{
#' nyc_311(limit = 5000)
#' nyc_311(filters = list(agency = "NYPD", city = "BROOKLYN"))
#' }
#' @export

nyc_311 <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/erm2-nwe9.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "created_date DESC"
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


