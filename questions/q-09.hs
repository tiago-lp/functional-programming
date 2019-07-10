{-
9. Inversion Count for an array indicates – how far (or close) the array is from being sorted. If array is already
sorted then inversion count is 0. If array is sorted in reverse order that inversion count is the maximum.

Two elements a[i] and a[j] form an inversion if
a[i] > a[j] and i < j. For simplicity, we may
assume that all elements are unique.

Example:
Input: arr[] = {8, 4, 2, 1}
Output: 6
Given array has six inversions (8,4), (4,2),
(8,2), (8,1), (4,1), (2,1).
-}

-- Solution --

inv :: Ord a => [a] -> [(a, a)]
inv [] = []
inv xs = [(a, b) | b <- xs', a > b] ++ inv xs'
    where xs' = tail xs
          a = head xs

countInversions :: [Int] -> Int
countInversions arr = length (inv arr)

-- Exemplo
-- no terminal> ghci q-09.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr = [8,4,2,1]
    print "Input: arr[] = {8, 4, 2, 1}"
    print (show (countInversions arr))