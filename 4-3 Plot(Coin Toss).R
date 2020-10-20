plot(NA, xlab = "������ ���� Ƚ��", ylab = "�ո��� ������ Ȯ��", 
     xlim = c(0, 100), ylim = c(0, 1), 
     main = "���� ������ Ƚ���� ���� �ո��� ���� Ȯ�� ��ȭ")
abline(h = 0.5, col = "red", lty = 2)

count <- 0

for(n in 1:100) {
  coin <- sample(c("�ո�", "�޸�"), 1)
  
  if(coin == "�ո�") {
    count = count + 1
  } 
  
  prob <- count / n
  points(n, prob)
  Sys.sleep(1)
}

# Assignment
plot(NA, xlab = "������ ���� Ƚ��", 
     ylab = "�ո��� ������ ����", 
     xlim = c(0,30000), ylim = c(0.0, 1.0), 
     main = "���� ������ Ƚ���� ���� �ո��� ���� Ȯ�� ��ȭ")
abline(h = 0.5, col = "red", lty = 2)

count <- 0

for(n in 1:30000) {
  coin <- sample(c("�ո�", "�޸�"), 1)
  if(coin == "�ո�") {
    count = count + 1
  } 
  prob <- count / n
  points(n, prob)
}