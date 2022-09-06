# challenge-data-science-2

![Badge Em-desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=BLUE&style=for-the-badge)

A proposta do Challenge é simular o desenvolvimento de um projeto, que neste caso é fazer um estudo para reduzir o número de inadimplência no banco Alura Cash.

### Semana 1:

O desafio da primeira semana é estudar o banco de dados da empresa, utilizando o MySQL, entendendo seus dados, verificando inconsistências, traduzir dados e exportar a tabela de dados, no formato csv.

As inconsistências que encontrei no banco de dados foram:

- 5 clientes com mais de 100 anos de idade;

- 2 clientes com 123 anos de trabalho;

- e cliente com 42 anos de idade, 0 anos trabalhados e renda superior a 2 milhões por ano.

A forma que encontrei para exportar a tabela foi:

- chamar a tabela, selecionar a opção "Sem limite" de linhas selecionadas e clicar em 'Export'.

![mysql_export_csv](https://user-images.githubusercontent.com/67301805/188746963-638ecd14-ed86-4155-9df3-8763dd08fc60.jpg)

### Semana 2:

Os desafios da segunda semana consitiam em tratar os dados, ou seja, remover dados nulos e tratar os outliers. Além de analisar correlações, normalizar variáveis, criação de modelos de classificação e exportar o modelo.
