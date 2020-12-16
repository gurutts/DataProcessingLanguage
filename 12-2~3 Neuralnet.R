# Call Libaraies
install.packages("neuralnet")
install.packages("MASS")
library(neuralnet)
library(MASS)

# ������ Ȯ��
head(Boston)

# �м� ��� ������ �Ҵ�
data <- Boston[, c(1, 2, 4, 5, 9, 14)]
head(data)

# ����ġ Ȯ��
na <- apply(data, 2, is.na)
na
apply(na, 2, sum)

# ������ ����ȭ
maxs <- apply(data, 2, max)
maxs
mins <- apply(data, 2, min)
mins
data.scaled <- scale(data, center = mins, scale = maxs - mins)
data.scaled

# �н���� �׽�Ʈ�� ������ �и�
n <- nrow(data.scaled)
set.seed(1234)
index <- sample(1:n, round(0.8 * n))
index

train <- as.data.frame(data.scaled[index, ])
head(train)

test <- as.data.frame(data.scaled[-index, ])
head(test)

# �н��� ����� ���� �Ҵ�
names.col <- colnames(train)
names.col

var.dependent <- names.col[6]
var.dependent

var.independent <- names.col[-6]
var.independent

f.var.independent <- paste(var.independent, collapse = "+")
f.var.independent

f <- paste(var.dependent, "~", f.var.independent)
f

# �н� �� ���� ���
nn <- neuralnet(f, data = train, hidden =c(3, 2), linear.output = T)
plot(nn)

# �׽�Ʈ
predicted <- compute(nn, test[, ])
predicted$net.result

predicted.real <- predicted$net.result * (maxs[5] - mins[5]) + mins[5]
predicted.real

test.real <- test$medv * (maxs[5] - mins[5]) + mins[5]
test.real

# ���� �� ��� ���� �� ��(����)
plot(test.real, predicted.real, xlim = c(0, 25), ylim = c(0, 25),
     main = "���� �� ����� �� ����", xlab = "���� ��", ylab = "���� ��",
     col = 'red', pch = 18, cex = 0.7)
abline(0, 1, col = "blue", lty = 2)

MAPE.nn <- sum(abs(test.real - predicted.real) / test.real * 100) / length(test.real)
MAPE.nn