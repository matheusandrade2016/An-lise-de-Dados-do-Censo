# Algoritmo de  Arvore de decisão

# Importand minha Biblioteca para ultilizar minha biblioteca
# install.packages('rpart')
library(rpart)

# Importando nossa biblioteca para verificar nossa acuracia
library(caret)


# Criando meu classificador onde ira fazer meu treinamento

# formula = income --> onde ser? minha classe

#  ~ --> para concatenar
# . "ponto e virgula" --> onde ele ira pegar o restante das colunas
# data = base_treinamento --> para fazer meu treinamento

classificador <-  rpart(formula = income ~ ., data = base_treinamento)

# Vizualizando minha arvore
rpart.plot::rpart.plot(classificador)

# Criando minha variavel de previs?o

# type = 'class' --> onde sera 0 e 1

previsoes <-  predict(classificador, newdata = base_teste[-15], type = 'class')

# Criando minha matriz de confus?o
matriz_confusao <-  table(base_teste[, 15], previsoes)
print(matriz_confusao)


# Verificando nossa acuracia
confusionMatrix(matriz_confusao)



########################################################################

# Arvore de decisão em R "Podando nossa Arvore"


classificador_poda <-  rpart(formula = income ~ ., data = base_treinamento)

# Vizualizando minha arvore
rpart.plot::rpart.plot(classificador_poda)


# Criando nossa variavel "PODA"
# cptable --> onde ira pegar a parte da poda

poda <-  classificador_poda$cptable[which.min(classificador_poda$cptable[, "xerror"]), "CP"]

# Verificando minha variavel
print(classificador_poda$cptable)

# Ultilzando o metodo prune (poda)
prune(classificador_poda, poda)


# Criando nossa previsoes 

previsoes_poda <- predict(classificador_poda, newdata = base_teste[-15], type = 'class')
previsoes_poda

# Gerando minha matriz de confusão
matriz_confusao_poda <- table(base_teste[, 15], previsoes_poda)
matriz_confusao_poda

confusionMatrix(matriz_confusao_poda)












