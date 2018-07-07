# Etablir un environnement de travail (working directory):
setwd("~/Desktop/Rworkshop/")

# Voir le path de notre environnement de travail:
getwd()

# Objets 
# Assigner une valeur à un objet
object.valid_123 = 24
object.valid_123 <- 3

# print la valeur de l'objet
object.valid_123

# Fonctions
# print une valeur
print(1)

myFunction(objet.valid_123) 
help(print) 
?print

# Vecteurs
luckyNumbers = c(4,8,15,16,23,42)
luckyNumbers

oneToTen = 1:10
oneToTen

tenOnes = rep(1,10) 
tenOnes

samples = c("sampA","sampB") 
samples

# Exercice 1:
my_list_names_7 = c("fraises","cerises","pommes","poires","raisins","abricots","canneberges")
my_vector_numbers <- c(13,5,2,24,5,6,19)

# manipulation de vecteurs
luckyNumbers[3] #troisieme element de la liste
luckyNumbers[2:4]

#assigner des valeurs au coordinees 2 a 4
luckyNumbers[2:4] = c(7,3,4)
luckyNumbers

#nombre d'elements
length(luckyNumbers)

#nome des elements
names(luckyNumbers)
# assigner un noms aux elements
names(luckyNumbers) = c("frank","henry","philip","steve","tom","francis")
names(luckyNumbers)
luckyNumbers["philip"]

# ordonner les valeurs d'un vecteur
sort(luckyNumbers)
x = sort(luckyNumbers)
sort(c(luckyNumbers,1:10,rep(1,3)))
rev(1:10)
sample(1:10)

# Exploration de vecteurs
# debut et fin d'un vecteur
head(samples)
summary(luckyNumbers)
mean(luckyNumbers)

# operations sur les vecteurs
#sur toutes les valeurs d'un vecteur
luckyNumbers + 10
# sur un seul element
luckyNumbers[3] - 10

luckyNumbers / 1:length(luckyNumbers)
luckyNumbers

# Exercice 2:
my_vector = c(4,5,6,7,-9)
new_vector = my_vector * 6
new_vector = new_vector + 21
new_vector = new_vector / 3
new_vector = new_vector -1
new_vector = new_vector /2
new_vector = new_vector - my_vector
new_vector

# Matrix
# definir une matrice
neo = matrix(1:12, 3, 4)
neo
neo[1,1]
neo[1:2,2:3]
neo[3,]
neo[,1]

# Exercice 3
# creer une matrice
ma_matrice = matrix(1:40,10,4)
head(ma_matrice)
ma_matrice[6,1] = 666
ma_matrice[3,] = 1

# operation de matrices
dim(neo)
# noms de rows
rownames(neo) = c("sample1","sample2","sample3")
colnames(neo) = c("gene1","gene2","gene3","gene4")
neo["sample2","gene1"]

# Exercice 4
#faire une matrice
mat4 = matrix(runif(400,1,650),100,4)
head(mat4)
# nommer les columns
colnames(mat4) = c("octobre","decembre","mai","janvier")
# ajouter 2 a la premiere column
mat4[,1] = mat4[,1]+2
head(mat4)
# multiplier la 2e column par 4
mat4[,2] = mat4[,2]*4
head(mat4)
# plus grande moyenne
print(c(mean(mat4[,1]),mean(mat4[,2]), mean(mat4[,3]), mean(mat4[,4])))
# plus grande valeur
summary(mat4)

# Exercice 5
# Import data
mydata = read.table("rworkshop_data.csv", as.is=T, header=T, row.names=1)
#print first 5 rows
head(mydata,5)
# combien de row et columns
dim(mydata)

# export data
write.table(mydata, file="copy_mydata.csv", quote=F, row.names=F, sep=",")
#sauvegarder des objets
save(luckyNumbers, tenOnes, neo, file="mes_vecteurs.RData")
# importer des objets
load("mes_vecteurs.RData")

#Plot
hist(mydata[,2])
plot(mydata[,3],mydata[,5], type="p")

hist(mydata[,2], main = "graphique de base", col="blue")

# Packages 
# installer un package (ggplot2)
install.packages("ggplot2")
#load package
library(ggplot2)

# Utiliser le package
?ggplot
