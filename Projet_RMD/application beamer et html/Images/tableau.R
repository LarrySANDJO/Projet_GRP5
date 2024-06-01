
  {r}
library(knitr)
library(kableExtra)
library(formattable)
library(dplyr, quietly = TRUE)

mtcars[1:5, 1:4] %>%
  mutate(
    car = row.names(.),
    mpg = color_tile("white", "orange")(mpg),
    cyl = cell_spec(cyl, "html",
                    angle = (1:5) * 60,
                    background = "red", color = "white", align = "center"
    ),
    disp = ifelse(disp > 200,
                  cell_spec(disp, "html", color = "red", bold = T),
                  cell_spec(disp, "html", color = "green", italic = T)
    ),
    hp = color_bar("lightgreen")(hp)
  ) %>%
  relocate(car) %>%
  kable("html", escape = FALSE, row.names = FALSE) %>%
  kable_styling("hover", full_width = FALSE) %>%
  column_spec(5, width = "3cm") %>%
  add_header_above(c(" ", "Hello" = 2, "World" = 2))



*Autre personnalisation de tableau gtExtras*
  
library(gtExtras)

mtcars %>%
  head() %>%
  dplyr::select(cyl, mpg) %>%
  dplyr::mutate(
    mpg_pct_max = round(mpg / max(mpg) * 100, digits = 2),
    mpg_scaled = mpg / max(mpg) * 100
  ) %>%
  dplyr::mutate(mpg_unscaled = mpg) %>%
  gt() %>%
  gt_plt_bar_pct(column = mpg_scaled, scaled = TRUE) %>%
  gt_plt_bar_pct(
    column = mpg_unscaled, scaled = FALSE,
    fill = "blue", background = "lightblue"
  ) %>%
  cols_align("center", contains("scale")) %>%
  cols_width(
    4 ~ px(125),
    5 ~ px(125)
  )

