test_that("check that column 1 is numeric",{
  expect_equal(is.numeric(koladaapi()$year), TRUE)
})

test_that("check that column 2 is character",{
  expect_equal(is.character(koladaapi()$gender), TRUE)
})

test_that("check that column 3 is numeric",{
  expect_equal(is.numeric(koladaapi()$value), TRUE)
})

