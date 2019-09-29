# collatz

Write a method to determine a number's Collatz sequence
Find the number (1 to 1,000,000) with the longest Collatz sequence

To determine the Collatz sequence given a particular starting number, use the following rule set:

Given an input of n, the next number in is defined by:

n → n/2 (n is even)
n → 3n + 1 (n is odd)
Using the rule above we can determine what the Collatz Sequence for the following numbers are.

n	sequence	length
1	1	1
2	2 → 1	2
3	3 → 10 → 5 → 16 → 8 → 4 → 2 → 1	8
4	4 → 2 → 1	3
5	5 → 16 → 8 → 4 → 2 → 1	6
6	6 → 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1	9
7	7 → 22 → 11 → 34 → 17 → 52 → 26 → 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1	17
Find the input that produces the longest chain of Collatz values from 1 to 1,000,000.

Mathematicians conjecture that given any integer input, the sequence will end with a value of 1, but it isn't proven that a cycle
will not occur and that every number has a finite sequence length.
