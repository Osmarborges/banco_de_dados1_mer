CREATE TABLE fabrica_bebidas (
  cnpj INTEGER NOT NULL AUTO_INCREMENT,
  telefone VARCHAR NULL,
  endereco VARCHAR NULL,
  PRIMARY KEY(cnpj)
);

CREATE TABLE estoque (
  id_estoque INTEGER UNSIGNED NOT NULL,
  quantidade INTEGER UNSIGNED NOT NULL,
  descricao VARCHAR NOT NULL,
  PRIMARY KEY(id_estoque)
);

CREATE TABLE delivery_chopp (
  nome_delivery_chopp VARCHAR NOT NULL AUTO_INCREMENT,
  estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  telefone VARCHAR NOT NULL,
  endereco VARCHAR NOT NULL,
  PRIMARY KEY(nome_delivery_chopp, estoque_id_estoque),
  INDEX delivery_chopp_FKIndex1(estoque_id_estoque)
);

CREATE TABLE cliente (
  cod_cliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  nome VARCHAR NOT NULL,
  telefone VARCHAR NULL,
  PRIMARY KEY(cod_cliente, delivery_chopp_estoque_id_estoque, delivery_chopp_nome_delivery_chopp),
  INDEX cliente_FKIndex1(delivery_chopp_nome_delivery_chopp, delivery_chopp_estoque_id_estoque)
);

CREATE TABLE distribuidora (
  cod_distribuidora INTEGER NOT NULL AUTO_INCREMENT,
  fabrica_bebidas_cnpj INTEGER NOT NULL,
  telefone VARCHAR NULL,
  nome VARCHAR NULL,
  PRIMARY KEY(cod_distribuidora, fabrica_bebidas_cnpj),
  INDEX distribuidora_FKIndex1(fabrica_bebidas_cnpj)
);

CREATE TABLE delivery_chopp_pedido_distribuidora (
  delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  distribuidora_fabrica_bebidas_cnpj INTEGER NOT NULL,
  distribuidora_cod_distribuidora INTEGER NOT NULL,
  PRIMARY KEY(delivery_chopp_estoque_id_estoque, delivery_chopp_nome_delivery_chopp, distribuidora_fabrica_bebidas_cnpj, distribuidora_cod_distribuidora),
  INDEX delivery_chopp_has_distribuidora_FKIndex1(delivery_chopp_nome_delivery_chopp, delivery_chopp_estoque_id_estoque),
  INDEX delivery_chopp_has_distribuidora_FKIndex2(distribuidora_cod_distribuidora, distribuidora_fabrica_bebidas_cnpj)
);

CREATE TABLE maquina (
  id_maquina INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  modelo VARCHAR NOT NULL,
  PRIMARY KEY(id_maquina, delivery_chopp_estoque_id_estoque, delivery_chopp_nome_delivery_chopp),
  INDEX maquina_FKIndex1(delivery_chopp_nome_delivery_chopp, delivery_chopp_estoque_id_estoque)
);

CREATE TABLE funcionario (
  cracha_funcionario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  nome VARCHAR NOT NULL,
  telefone VARCHAR NOT NULL,
  PRIMARY KEY(cracha_funcionario, delivery_chopp_estoque_id_estoque, delivery_chopp_nome_delivery_chopp),
  INDEX funcionario_FKIndex1(delivery_chopp_nome_delivery_chopp, delivery_chopp_estoque_id_estoque)
);

CREATE TABLE entrega (
  nro_entrega INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  funcionario_cracha_funcionario INTEGER UNSIGNED NOT NULL,
  funcionario_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  funcionario_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  maquina_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  maquina_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  maquina_id_maquina INTEGER UNSIGNED NOT NULL,
  data_dia DATE NOT NULL,
  quantidade INTEGER UNSIGNED NOT NULL,
  id_maquina INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(nro_entrega, funcionario_cracha_funcionario, funcionario_delivery_chopp_nome_delivery_chopp, funcionario_delivery_chopp_estoque_id_estoque, maquina_delivery_chopp_nome_delivery_chopp, maquina_delivery_chopp_estoque_id_estoque, maquina_id_maquina),
  INDEX entrega_FKIndex1(funcionario_cracha_funcionario, funcionario_delivery_chopp_estoque_id_estoque, funcionario_delivery_chopp_nome_delivery_chopp),
  INDEX entrega_FKIndex2(maquina_id_maquina, maquina_delivery_chopp_estoque_id_estoque, maquina_delivery_chopp_nome_delivery_chopp)
);

CREATE TABLE manutençao (
  id_ordem INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  funcionario_cracha_funcionario INTEGER UNSIGNED NOT NULL,
  funcionario_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  funcionario_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  descricao VARCHAR NOT NULL,
  data_dia DATE NOT NULL,
  PRIMARY KEY(id_ordem, funcionario_cracha_funcionario, funcionario_delivery_chopp_nome_delivery_chopp, funcionario_delivery_chopp_estoque_id_estoque),
  INDEX manutençao_FKIndex1(funcionario_cracha_funcionario, funcionario_delivery_chopp_estoque_id_estoque, funcionario_delivery_chopp_nome_delivery_chopp)
);

CREATE TABLE cliente_fisico (
  cpf INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cliente_cod_cliente INTEGER UNSIGNED NOT NULL,
  entrega_funcionario_cracha_funcionario INTEGER UNSIGNED NOT NULL,
  entrega_nro_entrega INTEGER UNSIGNED NOT NULL,
  cliente_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  cliente_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  entrega_funcionario_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  entrega_funcionario_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  entrega_maquina_id_maquina INTEGER UNSIGNED NOT NULL,
  entrega_maquina_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  entrega_maquina_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  forma_pagamento VARCHAR NOT NULL,
  endereco VARCHAR NOT NULL,
  PRIMARY KEY(cpf, cliente_cod_cliente, entrega_funcionario_cracha_funcionario, entrega_nro_entrega, cliente_delivery_chopp_nome_delivery_chopp, cliente_delivery_chopp_estoque_id_estoque, entrega_funcionario_delivery_chopp_estoque_id_estoque, entrega_funcionario_delivery_chopp_nome_delivery_chopp, entrega_maquina_id_maquina, entrega_maquina_delivery_chopp_estoque_id_estoque, entrega_maquina_delivery_chopp_nome_delivery_chopp),
  INDEX cliente_fisico_FKIndex1(cliente_cod_cliente, cliente_delivery_chopp_estoque_id_estoque, cliente_delivery_chopp_nome_delivery_chopp),
  INDEX cliente_fisico_FKIndex2(entrega_nro_entrega, entrega_funcionario_cracha_funcionario, entrega_funcionario_delivery_chopp_nome_delivery_chopp, entrega_funcionario_delivery_chopp_estoque_id_estoque, entrega_maquina_delivery_chopp_nome_delivery_chopp, entrega_maquina_delivery_chopp_estoque_id_estoque, entrega_maquina_id_maquina)
);

CREATE TABLE empresa_juridico (
  cnpj INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cliente_cod_cliente INTEGER UNSIGNED NOT NULL,
  manutençao_id_ordem INTEGER UNSIGNED NOT NULL,
  entrega_nro_entrega INTEGER UNSIGNED NOT NULL,
  entrega_funcionario_cracha_funcionario INTEGER UNSIGNED NOT NULL,
  manutençao_funcionario_cracha_funcionario INTEGER UNSIGNED NOT NULL,
  cliente_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  cliente_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  manutençao_funcionario_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  manutençao_funcionario_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  entrega_funcionario_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  entrega_funcionario_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  entrega_maquina_id_maquina INTEGER UNSIGNED NOT NULL,
  entrega_maquina_delivery_chopp_estoque_id_estoque INTEGER UNSIGNED NOT NULL,
  entrega_maquina_delivery_chopp_nome_delivery_chopp VARCHAR NOT NULL,
  forma_pagamento VARCHAR NOT NULL,
  endereco VARCHAR NOT NULL,
  PRIMARY KEY(cnpj, cliente_cod_cliente, manutençao_id_ordem, entrega_nro_entrega, entrega_funcionario_cracha_funcionario, manutençao_funcionario_cracha_funcionario, cliente_delivery_chopp_nome_delivery_chopp, cliente_delivery_chopp_estoque_id_estoque, manutençao_funcionario_delivery_chopp_estoque_id_estoque, manutençao_funcionario_delivery_chopp_nome_delivery_chopp, entrega_funcionario_delivery_chopp_estoque_id_estoque, entrega_funcionario_delivery_chopp_nome_delivery_chopp, entrega_maquina_id_maquina, entrega_maquina_delivery_chopp_estoque_id_estoque, entrega_maquina_delivery_chopp_nome_delivery_chopp),
  INDEX empresa_juridico_FKIndex1(cliente_cod_cliente, cliente_delivery_chopp_estoque_id_estoque, cliente_delivery_chopp_nome_delivery_chopp),
  INDEX empresa_juridico_FKIndex2(manutençao_id_ordem, manutençao_funcionario_cracha_funcionario, manutençao_funcionario_delivery_chopp_nome_delivery_chopp, manutençao_funcionario_delivery_chopp_estoque_id_estoque),
  INDEX empresa_juridico_FKIndex3(entrega_nro_entrega, entrega_funcionario_cracha_funcionario, entrega_funcionario_delivery_chopp_nome_delivery_chopp, entrega_funcionario_delivery_chopp_estoque_id_estoque, entrega_maquina_delivery_chopp_nome_delivery_chopp, entrega_maquina_delivery_chopp_estoque_id_estoque, entrega_maquina_id_maquina)
);


