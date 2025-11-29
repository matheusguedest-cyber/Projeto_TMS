CREATE TABLE Carretas (
    ID_Carreta        INTEGER   PRIMARY KEY AUTOINCREMENT,
    ID_Transportadora INTEGER   REFERENCES Transportadoras (ID_Transportadora) 
                                NOT NULL,
    Placa             CHAR (7)  UNIQUE
                                NOT NULL,
    Marca             TEXT (20) NOT NULL,
    Modelo            TEXT (20) NOT NULL
);

CREATE TABLE Cidades (
    ID_Cidade INTEGER    PRIMARY KEY AUTOINCREMENT,
    Cidade    TEXT (100) NOT NULL,
    Estado    TEXT (2)   NOT NULL,
    Pais      TEXT (40)  NOT NULL
);


CREATE TABLE Clientes (
    ID_Cliente    INTEGER     PRIMARY KEY AUTOINCREMENT
                              UNIQUE,
    Razao_Social  TEXT (100)  NOT NULL,
    Nome_Fantasia TEXT (60),
    CNPJ          TEXT (14)   UNIQUE ON CONFLICT ROLLBACK
                              NOT NULL,
    Logradouro    TEXT (80)   NOT NULL,
    Numero        TEXT (10)   NOT NULL,
    Bairro        TEXT (20)   NOT NULL,
    CEP           INTEGER (8) NOT NULL,
    ID_Cidade     INTEGER     NOT NULL
);


CREATE TABLE Documento_Fiscal (
    ID_Documento     INTEGER PRIMARY KEY AUTOINCREMENT,
    Numero_Documento         NOT NULL
                             UNIQUE
);

CREATE TABLE Motoristas (
    ID_Motorista      INTEGER   PRIMARY KEY AUTOINCREMENT,
    ID_Transportadora INTEGER   REFERENCES Transportadoras (ID_Transportadora) 
                                NOT NULL,
    Nome              TEXT (40) NOT NULL,
    CPF               CHAR (11) UNIQUE
                                NOT NULL,
    Habilitacao       CHAR (11) UNIQUE
                                NOT NULL
);

CREATE TABLE Notas_Fiscais (
    ID_NF        INTEGER        PRIMARY KEY AUTOINCREMENT,
    ID_Cliente   INTEGER        REFERENCES Clientes (ID_Cliente),
    Numero_NF    NUMERIC (9)    NOT NULL,
    Serie_NF     NUMERIC (3)    NOT NULL,
    Peso_Bruto   NUMERIC (9, 2) NOT NULL,
    Peso_Liquido NUMERIC (9, 2) NOT NULL,
    Volumes      NUMERIC (6)    NOT NULL
);

CREATE TABLE Pedidos (
    ID_Pedido   INTEGER    PRIMARY KEY AUTOINCREMENT
                           UNIQUE,
    Descricao   TEXT (100) UNIQUE,
    Data_Pedido DATETIME   NOT NULL,
    Data_Inicio DATETIME   NOT NULL,
    ID_Cliente  INTEGER    REFERENCES Clientes (ID_Cliente),
    ID_Status   INTEGER    REFERENCES Status (ID_Status) 
                           NOT NULL
);

CREATE TABLE Pedidos_NFs (
    ID_Pedido INTEGER REFERENCES Pedidos (ID_Pedido),
    ID_NF     INTEGER REFERENCES Notas_Fiscais (ID_NF) 
                      UNIQUE
);

CREATE TABLE Rotas (
    ID_Rota        INTEGER   PRIMARY KEY AUTOINCREMENT,
    Descricao      TEXT (30) UNIQUE,
    Cidade_Origem  INTEGER   REFERENCES Cidades (ID_Cidade) 
                             NOT NULL,
    Cidade_Destino INTEGER   REFERENCES Cidades (ID_Cidade) 
                             NOT NULL
);

CREATE TABLE Status (
    ID_Status INTEGER    PRIMARY KEY AUTOINCREMENT,
    Descricao TEXT (100) UNIQUE
                         NOT NULL,
    Aplicavel CHAR (1)   NOT NULL
);


CREATE TABLE Transportadoras (
    ID_Transportadora INTEGER    PRIMARY KEY AUTOINCREMENT,
    Razao_Social      TEXT (100),
    CNPJ              CHAR (14)  UNIQUE
                                 NOT NULL
);

CREATE TABLE Veiculos (
    ID_Veiculo        INTEGER   PRIMARY KEY AUTOINCREMENT,
    ID_Transportadora           REFERENCES Transportadoras (ID_Transportadora) 
                                NOT NULL,
    Placa             CHAR (7)  UNIQUE
                                NOT NULL,
    RNTRC             CHAR (8)  NOT NULL,
    Marca             TEXT (20) NOT NULL,
    Modelo            TEXT (20) NOT NULL
);

CREATE TABLE Viagens (
    ID_Viagem         INTEGER  PRIMARY KEY AUTOINCREMENT,
    ID_Pedido         INTEGER  REFERENCES Pedidos (ID_Pedido) 
                               NOT NULL
                               UNIQUE,
    Data_Inicio       DATETIME NOT NULL,
    Data_Fim          DATETIME,
    ID_Status         INTEGER  REFERENCES Status (ID_Status) 
                               NOT NULL,
    ID_Rota           INTEGER  REFERENCES Rotas (ID_Rota) 
                               NOT NULL,
    ID_Transportadora INTEGER  REFERENCES Transportadoras (ID_Transportadora) 
                               NOT NULL,
    ID_Veiculo        INTEGER  NOT NULL
                               REFERENCES Veiculos (ID_Veiculo),
    ID_Motorista      INTEGER  REFERENCES Motoristas (ID_Motorista) 
                               NOT NULL,
    ID_Carreta        INTEGER  REFERENCES Carretas (ID_Carreta) 
);


CREATE TABLE Viagens_Documentos (
    ID_Viagem    INTEGER REFERENCES Viagens (ID_Viagem) 
                         NOT NULL,
    ID_Documento INTEGER REFERENCES Documento_Fiscal (ID_Documento) 
                         NOT NULL
);
