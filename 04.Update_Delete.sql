--UPDATE e DELETE
      
update Pedidos set ID_Status = 2 where ID_Pedido = 2; -- Pedido número 2 que estava em análise foi aceito
update Pedidos set ID_Status = 8, Data_Fim = '20251115 14:00' where ID_Viagem = 2; --Viagem que estava em andamento foi finalziada em 15/11/2025 às 14:00
update Veiculos set Marca = 'Volvo' where ID_Veiculo = 3;--Veículo placa EFG1H47 foi cadastrado com a marca errada
delete from Viagens_Documentos where ID_Documento = 3;--Documento 1022 foi atribuído erroneamente a viagem
delete from Pedidos_NFs where ID_NF = 8;--Nota Fiscal número 13 do cliente 3 foi atribuída erroneamente a viagem
delete from Rotas where ID_Rota = 3;--Rota cadastrada com cidade destino errada