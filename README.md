# Análise de Dados do Censo

# Introdução:

A desigualdade de renda é um desafio global que impacta a qualidade de vida de milhões de pessoas. Compreender os fatores que influenciam a renda individual é crucial para a formulação de políticas públicas mais equitativas e para a tomada de decisões informadas por empresas e indivíduos.

# Objetivo:

Neste estudo, buscamos desenvolver modelos de aprendizado de máquina capazes de prever se uma pessoa ganha mais ou menos de 50 mil dólares por ano com base em dados do censo demográfico. A partir dessa previsão, pretendemos identificar as características socioeconômicas mais relevantes para a determinação da renda e contribuir para a compreensão das dinâmicas de desigualdade.

# Metodologia:

Utilizaremos um conjunto de dados do censo que inclui informações sobre idade, nível de educação, ocupação, estado civil e outras variáveis socioeconômicas. Serão aplicados diversos algoritmos de aprendizado de máquina, como árvores de decisão, random forest, redes neurais artificiais e algoritmos de regras de associação (CN2), para construir modelos preditivos. A escolha desses algoritmos se justifica por suas diferentes características e capacidades de capturar padrões complexos nos dados

# Resultados Esperados:

Esperamos que os modelos desenvolvidos sejam capazes de prever a renda com alta precisão, permitindo identificar os principais determinantes da desigualdade de renda. Os resultados deste estudo podem auxiliar governos, empresas e pesquisadores a tomar decisões mais informadas e a desenvolver políticas públicas mais eficazes para reduzir a desigualdade.

# Pré-processamento dos Dados

"Os dados foram submetidos a um processo de limpeza, removendo valores ausentes e outliers

# Implementação de Árvore de Decisão 

Este repositório contém o código R utilizado para construir e avaliar um modelo de árvore de decisão. A biblioteca rpart foi utilizada para criar a árvore, enquanto caret foi empregada para a avaliação do modelo. A biblioteca rpart.plot foi utilizada para visualizar a árvore de decisão.

**Bibliotecas usadas para Árvores de Decisões**

rpart: Criação da árvore de decisão.

caret: Avaliação do modelo e ajuste de hiperparâmetros.

rpart.plot: Visualização da árvore de decisão.


# Implementação do Algoritmo CN2 

Este repositório contém o código R utilizado para construir e avaliar um modelo de Regras . A biblioteca RoughSets foi utilizada para criar nosso modelo , enquanto caret foi empregada para a avaliação do modelo.

**Bibliotecas usadas para Cn2**

RoughSets: Criação do nosso algoritmo Cn2.

caret: Avaliação do modelo e ajuste de hiperparâmetros.


# Implementação do Algoritmo Random Forest 

Este repositório contém o código R utilizado para construir e avaliar um modelo de Random Forest . A biblioteca RandomForest foi utilizada para criar nosso modelo , enquanto caret foi empregada para a avaliação do modelo. 

**Bibliotecas usadas para RandomForest**

randomForest: Criação do nosso algoritmo RandomForest

caret: Avaliação do modelo e ajuste de hiperparâmetros.


# Implementação do Algoritmo KNN

Este repositório contém o código R utilizado para construir e avaliar um modelo de KNN ((k-nearest neighbors) . A biblioteca class foi utilizada para criar nosso modelo , enquanto caret foi empregada para a avaliação do modelo. 

**Bibliotecas usadas para KNN**

class: Criação do nosso algoritmo KNN

caret: Avaliação do modelo e ajuste de hiperparâmetros.

# Implementação do Algoritmo Regressão Logística

Este repositório contém o código R utilizado para construir e avaliar um modelo de Regressão . Utilizamos a própria  biblioteca glm que vem da própria linguagem do R foi utilizada para criar nosso modelo , enquanto caret foi empregada para a avaliação do modelo. 

**Bibliotecas usadas para Regressão Logística**

glm: Criação do nosso algoritmo Regressão Logística 

caret: Avaliação do modelo e ajuste de hiperparâmetros.


# Implementação do Algoritmo SVM (Máquina de vetores de suporte)

Este repositório contém o código R utilizado para construir e avaliar um modelo de SVM. Utilizamos a biblioteca e1071, para criar nosso modelo, enquanto caret foi empregada para a avaliação do modelo. 

**Bibliotecas usadas para SVM **

e1071: Criação do nosso algoritmo SVM 

caret: Avaliação do modelo e ajuste de hiperparâmetros.

# Implementação do Algoritmo Redes Neurais Artificiais

Este repositório contém o código R utilizado para construir e avaliar um modelo de Redes Neurais Artificiais. Utilizamos a biblioteca h2o, para criar nosso modelo, enquanto caret foi empregada para a avaliação do modelo. 

**Bibliotecas usadas para Redes Neurais Artificiais**

h2o: Criação do nosso algoritmo Redes Neurais Artificiais 

caret: Avaliação do modelo e ajuste de hiperparâmetros.



