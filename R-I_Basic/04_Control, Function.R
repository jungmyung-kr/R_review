############################
### Part-I. Basic
### 04) Control, Function
############################  


# 01. 다음 3개의 vector 데이터를 이용하여 client 데이터프레임을 
# 생성하고, 조건에 맞게 처리하시오.

# vector 준비 
name <-c("유관순","홍길동","이순신","신사임당")
gender <- c("F","M","M","F")
price <-c(50,65,45,75)

# 데이터프레임 생성 
client <- data.frame(name, gender, price)
client
#       name  gender price
# 1   유관순      F    50
# 2   홍길동      M    65
# 3   이순신      M    45
# 4 신사임당      F    75


# <단계1> price가 65만원 이상인 고객은 "Best" 미만이면 
#     "Normal" 문자열을 result 변수에 넣고, client의 객체에 컬럼으로 추가하기
# 힌트 : ifelse() 함수 이용 

client$result <- ifelse(client$price >= 65, "Best","normal")
client
#       name gender price result
# 1   유관순      F    50 normal
# 2   홍길동      M    65   Best
# 3   이순신      M    45 normal
# 4 신사임당      F    75   Best


# <단계2> client의 result 변수에 대한 빈도수를 구하시오. 힌트) table()함수 이용

table(client$result)
#  Best normal 
#     2      2 

# <단계3> gender가 'M'이면 "Male", 'F'이면 "Female" 형식으로 client의 객체에
#  gender2 컬럼을 추가하고 빈도수 구하기 # 힌트 : ifelse() 함수 이용 

client$gender2 <- ifelse(gender=="M","Male","Female")
client
#       name gender price result gender2
# 1   유관순      F    50 normal  Female
# 2   홍길동      M    65   Best    Male
# 3   이순신      M    45 normal    Male
# 4 신사임당      F    75   Best  Female

################################################################################


# 02. 다음 벡터(EMP)는 '입사년도이름급여'순으로 사원의 정보가 기록된 데이터 있다.
# 이 벡터 데이터를 이용하여 다음과 같은 출력결과가 나타나도록 함수를 정의하시오. 

# <Vector 준비>
EMP <- c("2014홍길동220", "2020이순신300", "2010유관순260")

# <단계1> EMP 변수의 전체 원소를 줄 단위로 출력하기(힌트 : for함수 이용)


# <단계2> 다음 <출력 결과>과 나타나도록 emp_pay 함수 완성하기(힌트 : stringr 패키지의 함수 이용) 

#  <출력 결과>
# 전체 급여 평균 : 260

# 힌트) 
# stringr 패키지 : str_extract(string, '패턴')함수 
# 숫자변환 함수 : as.numeric()함수
# 평균함수 : mean()함수 

emp_pay <- function(x) { # x = EMP   
  library(stringr) # 패키지 in memory 
  
  # 내용 채우기 
  pay <- c() # 빈 벡터 : 각 사원 급여 저장 
  
  for(emp in x){ # 사원수 만큼 반복
    # 접미어 $ 기호 이용 : 급여 추출 
    pay <- c(pay, str_extract(emp, '[0-9]{3}$')) # pay='220','300','260'
  }
  # 문자형 -> 숫자형 변환 
  pay <- as.numeric(pay) # pay=220,300,260
  # 평균 계산 
  pay_avg <- mean(pay )
  # 전체 급여 평균 출력 
  cat('전체 급여 평균 :', pay_avg)
}

# 함수 호출 
emp_pay(EMP)

################################################################################


# 03. 정규분포(평균=5, 표준편차=2)를 따르는 난수 10개를 생성한 후 정수 반올림한 결과가 짝수인 경우만
# 벡터 변수에 저장하고, 출력하시오.

# <출력결과 예>
# 난수 : 0.3525728 5.7390681 8.5128361 9.4952819 2.5950957 4.7318683 4.3414820 3.2547769 4.8177737 6.6418599
# 정수 반올림한 짝수 : 0.3525728 5.7390681 4.3414820

set.seed(111)
r <- rnorm(10, 5, 2) 
r
# [1] 5.4704414 4.3385283 4.3767524 0.3953087 4.6582479 5.2805565 2.0051467 2.9796232
# [9] 3.1030488 4.0120756

result <- c() 

for(i in r){
  if(round(i) %% 2 == 0)
    result <- c(result, i)  
}
result 
# [1] 4.3385283 4.3767524 0.3953087 2.0051467 4.0120756


