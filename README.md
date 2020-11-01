# Erlang Propositional Calculus

**erlang_propositional_calculus** is a simple Erlang module for working with propositional logic calculus.

## Public functions

1. **truth_table/1** - Prints a boolean algebra truth table for an anonymous function.
2. **implies/2** - Simule the ➞ operator of propositional functions.

## Examples

1. Prints the truth table of the logical propositional function `(A ∧ B)`:
```
F1 = fun(A, B) -> A and B end,
propositional_calculus:truth_table(F1).
Truth table of a function with 2 parameters:
- [0,0] => 0
- [0,1] => 0
- [1,0] => 0
- [1,1] => 1
[ok,ok,ok,ok]
```

2. Simule the *implies* operator for the `(A ∧ ¬B) ➞ C` function and prints its truth table:
```
F2 = fun(A, B, C) -> propositional_calculus:implies(A and not B, C) end,
propositional_calculus:truth_table(F2).
Truth table of a function with 3 parameters:
- [0,0,0] => 1
- [0,0,1] => 1
- [0,1,0] => 1
- [0,1,1] => 1
- [1,0,0] => 0
- [1,0,1] => 1
- [1,1,0] => 1
- [1,1,1] => 1
[ok,ok,ok,ok,ok,ok,ok,ok]
```
