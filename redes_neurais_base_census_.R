
# Ultilizando a Redes Neurais Artificias

# Ultilizando um Servidor para as redes neurais

# nthreads --> onde será o numero de CPUs que iremos ultilizar "-1" ira usar todas as CPUs

library(h2o)
library(caret)

h2o.init(nthreads = -1)

# Criando o nosso classificador para receber os parametros da Biblioteca

# y = onde irá ser nossa variavel classe

# training_frame --> onde irá ser nossa variavel de treinamento "as.h2o" para transformar nossa base de dados no padrão da Biblioteca

# activation --> onde será nossa função de ativação sendo a mais ultilizada "Rectifier"
# hidden --> onde será o tamanho da nossa camada oculta 

# epochs -> o numero de epocas que a rede neural ira fazer as atualização dos pesos
classificador <- h2o.deeplearning(y = 'income', training_frame = as.h2o(base_treinamento),
                                 hidden = c(100), epochs = 1000, activation = "Rectifier")


# Criando minha variavel de Previsao
previsao <-  h2o.predict(classificador, newdata = as.h2o(base_teste[- 15]))

# Fazendo minha codificação para pegarmos a variavel predict onde nela esta os valores o income e jogar na variaval
# de previsoes
previsao <-  previsao$predict

# Transformando nossos valores em formato de vetor para a melhor vizualização
previsao <-  as.vector(previsao)

# Criando nossa matriz de confusão
matriz_de_confusao <- table(base_teste[, 15], previsao)
matriz_de_confusao

# Verificando minha acuracia do modelo
confusionMatrix(matriz_de_confusao)

