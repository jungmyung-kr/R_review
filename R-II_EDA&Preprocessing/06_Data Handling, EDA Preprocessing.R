#########################################
### Part-II. EDA & Preprocessing
### 06) Data Handling, EDA Preprocessing
#########################################


# 01. dplyr 패키지에서 제공하는 함수를 이용하여 다음과 같이 단계별로 처리하시오. 
library(dplyr)
names(iris)
# [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"

# [단계1] iris의 꽃잎의 길이(Petal.Length) 칼럼을 대상으로 5.0 이상의 값만 필터링하여 q1에 저장하시오.

# [단계2] 01번에서 만든 q1을 대상으로 1,3,5번 칼럼만 선택하여 q2에 저장하시오.

# [단계3] 02번에서 만든 q2를 대상으로 1번, 3번 칼럼의 차를 구해서 diff 파생변수를 만들고, q3에 저장하시오.

# [단계4] 03번에서 만든 q3를 대상으로 꽃의 종(Species)별로 그룹화하여 Sepal.Length와 Petal.Length 변수의 평균을 계산하시오.

q1 <- iris %>% filter(iris$Petal.Length >= 5.0)
q2 <- q1 %>% select(Sepal.Length, Petal.Length, Species) 
q3 <- q2 %>% mutate(diff = Sepal.Length - Petal.Length)
q4 <- q3 %>% group_by(Species) %>% summarise(mean(Sepal.Length), mean(Petal.Length))
q4

# A tibble: 2 x 3
# Species    `mean(Sepal.Length)` `mean(Petal.Lengt~`
# <fct>               <dbl>               <dbl>
# 1 versicolor         6.35                5.05
# 2 virginica          6.69                5.65

################################################################################


# 02. mtcars 데이터셋의 qsec(1/4마일 소요시간) 변수를 대상으로 극단치(상위 0.3%)를 
# 발견하고, 정제하여 mtcars_df 이름으로 서브셋을 생성하시오.

library(ggplot2)
str(mtcars) 

# [단계1] 이상치 통계

# [단계2] 서브셋 생성

# [단계3] 정제 결과 확인 

result<- boxplot(mtcars$qsec) 
result$stats
# [,1]
# [1,] 14.500 -> 하한값
# [2,] 16.885
# [3,] 17.710
# [4,] 18.900
# [5,] 20.220 -> 상한값 
mtcars_df <- subset(mtcars, qsec >= 14.500 & qsec <= 20.220)
boxplot(mtcars_df$qsec)

################################################################################


# 03. 본문에서 생성된 dataset2의 resident 칼럼을 대상으로 NA 값을 제거한 후 dataset3 변수에 저장하시오.

dim(dataset2) # 248 12
dataset3 <- subset(dataset2, !is.na(resident)) 
dim(dataset3) # 231 12


################################################################################


# 04. 본문에서 생성된 dataset2의 직급(position) 칼럼을 대상으로 1급 -> 5급, 5급 -> 1급 형식으로
# 역코딩하여 position2 칼럼에 추가하시오.

position <- dataset2$position
dataset2$position2<- 6-position
head(dataset2)

################################################################################


# 05. dataset3의 gender 칼럼을 대상으로 1->"남자", 2->"여자" 형태로 코딩 변경하여 
# gender2 칼럼에 추가하고, 파이 차트로 결과를 확인하시오.


################################################################################


# 06. 나이를 30세 이하 -> 1, 31~55 -> 2, 56이상 -> 3 으로 리코딩하여 age3 칼럼에 추가한 후 
# age, age2, age3 칼럼만 확인하시오.


################################################################################


# 07. 정제된 dataset3를 대상으로 작업 디렉터리(c:/itwill/3_Rwork/output)에 cleanData.csv 파일명으로 
# 따옴표(quote)와 행 이름(row.names)을 제거하여 저장하고, new_data변수로 읽어오시오.

# (1) 정제된 데이터 저장

# (2) 저장된 파일 불러오기/확인


################################################################################


# 08. user_data.csv와 return_data.csv 파일을 이용하여 각 고객별 
# 반품사유코드(return_code)를 대상으로 다음과 같이 파생변수를 추가하시오.

# <조건1> 반품사유코드에 대한 파생변수 칼럼명 설명 
# 제품이상(1) : return_code1, 변심(2) : return_code2, 
# 원인불명(3) :> return_code3, 기타(4) : return_code4 

# <조건2> 고객별 반품사유코드를 고객정보(user_data) 테이블에 추가(join)

