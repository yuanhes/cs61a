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
