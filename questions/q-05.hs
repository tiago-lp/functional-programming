-- 5. Implementar a estrutura de dados Heap e seus algoritmos (usando datatype) em Haskell

-- Solution --

data Heap = Heap {
    heap :: [Int]
,   index :: Int
} deriving (Show, Eq)

parent pos = (pos - 1) / 2

left pos = (pos * 2 + 1)

right pos = (pos * 2 + 1) + 1

isEmpty heap = (index heap) == -1

updateHeap index heapArr
    | (indexOfBigElement heapArr index (parent index)) == index
        && (parent index) /= index = updateHeap (parent index) (swap index (parent index) heapArr)
    | otherwise = heapArr

insert heap newEl = Heap { heap = (updateHeap (index heap) (take ((index heap) - 1) (heap heap) ++ [newEl] ++ drop ((index heap) + 1))), index = ((index heap) + 1)}

rootElement heap = (heap heap) !! 0

size heap = (index heap) + 1

indexOfBigElement heap i j
    | (heap heap) !! i > (heap heap) !! j = i
    | otherwise = j

getHeap heap = (heap heap)

swap a b list = list1 ++ [list !! b] ++ list2 ++ [list !! a] ++ list3
    where   list1 = take a list;
            list2 = drop (succ a) (take b list);
            list3 = drop (succ b) list