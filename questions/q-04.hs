{-
4. The name of this searching algorithm may be misleading as it works in O(Log n) time. The name
comes from the way it searches an element.

Given a sorted array an element x to be
searched, find position of x in the array.

Input: arr[] = {10, 20, 40, 45, 55}
x = 45
Output: Element found at index 3

Input: arr[] = {10, 15, 25, 45, 55}
x = 15
Output: Element found at index 1

Exponential search involves two steps:
    a. Find range where element is present
    b. Do Binary Search in above found range.

How to find the range where element may be present?

The idea is to start with subarray size 1 compare its last element with x, then try size 2, then 4 and so on until last
element of a subarray is not greater.
Once we find an index i (after repeated doubling of i), we know that the element must be present between i/2 and i
(Why i/2? because we could not find a greater value in previous iteration)
-}

-- Solution --