# Urynus
A tool for producing source code from markdown code blocks.

Following the language with a # marks that block as an example or snippet. This code will not be included in the compiled file - this is useful for breaking down code into code bit by bit in documentation.
```python #fib
def fib(x):
    if x < 2: 
        return x
    else:
        return fib(x-1) + fib(x-2)

print( fib(10))
```
Following # with some sort of identifier allows that snippet to be compiled in isolation and ran for testing small snippets.
```haskell #factorial
fact 0 = 1
fact n = n * fact (n-1)
```

