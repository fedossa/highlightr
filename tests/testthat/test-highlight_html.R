context("Test html highlight function")

text <- c("This is a good test with some bad words",
          "bad is red and good is green")

dict <- data.frame(
  feature = c("good", "bad"),
  bg_colour = c("green", "red"),
  txt_colour = c("red", "green"),
  bold = TRUE,
  italic = TRUE,
  strike_out = TRUE,
  stringsAsFactors = FALSE
)


test_that("highlighting works", {
  expect_equal({
    temp <- tempfile()
    writeLines(
      highlight(text, dict,
                output = "html",
                return = TRUE),
      temp,
      useBytes = TRUE
    )
    readLines(temp)
  }, readLines("../files/markdown.html")
  )
})
