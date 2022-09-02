USE CHALLENGE_DADOS;

ALTER TABLE dados_mutuarios RENAME COLUMN person_id TO ID_CLIENTE;
ALTER TABLE dados_mutuarios RENAME COLUMN person_age TO IDADE_CLIENTE;
ALTER TABLE dados_mutuarios RENAME COLUMN person_income TO SALARIO_CLIENTE;
ALTER TABLE dados_mutuarios RENAME COLUMN person_home_ownership TO TIPO_CASA_CLIENTE;
ALTER TABLE dados_mutuarios RENAME COLUMN person_emp_length TO ANOS_TRABALHADOS_CLIENTE;

ALTER TABLE emprestimos RENAME COLUMN loan_id TO ID_EMPRESTIMO;
ALTER TABLE emprestimos RENAME COLUMN loan_intent TO MOTIVO_EMPRESTIMO;
ALTER TABLE emprestimos RENAME COLUMN loan_grade TO PONTUACAO_EMPRESTIMO;
ALTER TABLE emprestimos RENAME COLUMN loan_amnt TO VALOR_DO_EMPRESTIMO;
ALTER TABLE emprestimos RENAME COLUMN loan_int_rate TO JUROS_EMPRESTIMO;
ALTER TABLE emprestimos RENAME COLUMN loan_status TO INADIMPLENCIA_EMPRESTIMO;
ALTER TABLE emprestimos RENAME COLUMN loan_percent_income TO PERCENTUAL_EMPRESTIMO_SALARIO;

ALTER TABLE historicos_banco RENAME COLUMN cb_id TO ID_HISTORICO;
ALTER TABLE historicos_banco RENAME COLUMN cb_person_default_on_file TO HISTORICO_INADIMPLENCIA;
ALTER TABLE historicos_banco RENAME COLUMN cb_person_cred_hist_length TO A_QUANTO_TEMPO_TEM_CARTAO_CREDITO;

ALTER TABLE ids RENAME COLUMN person_id TO ID_CLIENTE;
ALTER TABLE ids RENAME COLUMN loan_id TO ID_EMPRESTIMO;
ALTER TABLE ids RENAME COLUMN cb_id TO ID_HISTORICO;

select * from dados_mutuarios;
select * from dados_mutuarios where idade_cliente > 70;
# 14 clientes com mais de 70, 5 deles com mais de 100 anos de idade
select * from dados_mutuarios where salario_cliente > 2000000;
# Há 9 clientes com salário suprior a 1 milhão
select * from dados_mutuarios where anos_trabalhados_cliente > 50;
# Há 2 clientes com 123 anos de trabalho

START TRANSACTION;

UPDATE dados_mutuarios SET tipo_casa_cliente = 'Alugada' WHERE tipo_casa_cliente = 'Rent';
UPDATE dados_mutuarios SET tipo_casa_cliente = 'Própria' WHERE tipo_casa_cliente = 'Own';
UPDATE dados_mutuarios SET tipo_casa_cliente = 'Hipoteca' WHERE tipo_casa_cliente = 'Mortgage';
UPDATE dados_mutuarios SET tipo_casa_cliente = 'Outros' WHERE tipo_casa_cliente = 'Other';

COMMIT;

select * from emprestimos;
select motivo_emprestimo, count(*) from emprestimos group by motivo_emprestimo;
# 3791 dos empréstimos foram para melhora do lar (reformas?)
# 5977 para empreender
# 5782 por motivos pessoais
# 6380 por motivos médicos
# 6771 para educação 
# 5476 para pagar dívidas
# 312 nulos-sem registro
select pontuacao_emprestimo, count(*) from emprestimos group by pontuacao_emprestimo;
# Pontuações dos empréstimos
# C	 6765
# A	 11324
# B	 10955
# D	 3810
# 	 310
# E	 1007
# G	 64
# F	 254
select * from emprestimos where valor_do_emprestimo > 34000;
# Os empréstimos são de no máximo 35.000,00
select juros_emprestimo, count(*) from emprestimos group by juros_emprestimo;
# Máxima taxa de juros é de 23,22%, mas há 3627 registros com taxa nula
select * from emprestimos where valor_do_emprestimo > 0 and juros_emprestimo is null;
# Há muitos registros de empréstimos sem taxa de juros :/
select * from emprestimos where percentual_emprestimo_salario > 0.5;
# Há muitos casos do percentual ser maior do que 50% da renda do cliente

START TRANSACTION;
UPDATE emprestimos SET motivo_emprestimo = 'Pessoal' WHERE motivo_emprestimo = 'Personal';
UPDATE emprestimos SET motivo_emprestimo = 'Educação' WHERE motivo_emprestimo = 'Education';
UPDATE emprestimos SET motivo_emprestimo = 'Médico' WHERE motivo_emprestimo = 'Medical';
UPDATE emprestimos SET motivo_emprestimo = 'Empreender' WHERE motivo_emprestimo = 'Venture';
UPDATE emprestimos SET motivo_emprestimo = 'Reforma' WHERE motivo_emprestimo = 'Homeimprovement';
UPDATE emprestimos SET motivo_emprestimo = 'Pagar dívidas' WHERE motivo_emprestimo = 'Debtconsolidation';
COMMIT;

select * from historicos_banco;
select * from historicos_banco where a_quanto_tempo_tem_cartao_credito > 25;
# Clientes usam cartão de crédito, no máximo, há 30 anos

START TRANSACTION;
UPDATE historicos_banco SET historico_inadimplencia = 'S' WHERE historico_inadimplencia = 'Y';
COMMIT;
