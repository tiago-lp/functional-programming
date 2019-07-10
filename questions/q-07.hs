-- 7. Implementar uma Fila e seus algoritmos em Haskell

-- Solution --
data Queue = Queue {elems :: [Int]} deriving (Show, Eq)

isEmpty :: Queue -> Bool
isEmpty queue = null (elems queue)

queueHead :: Queue -> Int
queueHead queue = head (elems queue)

enqueue :: Queue -> Int -> Queue
enqueue queue e = Queue { elems = (elems queue) ++ [e]}

dequeue :: Queue -> Queue
dequeue queue = Queue { elems = tail (elems queue)}

-- Exemplo
-- no terminal> ghci q-07.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let queue = Queue { elems = [1,2] }
    print (show queue)
    let x = 5
    let newQueue = (enqueue queue x)
    print (show newQueue)
    print (show (queueHead newQueue))
    let dequeued = dequeue newQueue
    print (show dequeued)