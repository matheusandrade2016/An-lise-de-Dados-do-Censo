# Começando nosso algoritimo de SMV (Maquina de suporte de vetores)

# instalando nossa biblioteca
# install.packages('e1071')

# Chamando nossa Biblioteca 
library(e1071)
library(caret)

# Criando nosso classificador

# formula --> nossa variavel alvo ou seja nossa variavel preditotra
# type --> selecionando classficicação
# kernel --> o kernel usado no treinamento e previsão
# cost --> nossa função de custo

classificador_svm = svm(formula = income ~. , data = base_treinamento, type = 'C-classification', 
                    kernel = 'radial', cost = 5.0)


# Criando minha variavel de previsoes para o teste com a base_teste
previsoes_svm = predict(classificador_svm, newdata = base_teste[, -15])
previsoes_svm


# Criando minha matriz de confusão
matriz_confusao = table(base_teste[, 15], previsoes_svm)
matriz_confusao

# importando minha biblioteca para verificar minha acuracia
confusionMatrix(matriz_confusao)







