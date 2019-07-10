{-# LANGUAGE FlexibleContexts #-}

{-
11. Um aluno é representado como uma estrutura contando matrícula, um primeiro nome, um sobrenome,
período de ingresso e CRA.
    a. Implemente a estrutura que representa um aluno
    b. Implemente uma função que calcula a media dos CRAs dos alunos (dispostos em uma lista) usando
        o operador de foldr (você nao pode usar map)
    c. Implemente uma função que realiza o groupBy dos alunos por CRA. Ou seja, dada uma lista de alunos,
        a função retorna uma lista de pares (cra, [Aluno]), agrupando alunos com um mesmo CRA em pares
        cujo primeiro elemento é o CRA e o segundo é uma lista de alunos.
-}

-- Solution --
import Data.List

-- letra a) (letra b e c estao sendo testadas no main)
data Aluno = Aluno {
  matricula :: String
, nome :: String
, sobrenome :: String
, ingresso :: String
, cra :: Float
} deriving (Show, Eq)

unique xs = [x | (x,y) <- zip xs [0..], x `notElem` (take y xs)]

getCRAs [] _ = []
getCRAs (x:xs) result = [(cra x)] ++ result ++ getCRAs xs result

mediaCRA alunos = (foldr (+) 0 (getCRAs alunos [])) / (genericLength alunos)

getAlunosByCra alunos crax = (crax, (filter (\x -> (cra x) == crax) alunos))

groupByCraAux [] _ _ = []
groupByCraAux (x:xs) alunos result = result ++ [getAlunosByCra alunos x] ++ groupByCraAux xs alunos result

groupByCra alunos = groupByCraAux (unique (getCRAs alunos [])) alunos []

-- Exemplo
-- no terminal> ghci q-11.hs
-- depois digitar 'main' e apertar enter para rodar o exemplo abaixo
main = do
    let aluno = Aluno { matricula = "116210629",
                        nome = "Tiago",
                        sobrenome = "L. Pereira",
                        ingresso = "16.2",
                        cra = 7.33 }
    let aluno2 = Aluno { matricula = "123456789",
                        nome = "Ogait",
                        sobrenome = "Lima",
                        ingresso = "16.2",
                        cra = 7.33 }
    let aluno3 = Aluno { matricula = "987654321",
                        nome = "Lima",
                        sobrenome = "Tiago",
                        ingresso = "16.2",
                        cra = 9.13 }
    let aluno4 = Aluno { matricula = "546548978",
                        nome = "Teste",
                        sobrenome = "Silva",
                        ingresso = "16.2",
                        cra = 9.13 }
    let aluno5 = Aluno { matricula = "6658794132",
                        nome = "Aluno",
                        sobrenome = "Oliveira",
                        ingresso = "16.2",
                        cra = 8.55 }

    let alunos = [aluno, aluno2, aluno3, aluno4, aluno5]
    print ""
    --letra b)
    print "Media dos cras"
    print (show (mediaCRA alunos))
    print ""
    -- letra c)
    print "Agrupados por cra"
    print (show (groupByCra alunos))