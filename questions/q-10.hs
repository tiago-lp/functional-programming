{-
10. O conjunto das partes de um conjunto S, nomeado como ℘(S) é definido como um conjunto contendo todos
os subconjuntos de S. Por exemplo, S = {a, b}, então ℘ S = {∅, a , b , {a, b}}. Implemente um algoritmo
que recebe um conjunto de elementos guardados em um array e retorna seu conjunto das partes.
-}

-- Solution --

-- Para esta questao irei utilizar listas, por via das duvidas, antes de iniciar a execucao
-- irei sempre transformar a lista para uma com ocorrencia unica dos elementos (como um conjunto)

unique xs = [x | (x,y) <- zip xs [0..], x `notElem` (take y xs)]

powerSet [] = [[]]
powerSet (x:xs) = [x:ps | ps <- powerSet xs] ++ powerSet xs

callPowerSet arr = powerSet (unique arr)

-- Exemplo
-- no terminal> ghci q-10.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr = [1,2,3]
    let result = callPowerSet arr
    print ""
    print (show result)