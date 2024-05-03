import gleam/float
import gleam/string
import glector.{type Vector2}
import startest/assertion_error.{AssertionError}

fn roughly_equals(actual, expected, leniency) {
  float.absolute_value(actual -. expected) <=. leniency
}

pub fn expect_vector_to_roughly_equal(
  actual: Vector2,
  expected: Vector2,
  leniency,
) {
  case
    roughly_equals(actual.x, expected.x, leniency),
    roughly_equals(actual.y, expected.y, leniency)
  {
    True, True -> Nil
    _, _ ->
      AssertionError(
        string.concat([
          "Expected ",
          string.inspect(actual),
          " to equal ",
          string.inspect(expected),
        ]),
        string.inspect(actual),
        string.inspect(expected),
      )
      |> assertion_error.raise
  }
}
