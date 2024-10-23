### Variáveis ###
a <- 10
b = 10
c <- a + b
name1 = "João"
name2 <- "Helena"

d <- c(name1, name2)
a <- c(10,20,30)
?summary
summary(d)
summary(a)

### Packages ###
#install.packages("stringr")
library(stringr)

nomecompleto <- str_c(name1, " ", name2)
print(nomecompleto)

### Operators ###
# +, -, *, **, /, ==, =, !=, & and |

### Numeric data ###
c = 10.29
mode(c)
c = as.integer(c)
print(c)
mode(c)
d = 10.72
d <- round(d)
print(d)

### Factors ###
ch = c(220,220,150,100,100)
summary(ch)
ch <- as.factor(ch)
summary(ch)

### Logic Data ###
log1 <- FALSE #0
log2 <- TRUE #1
logical <- c(1,log1,3)
print(logical)

### Vectors ###
c = c("joao", "helena")
is.vector(c)
mode(c)
log = c(TRUE,FALSE,TRUE)
mode(log)

### Lists ###
a = list(1,2,3,4)
is.list(a)
mode(a)
str(a)

e = list(c(1,2,3), "nome", 10)
str(e)
e[[1]][1]
View(e)

### Matrix ###
m <- matrix(1:9, nrow = 3)
m
mode(m)
class(m)

m[1,3]
m[1,2] <- "a"
m


### DATA FRAME ###
#criação de dataframe
setwd("/home/joao/R/curso")
df <- read.csv("DataFrame.csv")

#access e views
df
View(df)
summary(df)
df[1]
df$Nome

Col1 <- df[2]
Col2 <- df$Idade

class(df$Idade)
class(Col1)

#modificando o DF#
#excluindo variavel
df$Salário <- NULL

#alterando o tipo da variável dentoro do df
df$Profissão
summary(df$Profissão)
df$Profissão <- as.factor(df$Profissão)
df$Profissão
summary(df$Profissão)

#criando uma nova variável dentro do df
df$Nova <- "a"
class(df$Nova)
#df$Nova <- c(2,5,10) #gera erro
df$Nova <- c(2,5,10,NA,NA)
df$Nova <- NULL
df$Nova <- NA
df$Nova[1:3] <- c(2,5,10)
class(df$Nova)


### Filtros em Variǘeis ###
# criando
vogais = c("a","e","i","o","u")

#acesso
vogais[3] #"i"
vogais[-3] #"a","e","o","u"
vogais[3:5] #"i","o","u"

#dados considerando o comprimento
length(vogais)
vogais[3:length(vogais)]
vogais[(length(vogais)-2):length(vogais)]

#dados considerando outras variáveis
a <- 3
b <- 5
vogais[a:b]

#acesso através de condições
vogais[vogais=="e"]
vogais[vogais!="e"]

a <- c(1,2,3,4,5)
a[a>2]
a[a>=2]

#trabalhando com data frames
setwd("/home/joao/R/curso")
df <- read.csv("DataFrame.csv")

df[1]
df[1,]
#df[linha,coluna]

df[1:3]
df[-3]

df[1:1]
df[1,1:3]
df[1,-3]

#modificando o df
df <- df[c(-3,-1)]

#filtrando as variáveis
df[1,1]
df$Nome[1]
df$Nome[1:3]
df[df$Salário == 1,]

#modificando o df
df <- df[df$Salário == 1,]

#df x df1
df1 <- read.csv("DataFrame.csv")
View(df1)
View(df)

### Condicionais ###
if (5 == 5) 6 + 6
if (5  == 6) 6 + 6 else "Condição não atendida"

if (5 == 5) {
  "deu certo"
}

if (5 == 6) {
  "deu certo"
} else {
  "Condição não atendida"
}

#exemplo
idades = c(15,20)
nomes <- c("João", "Helena")
df <- data.frame(nomes,idades)

if (df$idades[df$nomes=="João"] > df$idades[df$nomes=="Helena"]){
  print(paste0("Mais velho: ", df[[1]][1]))
} else {
  print(paste0("Mais velho: ", df[[1]][2]))
}

idades <- c(25,30,24,29,31,12)
nomes <- c("joao", "maria", "lucas", "helena", "gomes", "brandao")
df <- data.frame(nomes, idades)

### Loops ###
#For
for (i in idades){
  print(i)
}

v <- 0
for (i in df$idades){
  if (i > v) {v <- i}
}
df$nomes[df$idades == v]

#While
y <- 0
while (y < 10){
  print(y)
  y <- y+1
}

#Exemplo q nos dá os primeiros números a ultrapassar a soma de 100 anos.
x <- 0
cont <- 0
idades100 <- 0

while(x < 100){
  cont =  cont + 1
  idades100[cont] <- idades[cont]
  x <- x + idades[cont]
}

idades
idades100
sum(idades100)
cont


### Funções ###
a <- c(423,464,69,519,123,258)
x = 0
for (i in a){
  x = x + i
}
print(x)

soma <- function (y){
  x <- 0
  for (i in y){
    x = x + i
  }
  print(x)
}

soma(a)