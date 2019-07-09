{-# LANGUAGE FlexibleContexts #-}

{-
2. Given a sorted array and a number x, find a pair in array whose sum is closest to x. Examples:

Input: arr[] = {10, 22, 28, 29, 30, 40}, x = 54
Output: 22 and 30
Input: arr[] = {1, 3, 4, 7, 10}, x = 15
Output: 4 and 10

Following is detailed algorithm.

1) Initialize a variable diff as infinite (Diff is used to store the
    difference between pair and x). We need to find the minimum diff.
2) Initialize two index variables l and r in the given sorted array.
    (a) Initialize first to the leftmost index: l = 0
    (b) Initialize second the rightmost index: r = n-1
3) Loop while l < r.
    (a) If abs(arr[l] + arr[r] - sum) < diff then
        update diff and result
    (b) Else if(arr[l] + arr[r] < sum ) then l++
    (c) Else r--
-}

-- Solution --

getAbs arr x left right = abs ((arr !! left) + (arr !! right) - x)

getNewRight arr x left right
    | ((arr !! left) + (arr !! right)) > x = right - 1
    | otherwise = right

getNewLeft arr x left right
    | ((arr !! left) + (arr !! right)) <= x = left + 1
    | otherwise = left

getClosest arr x n result_l result_r left right diff
    | right > left && (getAbs arr x left right) < diff = getClosest arr x n left right (getNewLeft arr x left right) (getNewRight arr x left right) (getAbs arr x left right)
    | right > left && (getAbs arr x left right) >= diff = getClosest arr x n result_l result_r (getNewLeft arr x left right) (getNewRight arr x left right) diff
    | otherwise = [arr !! result_l, arr !! result_r]

-- obs.: O valor 1000000000 eh um valor maximo arbitrario
closest arr x = getClosest arr x (length arr) 0 0 0 ((length arr) - 1) 1000000000

-- Exemplo
-- no terminal> ghci q-02.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr1 = [10, 22, 28, 29, 30, 40]
    let x1 = 54
    let arr2 = [1, 3, 4, 7, 10]
    let x2 = 15
    let result1 = closest arr1 x1
    let result2 = closest arr2 x2
    print "array = {10,22,28,29,30,40}, x = 54"
    print ((show (result1 !! 0)) ++ " and " ++ (show (result1 !! 1)))
    print "array = {11, 3, 4, 7, 10}, x = 15"
    print ((show (result2 !! 0)) ++ " and " ++ (show (result2 !! 1)))