# plot
women
height <- women$height
weight <- women$weight
plot(x = height, y = weight, xlab = "Ű", ylab = "������",
     main = "Ű�� �������� ��ȭ", pch = 23, type = "c")

# Histogram
quakes
mag <- quakes$mag
hist(mag, main = "���� �߻� ������ ����", xlab = "���� ����",
     ylab = "�߻� �Ǽ�", col = rainbow(10), breaks = seq(4, 6.5, by=0.5))
hist(mag, main = "���� �߻� ������ ����", xlab = "���� ����",
     ylab = "�߻� �Ǽ�", col = rainbow(10), freq = FALSE)
lines(density(mag), lwd = 2)

# Box Plot
boxplot(mag, main = "���� �߻� ������ ����", xlab = "����",
        ylab = "���� �Ը�", col = "red")