# Urynus
Urynus is a literate programming tool; it allows code to be compiled or ran from
a markdown document. It is heavily inspired by Emacs's 
[org mode](https://orgmode.org/).

## Features
- Building source files from a literate document
- Running snippets in isolation
- Compilation to multiple files

## Urynus Format

Urynus works with traditional markdown codeblocks within triple backticks, not
triple `~`. On the same line, urynus expects a language name and either a target 
file or tag.

~~~
```python main.py
def my_function(a, b):
    # garbage function
    # just needs multiple lines
```
~~~

Here is an example of a tagged snippet which will be ignored at compilation.
~~~
```python #fib
def fib(n):
    if n <= 1:
        return n
    else:
        return fib(n-1) + fib(n-2)
print(fib(8))
```
~~~

