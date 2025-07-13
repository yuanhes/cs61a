* 2025/05/03
  - cs61a/week3: L.7 Functional Abstraction ; L.8 Function Examples
    - Function Decorators:
        ```
        @deco_func
        def triple(x):
            return 3 * x
        ```
        is **identical** to:
        ```
        def triple(x):
            return 3 * x
        triple = deco_func(triple)
        ```
        where the `deco_func` is usually a high-order function that returns function.
    -
* 2025/07/12
   - cs61a Project 4: scheme interpreter
    - `*args` notation: `f(1, 2, 3)` is equivalent to `f(*[1, 2, 3])`. In other words, putting a star in front of a list turns its elements into a series of individual arguments.
