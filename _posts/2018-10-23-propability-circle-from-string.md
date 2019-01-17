---
layout: post
title: propability of making circle from strings
comments: false
categories:
  - tips
tags:
  - mathematic
  - propability
---

This is the question which I was asked today in the job interview.

I wasn't in the good mood to think carefully for it.
However, it's been bugging me when I recalled the interview.

The question was:

> What is the propability of making a circle from 3 strings?

The correct answer would be 1/9 (I think).

But, I think it's better to make a generic answer for this question.

For a given `n` strings, if we can make a circle from that `n` strings,
we can remove the `nth` strings, and make a circle from the remaining
`n-1` strings by tying the open heads together.
Hence, we should have something like this:

> pₙ = pₙ₋₁ * pₓₙ

Obviously, we have `p₁ = 1`.

For a given circle from `n-1` strings,
we can untie any tie to have a long strings,
and now, we have `n` heads (`n-2` tied heads and 2 open heads)
to be chosen to tie the `nth` string into it.

Hence, we will have `n²` ways to tie the `nth` string into the untied strings,
and in those ways, we can only have 2 ways to make a circle.

Hence, the answer is like this:

> pₙ = 2ⁿ⁻¹/(n!)²
