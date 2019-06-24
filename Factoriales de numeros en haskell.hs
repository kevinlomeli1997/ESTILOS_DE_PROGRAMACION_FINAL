-- 3 formas diferentes de tener el factorial de un numero

--Forma 1: Con condicionales:
fact1 :: Interger -> Interger
fact1 n = if n == 0 then 1
	else n*fact1(n-1)

--Forma 2: Mediante Patrones
fact2 :: Interger -> Interger
fact2 0 = 1
fact2 n = n * fact2 (n-1)

--Forma 3: Medianye Predefinidas
fact3 :: Interger -> Interger
fact3 n = product [1..n]	
