################################
### Part-II. EDA & Preprocessing
### 05) Data Visualization
################################


# 01. 다음 Bug_Metrics_Software 데이터셋을 이용하여 시각화하시오. 
install.packages('RSADBE')
library(RSADBE) # 패키지 로드  
data(Bug_Metrics_Software) # 데이터셋 로드 

# 단계1) 소프트웨어 발표 전 버그 수를 대상으로 각 소프트웨어별 버그를
# beside형 세로막대 차트로 시각화하기(각 막대별 색상적용) 
par(mfrow=c(1,2))
barplot(Bug_Metrics_Software[,,1], beside = T, 
        col = rainbow(5),
        xlab = '소프트웨어', 
        ylab='버그 수',
        main='소프트웨어 발표전 버그수')

# 단계2) 소프트웨어 발표 후 버그 수를 대상으로 각 소프트웨어별 버그를
# 누적형 가로막대 차트로 시각화하기(각 막대별 색상적용) 
barplot(Bug_Metrics_Software[,,2], beside = F, 
        horiz = TRUE,
        col = rainbow(5),
        xlab = '소프트웨어', 
        ylab='버그 수',
        main='소프트웨어 발표후 버그수')

# 범례 추가 
legend(x=800, y=6, 
       legend = row.names(Bug_Metrics_Software[,,2]),
       fill = rainbow(5))

################################################################################


# 02. quakes 데이터 셋을 대상으로 다음 조건에 맞게 시각화 하시오.

# 조건1) 1번 칼럼 : y축, 2번 컬럼 : x축 으로 산점도 시각화

# 조건2) 5번 컬럼으로 색상 지정 : col = 

# 조건3) "지진의 진앙지 산점도 차트" 제목 추가  : main = 

# 조건4) "quakes.jpg" 파일명으로 차트 저장하기
# 작업 경로 : "c:/itwill/3_Rwork/output"
# 파일명 : quakes.jpg
# 픽셀 : 폭(720픽셀), 높이(480 픽셀)

data(quakes) # 데이터셋 로드  
str(quakes)

setwd("c:/itwill/3_Rwork/output") 
jpeg("quakes.jpg", width=720, height=480) 
plot(quakes$long, quakes$lat, col = quakes$stations)
title(main="지진의 진앙지 산점도 차트")


################################################################################


# 03. iris3 데이터 셋을 대상으로 다음 조건에 맞게 산점도를 그리시오.

# 조건1) iris3 데이터 셋의 자료구조 확인 : 힌트) str() 

# 조건2) Setosa 꽃의 종을 대상으로 x축은 "Sepal W." 칼럼, 
#        y축은 "Sepal L." 칼럼으로 산점도 그리기 

# 조건3) "Versicolor" 꽃의 종을 대상으로 산점도 행렬 시각화하기  

str(iris3)
plot(iris3[,c(2,1),1])
plot(iris3[,c(2,1),2])

################################################################################


# 04. 각 년도별 물가상승률과 라면값 증가율을 비교하는 차트를 시각화하시오. 
# 시각화 결과 : "chap05_4번연습문제결과.png" 파일 참고 
# 힌트 : plot 2개 겹치기

setwd("c:/itwill/3_Rwork/data")
noodle = read.csv(file="noodle.csv")

str(noodle)

plot(noodle$year, noodle$price, type = 'o', 
     ylim = c(0, 500), ann = FALSE, col = 'blue')
par(new = T)
plot(noodle$year, noodle$noodle, type = 'o', 
     ann = FALSE, axes = FALSE, col = 'red')

# 제목 & 축 이름 추가
title(main = "물가와 라면값 증가율 비교")
title(xlab = "년도", col.lab='blue')
title(ylab = "증가율", col.lab='red')
# 범례 추가 
legend(x = 1980, y = 450, legend = c("물가", "라면"),
       lty = 1, col = c('blue', 'red'))




