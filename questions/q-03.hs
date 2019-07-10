{-# LANGUAGE FlexibleContexts #-}

{-
3. Encontrar floor e ceil de um número x dentro de um array a. O número x pode não estar no array a. O
floor(x) é o número do array a que é menor que x e que mais se aproxima de x (pode existir mais de um
número menor que x, o floor é o maior deles). Dualmente, o ceil(x) é o número do array a que é maior que
x e que mais se aproxima de x (pode existir maisde um número maior do que x, o ceil é o menor deles).
-}

-- Solution --
import Data.List
import Data.Maybe

getFloor lessThanX
    | (length lessThanX) > 0 = maximum lessThanX
    | otherwise = -1

getCeil greaterThanX
    | (length greaterThanX) > 0 = minimum greaterThanX
    | otherwise = -1

-- O resultado eh uma tupla (floor, ceil) ou (0, 0):
-- -1 em dentro da tupla indica que nao ha o floor e/ou ceil
-- Se o resultado for (0, 0) indica que nao existe o elemento no array
-- do mesmo modo se for (-1, -1) indica que nao ha nem floor nem ceil, mas o elemento procurado existe
-- optei dessa forma pois podemos ter o array [3,3,3,3,3] e procurarmos o floor e ceil de 3.
-- Neste caso vai existir o elemento mas nao vai existir floor nem ceil (pela definicao da questao)
-- e nao ha outra ocorrencia de (0, 0) pois, pela definicao da questao, nao pode ter floor e ceil iguais
floorAndCeil arr x
    | (fromMaybe (-1) $ elemIndex x arr) > (-1) = (getFloor (filter (<x) arr), getCeil (filter (>x) arr))
    | otherwise = (0, 0)

-- Exemplo
-- no terminal> ghci q-03.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let arr1 = [10, 22, 28, 29, 30, 40]
    let arr2 = [3,3,3]
    let result1 = floorAndCeil arr1 28 -- floor e ceil existe
    let result2 = floorAndCeil arr1 40 -- apenas floor existe
    let result3 = floorAndCeil arr1 10 -- apenas ceil existe
    let result4 = floorAndCeil arr2 3 -- array 2: nem floor nem ceil existe
    let result5 = floorAndCeil arr1 55 -- elemento nao existe no array

    print ""
    print "array = {10,22,28,29,30,40}, x = 28"
    print (show result1)
    print ""
    print "array = {10,22,28,29,30,40}, x = 40"
    print (show result2)
    print ""
    print "array = {10,22,28,29,30,40}, x = 10"
    print (show result3)
    print ""
    print "array = {3,3,3}, x = 3"
    print (show result4)
    print ""
    print "array = {10,22,28,29,30,40}, x = 55"
    print (show result5)
