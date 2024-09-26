# Nosso algoritmo Random Forest

# Importando nossa biblioteca do Random Forest
# install.packages("randomForest")
library(randomForest)

# setando nossa valor para ter o mesmo resultado 
set.seed(1)

# Criando meu classificador random forest
classificador = randomForest(x = base_treinamento[-15], y = base_treinamento$income, ntree = 10)

# Criando minha variavel de previsoes
previsoes = predict(classificador, newdata = base_teste[-15])

# Criando minha matriz de confus??o
matriz_confusao = table(base_teste[, 15], previsoes)
print(matriz_confusao)

# Vizualizando nossa Matriz de confusão com as outras metricas
confusionMatrix(matriz_confusao)

