--Consultas

         --Viagens
 
select V.ID_Viagem as Número_Viagem,
       V.Data_Inicio,
       V.Data_Fim,
       CONCAT(C1.Cidade, ' -' , C1.Estado) as Origem,
       CONCAT(C2.Cidade, ' -' , C2.Estado) as Destino,
       S.Descricao as Status_Viagem,
       C.Razao_social as Cliente,
       T.Razao_Social as Transportadora,
       Ve.Placa as Caminhão,
       M.Nome as Motorista
from Viagens as V inner join Pedidos as P on V.ID_Pedido = P.ID_Pedido
                  inner join Clientes as C on P.ID_Cliente = C.ID_Cliente
                  inner join Status as S on V.ID_Status = S.ID_Status
                  inner join Transportadoras as T on V.ID_Transportadora = T.ID_Transportadora
                  inner join Veiculos as Ve on V.ID_Veiculo = Ve.ID_Veiculo
                  inner join Carretas as Ca on V.ID_Carreta = Ca.ID_Carreta
                  inner join Motoristas as M on V.ID_Motorista = M.ID_Motorista
                  inner join Rotas as R on V.ID_Rota = R.ID_Rota
                  inner join Cidades as C1 on R.Cidade_Origem = C1.ID_Cidade
                  inner join Cidades as C2 on R.Cidade_Destino = C2.ID_Cidade
order by C.ID_Cliente desc;
                  
                  
         -- Quantidade de veículos por Transportadora (Número de Caminhões, Motoristas e Carretas)
 
select T.Razao_Social as Transportadora,
       count(V.ID_Veiculo) as Qtde_Veiculo
from Transportadoras as T left join Veiculos as V on T.ID_Transportadora = V.ID_Transportadora
group by T.ID_Transportadora;

        --Clientes com Pedidos Recusados no Mês de Novembro de 2025

select C.Razao_Social as Cliente,
       count(P.ID_Pedido) as Qtde_Pedidos
from Clientes as C inner join Pedidos as P on C.ID_Cliente = P.ID_Cliente
                   inner join Status as S on S.ID_Status =  P.ID_Status
where S.ID_Status = 4 and P.Data_Pedido between '20251101 00:00' and '20251130 23:59'
group by C.ID_Cliente;