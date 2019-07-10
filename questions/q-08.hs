{-
8. Given an array and a number k where k is smaller than size of array, we need to find the k’th smallest element
in the given array. It is given that ll array elements are distinct. Examples:

Input: arr[] = {7, 10, 4, 3, 20, 15}
k = 3
Output: 7

Input: arr[] = {7, 10, 4, 3, 20, 15}
k = 4
Output: 10
-}

-- Solution --

-- irei utilizar o quicksort por ser o algoritmo de ordenacao visto nas aulas da disciplina
-- e tambem um dos melhores e simples no paradigma funcional
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort l ++ [x] ++ quicksort r
    where
        l  = filter (< x) xs
        r = filter (>= x) xs

khtSmallest arr k = (quicksort arr) !! (k-1)

-- Exemplo
-- no terminal> ghci q-08.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr = [7, 10, 4, 3, 20, 15]
    let result = khtSmallest arr 3
    let result2 = khtSmallest arr 4
    print ""
    print "array = {12, 13, 14, 20, 50}, k = 3"
    print (show result)
    print ""
    print "array = {12, 13, 14, 20, 50}, k = 4"
    print (show result2)