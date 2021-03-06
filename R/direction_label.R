#' Adds an arrow indicating the direction of play to a ggplot plot
#'
#' @param x_label x position of the centre of the arrow on the plot
#' @param y_label y position of the arrow on the plot
#' @param label_length length of arrow (in x axis units)
#' @param colour colour of the arrow and text
#'
#' @return list of ggplot layers to be added to a ggplot plot
#'
#' @examples
#' library(ggplot2)
#'
#' shots_data <- data.frame(x = c(90, 85, 82, 78, 83),
#'                          y = c(43, 40, 52, 56, 44))
#'
#' p <- ggplot(shots_data, aes(x = x, y = y)) +
#'   annotate_pitch() +
#'   geom_point()
#'
#' # Add direction of play label
#' p + direction_label()
#'
#' @importFrom ggplot2 annotate geom_segment
#' @importFrom grid arrow unit
#'
#' @export
direction_label <- function(x_label = 50,
                            y_label = -3,
                            label_length = 20,
                            colour = "black") {
  layer <- list(
    geom_segment(
      x = x_label - (label_length / 2),
      y = y_label,
      xend = x_label + (label_length / 2),
      yend = y_label,
      arrow = arrow(length = unit(0.02, "npc"),
                    type = "closed"),
      colour = colour),
    annotate(
      "text",
      x = x_label,
      y = y_label - 1,
      label = c("Direction of play"),
      vjust = 1.5,
      size = 3,
      colour = colour
      )
    )

  return(layer)
}
