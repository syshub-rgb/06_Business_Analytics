# Projeto Acadêmico - Data Science Academy
# https://www.datascienceacademy.com.br

# Health Analytics

# Projeto - Podemos Prever o Tempo de Sobrevivência dos Pacientes 1 Ano Após Receberem um Transplante?

# Diretório de trabalho

setwd("D:/R_Scripts/Projetos_Business_Analytics/HealthAnalytics")
getwd()



# Pacotes
library(dplyr)
library(ggcorrplot)
library(forecast)
library(nnet)
library(neuralnet)

# Carregando os Dados

dados <- read.csv("dados/dataset.csv", header = TRUE, na.strings = c(""))
dim(dados)


# Visualização dos Dados
View(dados)


# Tipos de Dados
str(dados)

# Explorando os dados das variáveis numéricas
hist(dados$AGE)
hist(dados$AGE_DON)
hist(dados$PTIME)

 
hist(dados$FINAL_MELD_SCORE)

# Explorando os dados das variáveis categóricas
dados$DIAB <- as.factor(dados.$DIAB)
table(dados$DIAB)

dados$PSTATUS <- as.factor(dados$PSTATUS)
table(dados$PSTATUS)


dados$GENDER <- as.factor(dados$GENDER)
dados$GENDER_DON <- as.factor(dados$GENDER_DON)
table(dados$GENDER)
table(dados$GENDER_DON)

dados$REGION <- as.factor(dados$REGION)
table(dados$REGION)


dados$TX_Year <- as.factor(dados$TX_Year)
table(dados$TX_Year)


dados$MALIG <- as.factor(dados$MALIG)
table(dados$MALIG)


dados$HIST_CANCER_DON <- as.factor(dados$HIST_CANCER_DON)
table(dados$HIST_CANCER_DON)


# Considerando apenas os pacientes que sobreviveram ao primeiro ano de cirurgia
# Para o erro não foi possível encontrar a função "%>%"
# Instalar os pacotes abaixo

install.packages("magrittr")
install.packages("knitr")
remove.packages("dplyr")
install.packages("dplyr") 
library(magrittr)
library(dplyr) 
library(knitr) 


dados1 <- dados %>%
  filter(PTIME > 365) %>%
  mutate(PTIME = (PTIME - 365))

dim(dados1)


# Dos pacientes que sobreviveram ao primeiro ano da cirurgia,
# filtramos os que permaneceram vivos por até três anos depois da cirurgia.
dados2 <- dados1 %>%
  
  

# Vamos separar variáveis numéricas e categóricas
# para variáveis categoricas usamos associação



# O RESTANTE DO CÓDIGO ESTÁ DENTRO DO MEU HD.


dados_fator <- dados2[,unlist(lapply(dados2, is.factor))]



# Correlação entre as variáveis numéricas
# Para variáveis categóricas usamos associação



# Padronização das variáveis numéricas e combinação em um novo dataframe 
# com as variáveis categóricas

# Padronização



# Divisão dos dados em treino e teste
set.seed(1)

?neuralnet
modelo_v2 <- neuralnet::neuralnet(PTIME ~ ., 
                                  data = dados_treino2, 
                                  linear.output = TRUE,
                                  hidden = 2,
                                  stepmax = 1e7)

# Plot
plot(modelo_v2,
     col.entry.synapse = "red", 
     col.entry = "brown",
     col.hidden = "green", 
     col.hidden.synapse = "black",
     col.out = "yellow", 
     col.out.synapse = "purple",
     col.intercept = "green", 
     fontsize = 10,
     show.weights = TRUE ,
     rep = "best")

# Avaliação do modelo

# Com dados de treino
modelo_v2_pred_1 <- compute(modelo_v2, dados_treino2)
accuracy(unlist(modelo_v2_pred_1), dados_treino2$PTIME)

# Com dados de teste
modelo_v2_pred_2 <- compute(modelo_v2, dados_teste2)
accuracy(unlist(modelo_v2_pred_2), dados_teste2$PTIME)

# Conclusão: O modelo de regressão linear apresentou uma taxa de erro menor e, portanto, 
# deve ser usado como versão final.

# Sim, conseguimos prever o tempo de sobrevivência dos pacientes 1 ano após receberem um transplante.

# Fim




















































