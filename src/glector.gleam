import gleam/float
import gleam/result

pub type Vector2 {
  Vector2(x: Float, y: Float)
}

/// The zero vector, or null vector `(0, 0)`.
pub const zero = Vector2(0.0, 0.0)

/// Adds vector `a` to vector `b`.
/// ```gleam
/// add(Vector2(1.0, 2.0), Vector2(3.0, 4.0)) // -> Vector2(4.0, 6.0)
/// ```
pub fn add(a: Vector2, b: Vector2) {
  Vector2(a.x +. b.x, a.y +. b.y)
}

/// Gets the value of the z component of the cross product of vectors `a` and `b`.
/// 
/// Note: the 2D vectors `a` and `b` are treated as 3D vectors where their z component is zero.
/// ```gleam
/// cross(Vector2(1.0, 2.0), Vector2(3.0, 4.0)) // -> -2.0
/// ```
pub fn cross(a: Vector2, b: Vector2) {
  a.x *. b.y -. a.y *. b.x
}

/// Gets the dot product of vectors `a` and `b`.
/// ```gleam
/// dot(Vector2(-6.0, 8.0), Vector2(5.0, 12.0)) // -> 66.0
/// ```
pub fn dot(a: Vector2, b: Vector2) {
  a.x *. b.x +. a.y *. b.y
}

/// Flips or reverses a vector's direction.
/// ```gleam
/// invert(Vector2(1.0, 2.0)) // -> Vector2(-1.0, -2.0)
/// ```
pub fn invert(v: Vector2) {
  Vector2(v.x *. -1.0, v.y *. -1.0)
}

/// Gets the length of a vector.
/// 
/// Note: it's faster to get a vector's square length than its actual length.
/// So for certain use cases like comparing the length of 2 vectors, I recommend using `length_sq` instead.
/// ```gleam
/// length(Vector2(8.0, -6.0)) // -> 10.0
/// ```
pub fn length(v: Vector2) {
  v
  |> length_sq
  |> float.square_root()
  |> result.unwrap(0.0)
}

/// Gets the square length of a vector.
/// ```gleam
/// length_sq(Vector2(8.0, -6.0)) // -> 100.0
/// ```
pub fn length_sq(v: Vector2) {
  let a = float.absolute_value(v.x)
  let b = float.absolute_value(v.y)
  a *. a +. b *. b
}

/// Gets the linear interpolation between two vectors.
/// ```gleam
/// lerp(Vector2(10.0, 0.0), Vector2(0.0, -10.0), 0.5) // -> Vector2(5.0, -5.0)
/// ```
pub fn lerp(a: Vector2, b: Vector2, t: Float) {
  let x = a.x +. t *. { b.x -. a.x }
  let y = a.y +. t *. { b.y -. a.y }
  Vector2(x: x, y: y)
}

/// Multiplies the x and y components of vectors `a` and `b`.
/// ```gleam
/// multiply(Vector2(1.0, 2.0), Vector2(3.0, 4.0)) // -> Vector2(3.0, 8.0)
/// ```
pub fn multiply(a: Vector2, b: Vector2) {
  Vector2(a.x *. b.x, a.y *. b.y)
}

/// Gets the normal of a vector representing an edge.
/// The winding direction is assumed to be counter-clockwise.
/// ```gleam
/// normal(Vector2(-123.0, 0.0)) // -> Vector2(0.0, -1.0)
/// ```
pub fn normal(v: Vector2) {
  v
  |> swap()
  |> multiply(Vector2(-1.0, 1.0))
  |> normalize()
}

/// Scales a vector such that its length is `1.0`.
/// ```gleam
/// normalize(Vector2(100.0, 0.0)) // -> Vector2(1.0, 0.0)
/// ```
pub fn normalize(v: Vector2) {
  let d = length(v)
  scale(v, 1.0 /. d)
}

/// Multiplies both components of vector `v` by `scalar`.
/// ```gleam
/// scale(Vector2(1.0, 2.0), 2.0) // -> Vector2(2.0, 4.0)
/// ```
pub fn scale(v: Vector2, scalar: Float) {
  Vector2(v.x *. scalar, v.y *. scalar)
}

/// Subtracts vector `b` from vector `a`.
/// ```gleam
/// subtract(Vector2(1.0, 2.0), Vector2(3.0, 4.0)) // -> Vector2(-2.0, -2.0)
/// ```
pub fn subtract(a: Vector2, b: Vector2) {
  Vector2(a.x -. b.x, a.y -. b.y)
}

/// Swaps the x and y components of a vector around.
/// ```gleam
/// swap(Vector2(1.0, -2.0)) // -> Vector2(-2.0, 1.0)
/// ```
pub fn swap(v: Vector2) {
  Vector2(v.y, v.x)
}
