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
getMid left right =  left + ((right - left) `div` 2)

bSearch arr left right x
    | right >= left && (arr !! getMid left right) == x = getMid left right
    | right >= left && (arr !! getMid left right) > x = bSearch arr left ((getMid left right) - 1) x
    | right >= left && (arr !! getMid left right) <= x = bSearch arr ((getMid left right) + 1) right x
    | otherwise = -1

generateMid arr i x
    | (i < (length arr)) && (arr !! i) <= x = generateMid arr (i*2) x
    | otherwise = i 

-- ira retornar o indice do elemento ou -1 caso o elemento nao esteja no array
expSearch arr x
    | (arr !! 0) == x = 0
    | otherwise = bSearch arr ((generateMid arr 1 x) `div` 2) (minimum [generateMid arr 1 x, (length arr)]) x

-- Exemplo
-- no terminal> ghci q-04.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr = [12, 13, 14, 20, 50]
    let result = expSearch arr 20
    print "array = {12, 13, 14, 20, 50}, x = 20"
    print ("O elemento esta no indice: " ++ (show result))