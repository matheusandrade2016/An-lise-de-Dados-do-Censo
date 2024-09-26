# Pre-processamento dos dados

# Instalando a Biblioteca Necessaria
# install.packages('caTools')

# Importando minha Biblioteca para a ultiliza~]ao
library(caTools)


# Base de dados Census

# Exemplos das minhas variaveis e colunas 

# coluna age --> variavel discreta "numeros finitos"
# coluna workclass --> variavel categorica "nominal"
# coluna final-weight --> variavel numerica "continua"
# coluna education --> variavel categorica "ordinal"
# coluna education-num --> variavel discreta ""numeros finitos"

# Importando minha base de dados do census

# Coluna income --> minha classe previsora

base <-  read.csv('census.csv')

# Verificando um resumo sobre os dados
str(base)

# Verificando um resumo estatistico na base de dados
summary(base)

# Verificando se temos valores NA
sum(is.na(base))


###########################################################

# 20 --> Transformacaoo de atributos categoricos - base censo

# Iremos 1 ajustar a coluna sexo 0 para "Feminimo" e 1 para "masculino"

# Fazndo uma contagem na coluna atraves do comando table "sex" 
table(base$sex)

# Podemos tabem ultilizar o comando unique para trazer a contagem levels
unique(base$sex)

# Teste onde minha transformacao na coluna  "sex" pelo comando factor
# substituir de Male e Female para  0 e 1

base$sex <-  factor(base$sex, levels = c(' Female', ' Male'), labels = c(0, 1 ))


# Fazendo para todos os valores onde nossas variaveis algumas são categoricas

base$workclass <-  factor(base$workclass, levels = c(' Federal-gov', ' Local-gov', ' Private', ' Self-emp-inc', ' Self-emp-not-inc', ' State-gov', ' Without-pay'), labels = c(1, 2, 3, 4, 5, 6, 7))
base$education <-  factor(base$education, levels = c(' 10th', ' 11th', ' 12th', ' 1st-4th', ' 5th-6th', ' 7th-8th', ' 9th', ' Assoc-acdm', ' Assoc-voc', ' Bachelors', ' Doctorate', ' HS-grad', ' Masters', ' Preschool', ' Prof-school', ' Some-college'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16))
base$marital.status <-  factor(base$marital.status, levels = c(' Divorced', ' Married-AF-spouse', ' Married-civ-spouse', ' Married-spouse-absent', ' Never-married', ' Separated', ' Widowed'), labels = c(1, 2, 3, 4, 5, 6, 7))
base$occupation <- factor(base$occupation, levels = c(' Adm-clerical', ' Armed-Forces', ' Craft-repair', ' Exec-managerial', ' Farming-fishing', ' Handlers-cleaners', ' Machine-op-inspct', ' Other-service', ' Priv-house-serv', ' Prof-specialty', ' Protective-serv', ' Sales', ' Tech-support', ' Transport-moving'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14))
base$relationship <-  factor(base$relationship, levels = c(' Husband', ' Not-in-family', ' Other-relative', ' Own-child', ' Unmarried', ' Wife'), labels = c(1, 2, 3, 4, 5, 6))
base$race = factor(base$race, levels = c(' Amer-Indian-Eskimo', ' Asian-Pac-Islander', ' Black', ' Other', ' White'), labels = c(1, 2, 3, 4, 5))
base$native.country <-  factor(base$native.country, levels = c(' Cambodia', ' Canada', ' China', ' Columbia', ' Cuba', ' Dominican-Republic', ' Ecuador', ' El-Salvador', ' England', ' France', ' Germany', ' Greece', ' Guatemala', ' Haiti', ' Holand-Netherlands', ' Honduras', ' Hong', ' Hungary', ' India', ' Iran', ' Ireland', ' Italy', ' Jamaica', ' Japan', ' Laos', ' Mexico', ' Nicaragua', ' Outlying-US(Guam-USVI-etc)', ' Peru', ' Philippines', ' Poland', ' Portugal', ' Puerto-Rico', ' Scotland', ' South', ' Taiwan', ' Thailand', ' Trinadad&Tobago', ' United-States', ' Vietnam', ' Yugoslavia'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41))
base$income <-  factor(base$income, levels = c(' <=50K', ' >50K'), labels = c(0, 1))

# Apos nosso tratamento podemos verificar novamente se temos valores Ausentes,
# neste caso com os levels das variaveis podemos vizulizar que geramos
# valores ausentes 

sum(is.na(base))

# Iremos apagar esses valores pois nossa base de dados nesse exemplo iremos
# apagar "mais para esse exemplo"

# antes do codigo --> 32561 dados
# depois do codigo --> 30162 dados

base <- na.omit(base)



############################################################################

# 21 -> Escalonamento de atributos

# Deixando os valores na mesma escala, pois muitos algoritmos de Machine Leaning
# precisam aprender e se uma classe for mais que a outra podemos ter um problema
# sobre overffiting

base[, 1] <-  scale(base[, 1])
base[, 3] <-  scale(base[, 3])
base[, 5] <-  scale(base[, 5])
base[, 11:13] <-  scale(base[, 11:13])


############################################################################

# 23 - Separando minha base entre treinamento e teste

# Chamando o comando set.seed, ou seja nossa semente aleatoria

set.seed(1)

# Criando minha varavel classe "resposta" onde sera nossa divisão para os
# dados

divisao <- sample.split(base$income, SplitRatio = 0.85)
divisao

# Criando minha base de treinamento

# 1500 --> para treinar

base_treinamento <-  subset(base, divisao == TRUE)

# Criando minha base de dados de teste

 # 500 --> para testar

base_teste <- subset(base, divisao == FALSE) 

