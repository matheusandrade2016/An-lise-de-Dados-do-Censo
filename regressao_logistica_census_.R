# Algoritimo Regressão Logistica

# Importando nossa Biblioteca caret, para nossa matriz de confusão
library(caret)

# Criando meu classificador para usar nosso algoritimo

# formula --> nossa variavel Alvo ou seja o valor que iremos prever
#  ~. --> o restante dos atributos que são previsores
# family = binomial --> para trabalharmos com regressão logistica

classificador <-  glm(formula = income ~., family = binomial, data = base_treinamento)

# Criando minha variavel de probabilidades

# type = "response" -->  indica que queremos obter as probabilidades da classe positiva

probabilidade <- predict(classificador, type='response', newdata = base_teste[-15])
print(probabilidade)

# Criando minha variavel de previsoes para verificar o resultado certo 0 ou 1,ou
# seja convertendo para 0 e 1 para melhorar nossa vizualização
previsoes <-  ifelse(probabilidade > 0.5, 1, 0)

# Criando minha matriz de confusao
matriz_confusao <-  table(base_teste[,15], previsoes)
matriz_confusao

#  verificar nossa acuracia
confusionMatrix(matriz_confusao)














