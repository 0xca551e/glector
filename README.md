# glector

2D vector math for Gleam!

[![Package Version](https://img.shields.io/hexpm/v/glector)](https://hex.pm/packages/glector)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/glector/)

```sh
gleam add glector
```

```gleam
import glector.{Vector2}

pub fn main() {
  glector.dot(Vector2(-6.0, 8.0), Vector2(5.0, 12.0)) // -> 66.0
}
```

Further documentation can be found at <https://hexdocs.pm/glector>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
