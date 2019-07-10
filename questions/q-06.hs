-- 6. Implementar uma pilha e seus algoritmos em Haskell

-- Solution -- 
data Stack = Stack {elems :: [Int]} deriving (Show, Eq)

isEmpty :: Stack -> Bool
isEmpty stack = null (elems stack)

push :: Stack -> Int -> Stack
push stack e = Stack { elems = ((elems stack) ++ [e]) }

-- top seria o pop que retorna o elemento do top da pilha
-- como nao tem efeito colateral no paradigma funcional
-- tive que implementar o pop retornando a pilha menos o topo e o top retornando o elemento do top
top :: Stack -> Int
top stack = last (elems stack)

pop :: Stack -> Stack
pop stack = Stack { elems = init (elems stack)}

-- Exemplo
-- no terminal> ghci q-06.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let stack = Stack { elems = [1,2]}
    print (show stack)
    let x = 5
    let newStack = (push stack x)
    print (show newStack)
    print (show (top newStack))
    let popedStack = pop newStack
    print (show popedStack)

