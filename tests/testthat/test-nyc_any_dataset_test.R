test_that("nyc_any_dataset returns a tibble and respects limits", {
  # This 'cassette' will be saved in tests/fixtures/nyc_311_test.yml
  vcr::use_cassette("nyc_any_dataset_test", {

    # We use a small limit (2) to keep the recording file small
    results <- nyc_any_dataset("https://data.cityofnewyork.us/resource/erm2-nwe9.json",limit = 2)

    # Assertions: What should be true?
    expect_s3_class(results, "tbl_df")
    expect_equal(nrow(results), 2)
  })
})

test_that("nyc_urban_park_animal_condition throws errors for bad inputs", {
  # This touches the new 'stop' lines you just added
  expect_error(nyc_any_dataset(limit = "a string"))
  expect_error(nyc_any_dataset(filters = "not a list"))
})
