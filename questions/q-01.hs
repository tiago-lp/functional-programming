{-
1. The Interpolation Search is an improvement over Binary Search for instances, where the values in a
sorted array are uniformly distributed. Binary Search always goes to middle element to check. On the
other hand interpolation search may go to different locations according the value of key being searched.
For example if the value of key is closer to the last element, interpolation search is likely to start search
toward the end side.
To find the position to be searched, it uses following formula.

// The idea of formula is to return higher value of pos
// when element to be searched is closer to arr[hi]. And
// smaller value when closer to arr[lo]
pos = lo + [ (x-arr[lo])*(hi-lo) / (arr[hi]-arr[Lo]) ]
arr[] ==> Array where elements need to be searched
x     ==> Element to be searched
lo    ==> Starting index in arr[]
hi    ==> Ending index in arr[]

- Algorithm
Rest of the Interpolation algorithm is same except the above partition logic.
Step1: In a loop, calculate the value of “pos” using the probe position formula.
Step2: If it is a match, return the index of the item, and exit.
Step3: If the item is less than arr[pos], calculate the probe position of the left sub-array. Otherwise calculate the
same in the right sub-array.
Step4: Repeat until a match is found or the sub-array reduces to zero.
-}

-- Solution --

getPos arr x lo hi = lo + (((hi - lo) `div` ((arr !! hi) - (arr !! lo))) * (x - (arr !! lo)))

continue arr x lo hi | lo <= hi && x >= (arr !! lo) && x <= (arr !! hi) = True
                     | otherwise = False

decideIsLo arr x lo | (arr !! lo) == x = lo
                    | otherwise = -1

interpolationSearch arr x lo hi
    | (continue arr x lo hi) && (lo == hi) = decideIsLo arr x lo
    | (continue arr x lo hi) && ((arr !! (getPos arr x lo hi)) == x ) = getPos arr x lo hi
    | (continue arr x lo hi) && ((arr !! (getPos arr x lo hi)) < x ) = interpolationSearch arr x ((getPos arr x lo hi) + 1) hi
    | (continue arr x lo hi) && ((arr !! (getPos arr x lo hi)) > x ) = interpolationSearch arr x ((getPos arr x lo hi) - 1) hi
    | otherwise = -1

-- Exemplo
-- no terminal> ghci q-01.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr = [20, 22, 23, 26, 28, 29, 30, 31, 32, 33, 34, 43, 45, 52, 57]
    let lo = 0
    let hi = (length arr) - 1
    let x = 28
    let result = interpolationSearch arr x lo hi
    print result
