############################
### Part-I. Basic
### 02) Data Structure
############################


# 01. 다음과 같은 벡터 객체를 생성하시오.

#1) Vec1 벡터 변수를 만들고, 1~5까지 연속된 정수를 만드시오. - c()함수 이용 
vec1 <- 1:5 # 1 2 3 4 5

#2) Vec2 벡터 변수에 1~10까지 3간격으로 연속된 정수를 만드시오. - seq()함수 이용 
vec2 <- seq(1,10,3) # 1  4  7 10

#3) Vec3 벡터 변수에 "R" 문자가 5회 반복되도록 하시오. - rep()함수 이용 
vec3 <- rep('R',5) # "R" "R" "R" "R" "R"

#4) Vec4에는 Vec1~Vec2가 모두 포함되는 벡터를 만드시오. - c()함수 이용 
vec4 <- c(vec1,vec2) # 1  2  3  4  5  1  4  7 10

#5) 25~ -15까지 5간격으로 벡터 생성 - seq()함수 이용 
seq(25,-15,-5) # 25  20  15  10   5   0  -5 -10 -15

#6) Vec4에서 홀수번째 값들만 선택하여 Vec5에 할당하시오. - 색인 이용
vec5 <-vec4[seq(1,length(vec4),2)] # 1  3  5  4 10


################################################################################


# 02. 다음 두 개의 벡터를 이용하여 단계별로 처리하시오. 
v1 <- c(2,3,10,-5,8)
v2 <- c(40,50,-30,7,10)

# 단계1> 행 단위로 묶어서 matrix 생성하기  
ex1<-rbind(v1, v2)
#     [,1] [,2] [,3] [,4] [,5]
# v1    2    3   10   -5    8
# v2   40   50  -30    7   10

# 단계2> matrix 차원 보기 
dim(ex1) # 2 5

# 단계3> matrix 열 단위 합계 계산하기 
apply(ex1,2,sum) # 42  53 -20   2  18


################################################################################


# 03. 다음과 같은 벡터를 칼럼으로 갖는 DataFrame을 생성하시오.
name <-c("최민수","유관순", "이순신","김유신","홍길동")
age <-c(55,45,45,53,15) #연령
gender <-c(1,2,1,1,1) #1:남자, 2: 여자
job <-c("연예인","주부","군인","직장인","학생")
sat <-c(3,4,2,5,5) # 만족도
grade <- c("C","C","A","D","A")
total <-c(44.4,28.5,43.5,NA,27.1) #총구매금액(NA:결측치)

# <조건1> 위 7개 벡터를 user이름으로 데이터프레임 만들기 
user <- data.frame(name, age, gender, job, sat, grade, total)
user
#     name age gender    job sat grade total
# 1 최민수  55      1 연예인   3     C  44.4
# 2 유관순  45      2   주부   4     C  28.5
# 3 이순신  45      1   군인   2     A  43.5
# 4 김유신  53      1 직장인   5     D    NA
# 5 홍길동  15      1   학생   5     A  27.1


# <조건2> 총구매금액(total) 변수를 이용하여 히스토그램 그리기-hist()
total <- user$total
hist(total)

# <조건3> 만족도(sat) 변수를 이용하여 산점도 그리기-plot()
sat <- user$sat
plot(sat)

################################################################################


# 04. Data를 대상으로 apply()를 적용하여 행/열 방향으로 조건에 맞게 통계량을 구하시오.
kor <- c(90,85,90)
eng <- c(70,85,75)
mat <- c(86,92,88)    

# 조건1) 3개의 과목점수를 이용하여 데이터프레임(Data)을 생성한다. 
Data <- data.frame (kor, eng, mat)
Data
#   kor eng mat
# 1  90  70  86
# 2  85  85  92
# 3  90  75  88

# 조건2) 행/열 방향으로 max()함수를 적용하여 최댓값 구하기
apply(Data,1,max) # 90 92 90
apply(Data,2,max) # 90 85 92

# 조건3) 행/열 방향으로 mean()함수를 적용하여 평균 구하기(소숫점 2자리 까지 표현)
#  힌트 : round(data, 자릿수)
round(apply(Data,1,mean),2) # 82.00 87.33 84.33
round(apply(Data,2,mean),2) 
# kor   eng   mat 
# 88.33 76.67 88.67

# 조건4) 행 단위 분산과 표준편차 구하기  
#  힌트 : var(), sd()
apply(Data,1,var) # [1] 112.00000  16.33333  66.33333
# 1번 학생이 분산이 제일 크므로, 과목간 성적 편차가 큼
# 2번 학생은 평균과 차이가 크게 없는 

apply(Data,1,sd) # [1] 10.583005  4.041452  8.144528


################################################################################


# 05. R에서 제공하는 CO2 데이터셋을 대상으로 다음과 같이 서브셋을 만드시오.
# 힌트 : subset() 함수 이용 

data("CO2") # 데이터셋 메모리 로딩 
print(CO2) # 데이터셋 보기 
str(CO2) # 데이터셋 구조 보기 

# 단계1) Treatment 칼럼 값이 'nonchilled'인 자료만 df1로  만들기 
df1 <- subset(CO2, Treatment == 'nonchilled')

# 단계2) Treatment 칼럼 값이 'chilled'인 자료만 df2로 만들기 
df2 <- subset(CO2, Treatment == 'chilled')

# 단계3) Plant, Type, conc 칼럼을 대상으로 df3로 만들기  
df3 <- subset(CO2, select = c(1:2,4))
