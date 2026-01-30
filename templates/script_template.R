#' [INSERT DATASET TITLE]
#'
#' Downloads [INSERT DATASET TITLE] data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing [INSERT DATASET TITLE] data.
#'
#' @details
#' [INSERT 2-3 SENTENCES DESCRIBING WHAT THIS DATA IS. EXPLAIN WHAT THE]
#' [ROWS REPRESENT AND WHY A RESEARCHER WOULD USE THIS.]
#'
#' @source NYC Open Data: <[INSERT LINK TO DATASET ABOUT PAGE]>
#'
#' @examples
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_[function_name](limit = 2)
#'   small_sample
#'
#'   # Example with a filter (Change 'column_name' and 'value' to real fields)
#'   # nyc_[function_name](limit = 2, filters = list(column_name = "value"))
#' }
#' }
#' @export
nyc_[function_name] <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  # Get the JSON endpoint from the 'API' button on NYC Open Data
  endpoint <- "[INSERT_JSON_ENDPOINT_URL]"
  
  query_list <- list(
    "$limit" = limit,
    "$order" = "[INSERT_DATE_COLUMN] DESC" # Choose a date column to sort by
  )
  
  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }
  
  # This uses the internal package helper to fetch the data
  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}