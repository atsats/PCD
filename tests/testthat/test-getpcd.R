test_that("getpcd() returns the requested number of records", {
  # If we ask for 300 records, we should get 300 back
  expect_equal(dim(getpcd(maxrecs=300))[1], 300)
})
