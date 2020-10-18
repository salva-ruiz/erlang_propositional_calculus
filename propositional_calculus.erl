%% propositional_calculus - Module for working with propositional calculus.
%% Author Salva Ruiz [http://salvaruiz.me]
%%
%% Public functions:
%% - implies/2 - Simule the -> operator in propositional functions.
%% - truth_table/1 - Prints a boolean algebra truth table for an anonymous
%% function.
%%
%% Prints the truth table of the logical propositional function (A ∧ B):
%%
%% > propositional_calculus:truth_table(A and B).
%%
%% Simules the implies operator for the (A ∧ ¬B) -> C function and prints its
%% truth table::
%%
%% > F1 = propositional_calculus:implies(A and not B, C).
%% > F1 = propositional_calculus:truth_table(F1).

-module(propositional_calculus).
-export([truth_table/1, implies/2]).

truth_table(Function) ->
    {arity, Arity} = erlang:fun_info(Function, arity),
    io:format("Truth table of a function with ~w parameters:~n", [Arity]),
    Premises = list_of_premises(Arity),
    [print_premise(P, apply(Function, P)) || P <- Premises].

implies(true, false) -> false;
implies(_, _)        -> true.

%% ------------------
%% Internal functions
%% ------------------

list_of_premises(Arity) ->
    Bits = round(math:pow(2, Arity)),
    Premises = lists:seq(0, Bits - 1),
    [number_to_premise(P, Arity) || P <- Premises].

number_to_premise(Number, Bits) ->
    BitsString = io_lib:format("~*.2.0B", [Bits, Number]),
    [bit_to_bool(Bit) || Bit <- BitsString].

bit_to_bool($0) -> false;
bit_to_bool($1) -> true.

bool_to_bit(false)   -> 0;
bool_to_bit(true)    -> 1;
bool_to_bit(Premise) -> [bool_to_bit(B) || B <- Premise].

print_premise(Premise, Result) ->
    io:format("- ~w => ~w~n", [bool_to_bit(Premise), bool_to_bit(Result)]).
