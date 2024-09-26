# Ultilizando nosso Algoritmo cn2

# Resumo : sobre nosso algoritmo

# O CN2 é um algoritmo de aprendizado de máquina que induz regras de classificação a
# partir de dados. Ele é conhecido por sua capacidade de gerar regras compreensíveis
# e por ser eficiente em lidar com grandes conjuntos de dados.

###############################################################################

# instalando e Importando nossa Bublioteca
# install.packages("RoughSets")
library(RoughSets)
library(caret)


# Precisamos fazer uma conversão nos dados por causa da Biblioteca

# dataset = base_treinamento --> ira receber nossa base de treinamento

# decision.attr = 15  --> nosso atributo de decisão "default" nesse caso, ou
# seja nossa variavel alvo

# Base treinamento
dt_treinamento <-  SF.asDecisionTable(dataset = base_treinamento,decision.attr = 15) 

# base de teste
dt_teste <-  SF.asDecisionTable(dataset = base_teste, decision.attr = 15)


# Criando nosso classificador


# IMPORTANTE - --- 

# Desse Jeito ira  dar erro pois o algoritimo so aceita valores Categoricos "String"

# Nosso Classificador original

# classificador <- RI.CN2Rules.RST(dt_treinamento, K = 1)



# Criando intervalos de valores para a Biblioteca ser Aceita pois precisa ser  os
# valores categoricos "Strings"

# D.discretization.RST --> transformar de numerico para categorico nossa variaves

# nOfIntervals --> especificar o número de intervalos em que uma variável numérica será dividida 
# "exemplo idade"   Por exemplo, se você tiver uma variável com valores entre 0 e 100 e definir nOfIntervals = 5, 
# a função dividirá esse intervalo em 5 intervalos iguais: [0, 20], [20, 40], [40, 60], [60, 80] e [80, 100

intervalos <-  D.discretization.RST(dt_treinamento,  nOfIntervals = 4, )
print(intervalos)


# Agora precisamos aplicar para as base de treinamento e teste para fazer os intervalos na nossa
# base de dados reais

# SF.applyDecTable --> Solicitar a obtenção de uma nova tabela de decisão ou seja
# criação de novos dados com esses intervalos de tempo

dt_treinamento <-  SF.applyDecTable(dt_treinamento, intervalos)
print(dt_treinamento)

# Agora precisamos criar para as base de treinamento e teste para fazer os intervalos

# SF.applyDecTable --> Solicitar a obtenção de uma nova tabela de decisão
dt_teste <-  SF.applyDecTable(dt_teste, intervalos)



# Agora sim podemos gerar nosso classificador

# K = 1 --> para naão termos os valores tao complexos quanto maior mais demorado,
# nosso algoritmo ira rodar 

classificador <-  RI.CN2Rules.RST(dt_treinamento, K = 1)

# Vizualizando meu classificador
print(classificador)

# Criando minha variavel de previsoes
previsoes <-  predict(classificador, newdata = dt_teste[-15])

# Criando minha matriz de confusão
# unlist --> para deixar a tabela igual a dt_teste para as comparações
matriz_confusao = table(dt_teste[, 15], unlist(previsoes))
print(matriz_confusao)

# vizualizando minha matriz com a biblioteca com sua acucaria
confusionMatrix(matriz_confusao)

# Vizualizando nossas regras
inspect(classificador, rules = 10)

# Criando nossas novas previsoes
previsoes <- predict(classificador, newdata = dados_teste[-15])

# Matriz de confusão
matriz_confusao <- confusionMatrix(table(dados_teste[, 15], unlist(previsoes)))
print(matriz_confusao)

# Calculando outras métricas (exemplo)
precision <- posPredValue(matriz_confusao)
recall <- sensitivity(matriz_confusao)
f1 <- 2 * (precision * recall) / (precision + recall)
cat("Precisão:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1-score:", f1, "\n")













