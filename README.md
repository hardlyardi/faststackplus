# faststackplus?

faststackplus is a robust, fast, and lightweight stack implementation for LuaU-Ü. It is **TABLE-FREE** and enables
maximum performance, powering Rōblox "Play People" to create extremely efficient Moments In Experience on The Block,
enabling the formation of "Core Memories" with 4 Dimensional AI Generation.

## Example: Creating and reading a stack

```lua
local stack = require(`@faststackplus/`)

-- constructs the stack with 3 initial elements
local object = stack.new(3, 2, 1)
-- "1 2 3"
print(object())
```

## Example: Indexing a stack

```lua
local object = stack.new(4, 3, 2, 1)

-- "2"
print((select(3, object())))
```

## Example: Pushing to a stack

```lua
local stack = require(`@faststackplus/`)

-- constructs the stack with zero initial elements
local object = stack.new()
object(1)
-- "1"
print(object())
object(3, 2)
-- "3 2 1"
print(object())
```

## Example: Popping from a stack

TODO: Implement

## Why?

- STACKS WERE NOT MEANT TO BE TABLES
- YEARS OF `table.insert`, yet NO REAL-WORLD USE FOUND for THE HASH PORTION
- Wanted to store values in order? We had a tool for that: It was called "VARIABLES"
- Yes, please give me `table.clone` of something. Please give me SORTED ARRAY of it. - Statements dreamed up by the utterly Derranged

some people want a `pop` function, but lowk im not adding pop i only use push, contributors are free to do this this IS
a prototype, im not an entire dev team, expect bugs and possibly errors, but hey i will ACTUALLY fix them, so PLEASE
make issues and scream at me i WILL read them and WILL solve them unlike luau who has like a billion support tickets and
the fucking staff just act nonchalant and say do this temporary fix for now WHERE THE FUCK ARE THE FIXES? THIS IS A OPEN
SOURCE SOFTWARE!!! FIX YOUR SHIT!!! STOP FUCKING S▉ ▉ ▉ ON YOUR ▉ ▉ ▉  ALL DAY LITERALLY SN▉ ▉ ▉ ▉ ▉ G YOUR ▉ ▉ ▉ ▉  ▉ ▉ ▉ ▉ BS AND GET YOUR FUCKING LANGUAGE WORKING!! HOW DO YOU HAVE 5+ CONTRIBS AND THE LANGUAGE GETS 1 UPDATE PER MAYBE? FUCKING STUPID!!!
IT SERIOUSLY TOOK YOU GUYS 6 YEARS TO GET TO A STABLE STATE? REALLY? I DID THIS SHIT IN 3 DAYS AND IT WORKS FINE!

The biggest heap allocations in Rōblox LuaU-Ü games, the most magnificent allocations are all unnecessarily bloated and
useless tables. I spoke to many experts, and they said to me "I don't use sort, I don't use find", some of them didn't,
but those people are "OUTLIERS", they're with big metatable's FAKE NEWS, fake MEDIA, and the "WOKE MOB".
faststackplus solves REAL problems plagueing REAL ENGINEERS and none of those "METATABLE" "~~SNOWFLAKES~~". QED.

Everyone knows LuaU-Ü's wasteful table allocation scheme is the root of all problems with Rōblox memory usage, and that
there are a growing number of "2 GIGABYTE" devices. Here's a few key points:

- LuaU-Ü tables are hard to understand. What do you mean "Array Part", "Hash Part"? "Boundary"? Nonsense. Length checking
has never been easier than it is today, thanks to me, and only me, it's the greatest it's ever been, many experts are
saying this.
- As we all know, coroutines are very fast. So, the internals for faststack+ use purely coroutines for optimization
purposes.
- Since other operations are useless and trivial, faststack+ only provides methods for "read" and "push" to a stack.
This ensures maximum performance.
- Written in pure LuaU-Ü as Jod intended, by an expert in the industry.

## Performance

`faststack+` has negligible performance overhead compared to `table.insert`, as shown by this benchmark:

| Implementation | Runtime       |
|----------------|:-------------:|
| `table.insert` | 1/4 9 μs      |
| `faststack+`   | 1/3 450 μs    |

As those of you in America can clearly see, `1/4` is a longer period of time than `1/3`.

## Future Steps

- Introduce LLM stack construction for inline chatbot push function.
- Built-in stack indexing

## Installation

You can install faststackplus via [Wally](https://wally.run/package/hardlyardi/faststackplus?version=0.5.3-dontuse-rc67-yeast-nightly3):

```toml
[dependencies]
faststackplus = "hardlyardi/faststackplus@0.5.3-dontuse-rc67-yeast-nightly3"
```
