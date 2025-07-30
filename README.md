<!-- antes de enviar a versão final, solicitamos que todos os comentários, colocados para orientação ao aluno, sejam removidos do arquivo -->
# Otimização do Processo de Análise de Qualidade de Dados de Produção Upstream com Implementação de Data Warehouse

#### Aluno: [Matheus Muller Barbosa](https://github.com/mmuller94).
#### Orientador: [Anderson Nascimento](https://github.com/insightds).

---

Trabalho apresentado ao curso [BI MASTER](https://ica.puc-rio.ai/bi-master) como pré-requisito para conclusão de curso e obtenção de crédito na disciplina "Projetos de Sistemas Inteligentes de Apoio à Decisão".

<!-- para os links a seguir, caso os arquivos estejam no mesmo repositório que este README, não há necessidade de incluir o link completo: basta incluir o nome do arquivo, com extensão, que o GitHub completa o link corretamente -->
- [Link para a monografia](https://github.com/mmuller94/BI-master-data-quality-project/blob/main/Data%20Warehouse%20e%20Visualiza%C3%A7%C3%A3o%20para%20An%C3%A1lise%20de%20Qualidade%20em%20Dados%20de%20Projetos%20Upstream.docx). <!-- caso não aplicável, remover esta linha -->


### Resumo

<!-- trocar o texto abaixo pelo resumo do trabalho, em português -->

Este projeto tem como objetivo desenvolver um Data Warehouse voltado à análise da qualidade de dados relacionados a projetos offshore de exploração e produção de petróleo na América do Sul. Utilizando PostgreSQL, Pentaho Data Integration e Power BI, foram construídos processos de ETL e dashboards para avaliar aspectos como completude, consistência, duplicidade e classificação da base de dados. A solução visa apoiar analistas e gestores na melhoria contínua da integridade dos dados, promovendo mais confiabilidade nas decisões estratégicas baseadas em dados.


### 1. Introdução

Com o aumento do volume e da complexidade dos dados no setor de energia, garantir a qualidade da informação se tornou um fator essencial para a assertividade das decisões de negócio. Este trabalho propõe uma arquitetura de Data Warehouse com foco em avaliar e monitorar a qualidade dos dados de projetos offshore na América do Sul. A análise considera dados de três frentes principais: projetos, dutos e árvores submarinas.

Além de centralizar a informação, o projeto fornece mecanismos automatizados para mensurar e sinalizar a presença de problemas de completude, consistência, duplicidade e classificação dos dados. O trabalho é parte do projeto final de um curso de pós-graduação, com o propósito de aplicar os conceitos de BI e ETL em um problema real.

### 2. Modelagem

A modelagem do projeto foi baseada em uma arquitetura em estrela, com uma tabela fato chamada fato_projetos, que centraliza as informações dos projetos offshore, e três tabelas dimensionais: dim_dutos, dim_subsea_trees e a própria dim_projetos. A escolha desse modelo visou facilitar a análise multidimensional e tornar as consultas mais eficientes para ferramentas de visualização como o Power BI.

Para alimentar o Data Warehouse, foram desenvolvidos processos de ETL utilizando o Pentaho Data Integration (Kettle). Inicialmente, os dados foram extraídos de planilhas fornecidas em Excel contendo informações sobre projetos, dutos e árvores submarinas. Em seguida, foram aplicadas transformações para padronização, tratamento de campos nulos, vinculação de chaves e carregamento final no banco PostgreSQL, estruturado especificamente para este projeto sob o nome dw_qualidade_og.

Durante o processo de ETL, foram construídas regras de qualidade de dados divididas em quatro frentes principais: completude, consistência, duplicidade e classificação. A verificação de completude consistiu na análise do preenchimento de campos considerados obrigatórios, como datas, status e localizações. Já a consistência avaliou a coerência entre os valores de diferentes colunas, garantindo que determinadas combinações de atributos fossem válidas. A análise de duplicidade envolveu a criação de chaves compostas para detectar registros repetidos dentro da tabela fato. Por fim, a classificação dos projetos foi realizada com base na profundidade informada, categorizando-os automaticamente como "Shallow Water" (águas rasas, profundidade inferior a 200 metros), "Deepwater" (águas profundas, profundidade igual ou superior a 200 metros) ou "Indefinido", nos casos em que o valor de profundidade estivesse ausente.

Essas rotinas foram integradas em um único job automatizado, responsável por executar todas as transformações em sequência. Ao final do processo, os dados transformados e qualificados ficaram disponíveis para exploração no Power BI, permitindo análises robustas e visualmente acessíveis sobre a qualidade dos dados armazenados no Data Warehouse.

### 3. Resultados

Os dados processados foram visualizados no Power BI, resultando em um painel com os seguintes indicadores:

- Completude: percentuais de preenchimento por campo relevante;

- Consistência: número e proporção de registros com conflitos;

- Duplicidade: número absoluto e quais registros estão duplicados;

- Classificação de Projetos: distribuição entre águas rasas, profundas e indefinidos.

O uso do Job no Pentaho possibilitou automatizar toda a cadeia de execução do ETL, desde a leitura das planilhas até a gravação final no Data Warehouse, permitindo reprocessamentos simples sempre que necessário.

### 4. Conclusões

A construção do Data Warehouse permitiu identificar e mensurar de forma clara e objetiva a qualidade dos dados utilizados em projetos offshore. A plataforma construída oferece uma base sólida para análises históricas e melhorias contínuas nos processos de gestão de dados técnicos.

A integração entre Pentaho, PostgreSQL e Power BI mostrou-se eficiente, e a separação entre dados brutos, transformações e indicadores facilita a manutenção e evolução futura do sistema. Este projeto, além de ser uma entrega acadêmica, pode ser considerado um protótipo funcional para uso em ambientes corporativos que demandem confiabilidade e governança de dados.

---

Matrícula: 231.100.105

Pontifícia Universidade Católica do Rio de Janeiro

Curso de Pós Graduação *Business Intelligence Master*
