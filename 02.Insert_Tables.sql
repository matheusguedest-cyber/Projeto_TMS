--Insert para popular as tabelas
        --Tabela Cidades
insert into Cidades (Cidade, Estado, Pais)
values ('Recipe', 'PE', 'Brasil'),
       ('Fortaleza', 'CE', 'Brasil'),
       ('Salvador', 'BA', 'Brasil'),
       ('Sao Paulo', 'SP', 'Brasil');

select * from Cidades;-- select para consulta dos resultados após insert

        --Tabela Clientes

insert into Clientes (Razao_Social, Nome_Fantasia, CNPJ, Logradouro, Numero ,Bairro, CEP, ID_Cidade)
values ('Cliente 4', 'Cliente Fantasia 4',11111111111114, 'Rua Cliente 4', '4', 'Bairro 4', 11111114, 3),
       ('Cliente 5', 'Cliente Fantasia 5',11111111111115, 'Rua Cliente 5', '5', 'Bairro 5', 11111115, 2),
       ('Cliente 6', 'Cliente Fantasia 6',11111111111117, 'Rua Cliente 6', 'SN', 'Bairro 6', 11111117, 7);

select * from Clientes;-- select para consulta dos resultados após insert

        --Tabela Status
        
insert into Status (Descricao, Aplicavel)
values ('Status Genérico do Pedido para Avaliação da Entrega', 'P'),
       ('Status Genérico da Viagem para Avaliação da Entrega', 'V');

select * from Status;--select para consulta dos resultados após insert

        --Tabela Pedidos
        
insert into Pedidos (Descricao, Data_Pedido, Data_Inicio, ID_Cliente, ID_Status)
values ('Embarque Cliente 10', '20251101 10:15','20251104 12:00', 1, 2),
       ('Carga Ugente Solicitada pelo Cliente', '20251105 10:15','20251107 12:00', 2, 1),
       ('Coleta em ponto G - Entrega em ponto H', '20251107 10:15','20251109 12:00', 3, 3);
        
select * from Pedidos;--select para consulta dos resultados após insert

        --Notas_Fiscais

insert into Notas_Fiscais (ID_Cliente, Numero_NF, Serie_NF, Peso_Bruto, Peso_Liquido, Volumes)
values (1, 5,1, 1840, 1735.67,42),
       (1, 6,1, 10, 10,1),
       (1, 7,1, 200, 200,3),
       (2, 453,20, 10840.34, 10735.67,182),
       (2, 454,20, 1234, 1233,12),
       (3, 14,5, 1840, 1735.67,42),
       (2, 15,5, 1234, 1233,12);
       
select * from Notas_Fiscais;--select para consulta dos resultados após insert

        --Rotas
     
insert into Rotas (Descricao, Cidade_Origem, Cidade_Destino) 
values ('São Bernardo do Campo - Belo Horizonte',1, 2),
       ('RJ - POA', 3, 5),
       ('POA - SBC', 5, 1);
       
select * from Rotas;--select para consulta dos resultados após insert

        --Transportadoras

insert into Transportadoras (Razao_Social, CNPJ)
values ('Transportadora 4', '12345123454'),
       ('Transportadora 5', '12345123455'),
       ('Transportadora 6', '12345123456'),
       ('Transportadora 7', '12345123457');
        
select * from Transportadoras;--select para consulta dos resultados após insert

        --Veiculos
        
insert into Veiculos (ID_Transportadora, Placa, RNTRC, Marca, Modelo)
values (1, 'ABC1236', '12345678', 'Volvo','HXM'),
       (1, 'ABC1237', '12345678', 'Volvo','XSM 2.0'),
       (2, 'EFG1H48', '11111111', 'VW','XXX'),
       (3, 'WXY4322', '22222222', 'Scania','IMG');
        
select * from Veiculos;--select para consulta dos resultados após insert

        --Motoristas

insert into Motoristas (ID_Transportadora, Nome, CPF, Habilitacao)
values (1, 'Henrique Scalabrini', '11111111112', 'AAAAAAAAAAB'),
       (2, 'Alessandra Duarte', '22222222221', 'BBBBBBBBBBC'),
       (3, 'Catarina dos Anjos', '33333333333', 'CCCCCCCCCCD');
             
select * from Motoristas;--select para consulta dos resultados após insert

        --Carretas
        
insert into Carretas (ID_Transportadora, Placa, Marca, Modelo)
values (1, 'CUD6266', 'Facchini','Baú'),
       (2, 'CUD6267', 'Facchini','Sider 12 MTS'),
       (3, 'CUD6268', 'Facchini','Refrigerada');
        
select * from Carretas;--select para consulta dos resultados após insert

        --Viagens
        
insert into Viagens (ID_Pedido, Data_Inicio, Data_Fim, ID_Status, ID_Rota, ID_Transportadora, ID_Veiculo, ID_Motorista, ID_Carreta)
values (2, '20251107 12:00', NULL, 6, 3, 1, 2, 2, 1);
       
select * from Viagens;--select para consulta dos resultados após insert

        --Documento_Fiscal

insert into Documento_Fiscal (Numero_Documento)
values (1024),
       (1025);

select * from Documento_Fiscal;--select para consulta dos resultados após insert