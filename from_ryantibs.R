library(ggplot2)
names(iris)
length(unique(iris$Species))
plot(x = iris$Sepal.Width, y = iris$Sepal.Length)
qplot(x = Sepal.Width, y = Sepal.Length, data = iris)
iris.plot.ggplot <- ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length))
iris.plot.ggplot + geom_point()
qplot(x = Sepal.Width, y = Sepal.Length, data = iris,
      geom = c("point", "smooth"), span = 0.2, method = "gam")

qplot(x = Sepal.Width, y = Sepal.Length, data = iris,
               geom = "jitter", alpha = I(1/5))

qplot(x = as.factor(Sepal.Width), y = Sepal.Length,
               data = iris, geom = "boxplot")
qplot(x = Species, y = Sepal.Length, data = iris, geom = "boxplot")
qplot(Sepal.Width, data = iris, geom = "histogram") + 
  geom_histogram(bins = 300)
qplot(Sepal.Width, data = iris, geom = "density")


## Texts manipulation in R
trump.lines = readLines("http://www.stat.cmu.edu/~ryantibs/statcomp/data/trump.txt")
class(trump.lines)
length(trump.lines)
trump.lines[1:5]
trump.text = paste(trump.lines, collapse = " ")
trump.words = strsplit(trump.text, split = " ")[[1]]
substr(trump.text, 1, 208)
trump.words[1:20]
trump.wordtab = table(trump.words)
length(trump.wordtab)
trump.wordtab[1:10]
trump.wordtab[2] == 1
trump.wordtab["America"]
trump.wordtab["great"]
trump.wordtab["wall"]
trump.wordtab["Canada"]
trump.wordtab.sorted = sort(trump.wordtab, decreasing = TRUE)
length(trump.wordtab.sorted)
head(trump.wordtab.sorted, 20)
tail(trump.wordtab.sorted, 20)
nw = length(trump.wordtab.sorted)
plot(1:nw, as.numeric(trump.wordtab.sorted), type = "l",
     xlab = "Rank", ylab = "Frequency")
C = 215; a = 0.57
trump.wordtab.zipf = C*(1/1:nw)^a
cbind(trump.wordtab.sorted[1:8], trump.wordtab.zipf[1:8])
plot(1:nw, as.numeric(trump.wordtab.sorted), type = "l",
     xlab = "Rank", ylab = "Frequency")
curve(C*(1/x)^a, from = 1, to = nw, col = "red", add = TRUE)

## Graphics
n = 50
set.seed(0)
x = sort(runif(n, min = -2, max = 2))
y = x^3 + rnorm(n)
plot(x, y)
## lty argument controls the line type and lwd the line width
plot(x, y, type = "l", lty = 1, lwd = 1)
trump.words.bis = strsplit(paste(trump.lines, collapse = " "),
                           split = "[[:space:]]|[[:punct:]]")[[1]]
trump.words.bis = tolower(trump.words.bis[trump.words.bis != ""])
trump.wlens = nchar(trump.words.bis)
hist(trump.wlens)
hist(trump.wlens, col = "pink", freq = TRUE, breaks = 0:20)
## Add a hisitgram to an existing histogram
hist(trump.wlens, col = "pink", freq = FALSE, breaks = 0:20,
     xlab = "Word length", main = "Trump word lengths")
hist(trump.wlens + 5, col = rgb(0,0.5,0.5,0.5),
     freq = FALSE, add = TRUE)

density.est = density(trump.wlens, adjust = 1.5)
names(density.est)
hist(trump.wlens, col = "pink", freq = FALSE, breaks = 0:20,
     xlab = "Word length", main = "Trump word lengths")
lines(density.est, lwd = 3)

## Plotting a heatmap
(mat = 1:5 %o% 6:10)
image(mat)
clockwise90 = function(a) { t(a[nrow(a):1,])}
image(clockwise90(mat))
phi = dnorm(seq(-2,2,length = 50))
normal.mat = phi %o% phi
image(normal.mat)
image(normal.mat, col = heat.colors(20))
image(normal.mat, col = terrain.colors(20)) # Terrain colors
image(normal.mat, col = topo.colors(20)) # Topological colors
## Drawing contour lines
contour(normal.mat)
image(normal.mat, col = terrain.colors(20))
contour(normal.mat, add = TRUE)

## Drawing a curve
curve(x^3)
curve(x^3, from=-3, to=3, lwd=3, col="red") # More plotting options
## Note: the x argument here and the x vector we defined above are
## different!
## Reminder: x here is a symbol
plot(x, y)
curve(x^3, lwd=3, col="red", add=TRUE)
rug(x)

## Drawing a surface
source("http://www.stat.cmu.edu/~ryantibs/statcomp/lectures/surface.R")
surface(x^3 + y^3, from.x=-3, to.x=3, from.y=-3, to.y=3)
surface(x^3 + y^3, from.x=-3, to.x=3, from.y=-3, to.y=3,
        theta=25, phi=15, col=terrain.colors(30),
        ticktype="detailed", mar=c(2,2,2,2))
## Adding points to a surface
persp.mat = surface(x^3 + y^3, from.x=-3, to.x=3, from.y=-3, to.y=3,
                    theta=25, phi=15, col=rgb(0,0,1,alpha=0.2),
                    ticktype="detailed", mar=c(2,2,2,2))
n1 = 500
x1 = runif(n1, -3, 3)
y1 = runif(n1, -3, 3)
z1 = x^3 + y^3 +5*rnorm(n1)
xy.list = trans3d(x1, y1, z1, persp.mat)
points(xy.list, pch=20)
