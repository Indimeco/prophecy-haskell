# prophecy

Prophecy is a divination themed card game.

I started this project while reading [learn you a haskell](http://learnyouahaskell.com/) to try experimenting with Haskell to see if I liked it or not.

In sum, I think Haskell has some really cool ideas: 
* list comprehensions
* currying & partial application built in
* everything is a pure function
* robust type classes that can be implemented and derived
* infinite lists

However, I did get bitten by a couple of snakes in the wood
* when using the package ecosystem I had to convert special types from the package to more normal types in the rest of my code 
* the compiler errors were not as helpful as other compilers I've used before. I spent way too long looking at them wondering which part of the code was being referenced and where the problem actually started
* the wealth of features and styles seems to work against Haskell because there are so many options and no idiomatic path
* some language quirks like the loose scope of record syntax, the incompatibility of bytestrings to strings, the inability to coerce Num to Int, etc., left me feeling disappointed
* being unable to skip compiler warnings and run tests anyway made it difficult for me to debug what was actually happening with all the type errors. I spent way more time trying to understand type errors than anything else.

Haskell was a very interesting learning experience and I'll look towards other languages in the future for comparison.
  



