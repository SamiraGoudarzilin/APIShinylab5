test_that("check that column 1 is numeric",{
  expect_equal(is.numeric(koladaapi()$year), TRUE)
})

test_that("check that column 2 is character",{
  expect_equal(is.character(koladaapi()$gender), TRUE)
})

test_that("check that column 3 is numeric",{
  expect_equal(is.numeric(koladaapi()$value), TRUE)
})

test_that("check that dataframe is returned",{
  expect_equal(is.data.frame(koladaapi()), TRUE)
})

test_that("check that dataframe has 3 columns",{
  expect_equal(ncol(koladaapi()), 3)
})

test_that("check that dataframe is has 42 rows",{
  expect_equal(nrow(koladaapi()), 42)
})

test_that("check that dataframe  does not have 43 rows",{
  expect_false(nrow(koladaapi()) == 43)
})

test_that("check that number of women are 14",{
  expect_equal(nrow(koladaapi()[koladaapi()$gender=="K",]) , 14)
})

test_that("check that number of men are 14",{
  expect_equal(nrow(koladaapi()[koladaapi()$gender=="M",]) , 14)
})

test_that("check number of observations is 42",{
  expect_equal(nrow(koladaapi()[koladaapi()$year,]) , 42)
})
