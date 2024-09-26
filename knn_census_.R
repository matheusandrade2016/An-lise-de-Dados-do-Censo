# Ultilizando nosso Algoritimo KNN - Vizinho mais Próximo

# importando nossa biblioteca para a ultilização do algoritimo KNN
library(class)
library(caret)

# Neste caso não iremos precisamos criar um classificador iremos direto para as previsoes

# train --> Nosssa base de treino todas as variaveis menos a coluna 15  

# test --> Nosssa base de teste todas as variaveis menos a coluna 15 

# cl --> Nossa base de treinamento ou seja nosso fator de classificação ou seja
# nossa variavel alvo que iremos prever 

# k --> nosso numero de vizinhos mais proximos 

previsoes = knn(train = base_treinamento[, -15], test = base_teste[, -15],
                cl = base_treinamento[, 15], k = 5)

# Criando nossa matriz de confusão para verificar os valores

matriz_confusao = table(base_teste[, 15], previsoes)
print(matriz_confusao)

# Verificando nossa acuracia, com outras metricas do algoritmo

confusionMatrix(matriz_confusao)



