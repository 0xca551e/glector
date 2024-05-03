import glector.{Vector2}
import startest.{describe, it}
import startest/expect
import test_helpers.{expect_vector_to_roughly_equal}

pub fn main() {
  startest.run(startest.default_config())
}

pub fn vector_tests() {
  describe("vectors", [
    describe("adding vectors", [
      it("can add (+x, +y)", fn() {
        Vector2(12.0, 34.0)
        |> glector.add(Vector2(100.0, 100.0))
        |> expect.to_equal(Vector2(112.0, 134.0))
      }),
      it("can add (-x, -y)", fn() {
        Vector2(12.0, 34.0)
        |> glector.add(Vector2(-100.0, -100.0))
        |> expect.to_equal(Vector2(-88.0, -66.0))
      }),
    ]),
    describe("getting the cross product", [
      it("works", fn() {
        Vector2(1.0, 2.0)
        |> glector.cross(Vector2(3.0, 4.0))
        |> expect.to_equal(-2.0)
      }),
    ]),
    describe("getting the dot product", [
      it("works", fn() {
        Vector2(-6.0, 8.0)
        |> glector.dot(Vector2(5.0, 12.0))
        |> expect.to_equal(66.0)
      }),
    ]),
    describe("inverting a vector", [
      it("works", fn() {
        Vector2(-123.0, 456.0)
        |> glector.invert()
        |> expect.to_equal(Vector2(123.0, -456.0))
      }),
    ]),
    describe("getting the length of vectors", [
      it("works on nonzero vectors", fn() {
        Vector2(8.0, -6.0)
        |> glector.length()
        |> expect.to_equal(10.0)
      }),
      it("works on a zero vector", fn() {
        Vector2(0.0, 0.0)
        |> glector.length()
        |> expect.to_equal(0.0)
      }),
    ]),
    describe("getting the square length of vectors", [
      it("works", fn() {
        Vector2(8.0, -6.0)
        |> glector.length_sq()
        |> expect.to_equal(100.0)
      }),
    ]),
    describe("multiplying vectors", [
      it("works", fn() {
        Vector2(12.0, 34.0)
        |> glector.multiply(Vector2(2.0, -2.0))
        |> expect.to_equal(Vector2(24.0, -68.0))
      }),
    ]),
    describe("getting the normal of a vector representing a line segment", [
      it("returns up when vector is moving left", fn() {
        Vector2(-123.0, 0.0)
        |> glector.normal()
        |> expect.to_equal(Vector2(0.0, -1.0))
      }),
      it("returns left when vector is moving down", fn() {
        Vector2(0.0, 123.0)
        |> glector.normal()
        |> expect.to_equal(Vector2(-1.0, 0.0))
      }),
      it("returns down when vector is moving right", fn() {
        Vector2(123.0, 0.0)
        |> glector.normal()
        |> expect.to_equal(Vector2(0.0, 1.0))
      }),
      it("returns right when vector is moving up", fn() {
        Vector2(0.0, -123.0)
        |> glector.normal()
        |> expect.to_equal(Vector2(1.0, 0.0))
      }),
      it("works on a diagonal vector", fn() {
        Vector2(123.0, -123.0)
        |> glector.normal()
        |> expect_vector_to_roughly_equal(Vector2(0.707, 0.707), 0.001)
        Vector2(-123.0, 123.0)
        |> glector.normal()
        |> expect_vector_to_roughly_equal(Vector2(-0.707, -0.707), 0.001)
      }),
      it("returns the zero vector when the length is 0", fn() {
        Vector2(0.0, 0.0)
        |> glector.normal()
        |> expect.to_equal(Vector2(0.0, 0.0))
      }),
    ]),
    describe("normalizing a vector", [
      it("normalizes vectors whose length is > 0", fn() {
        Vector2(100.0, 0.0)
        |> glector.normalize()
        |> expect.to_equal(Vector2(1.0, 0.0))
        Vector2(0.0, -100.0)
        |> glector.normalize()
        |> expect.to_equal(Vector2(0.0, -1.0))
        Vector2(-100.0, 100.0)
        |> glector.normalize()
        |> expect_vector_to_roughly_equal(Vector2(-0.707, 0.707), 0.001)
      }),
      it("returns the zero vector when the length is 0", fn() {
        Vector2(0.0, 0.0)
        |> glector.normalize()
        |> expect.to_equal(Vector2(0.0, 0.0))
      }),
    ]),
    describe("scaling vectors", [
      it("can scale by a positive value", fn() {
        Vector2(12.0, 34.0)
        |> glector.scale(10.0)
        |> expect.to_equal(Vector2(120.0, 340.0))
      }),
      it("can scale by a negative value", fn() {
        Vector2(12.0, 34.0)
        |> glector.scale(-10.0)
        |> expect.to_equal(Vector2(-120.0, -340.0))
      }),
      it("can scale by 0", fn() {
        Vector2(12.0, 34.0)
        |> glector.scale(0.0)
        |> expect.to_equal(glector.zero)
      }),
    ]),
    describe("subtracting vectors", [
      it("can subtract (+x, +y)", fn() {
        Vector2(12.0, 34.0)
        |> glector.subtract(Vector2(100.0, 100.0))
        |> expect.to_equal(Vector2(-88.0, -66.0))
      }),
      it("can subtract (-x, -y)", fn() {
        Vector2(12.0, 34.0)
        |> glector.subtract(Vector2(-100.0, -100.0))
        |> expect.to_equal(Vector2(112.0, 134.0))
      }),
    ]),
    describe("swapping vectors", [
      it("works", fn() {
        Vector2(1.0, -2.0)
        |> glector.swap()
        |> expect.to_equal(Vector2(-2.0, 1.0))
      }),
    ]),
  ])
}
