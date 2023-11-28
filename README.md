# Uranus
A tool for producing source code from markdown code blocks.

Following the language with a # marks that block as an example or snippet. This code will not be included in the compiled file - this is useful for breaking down code into code bit by bit in documentation.
~~~
```rust #
fn f(x: i32) -> i32 {
    ...
}
```
~~~
Following # with some sort of identifier allows that snippet to be compiled in isolation and ran for testing small snippets.
~~~
```haskell #fib
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
```
~~~
