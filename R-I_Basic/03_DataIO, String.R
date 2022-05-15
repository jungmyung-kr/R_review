############################
### Part-I. Basic
### 03) DataIO, String
############################


#01. 본문에서 작성한 titanic 변수를 다음과 같은 단계를 통해서 파일로 저장한 후 파일을 불러오시오.
titanic <- read.csv( 'https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv' )

#[단계 1] 'C:/ITWILL/3_Rwork/output' 폴더에 '행 이름' 없이 'titanic_df.csv'로 저장한다.
#힌트: write.csv() 함수 사용

getwd()
setwd('C:/ITWILL/3_Rwork/output')
write.csv(titanic, 'titanic_df.csv', row.names= FALSE)

#[단계 2] 'titanic_df.csv' 파일을 titanicData 변수로 가져와서 결과를 확인하고, titanicData의 관측치와 칼럼수를 확인한다.
#힌트: read.csv(), str() 함수 사용

titanicData <-read.csv('titanic_df.csv')
str(titanicData) # 'data.frame':	1316 obs. of  5 variables

#[단계 3] 1번, 3번 칼럼을 제외한 나머지 칼럼을 대상으로 상위 6개의 관측치를 확인한다. 
# 힌트 : 색인 이용 

head(titanicData[,c(-1,-3)])
#       class sex survived
# 1 1st class man      yes
# 2 1st class man      yes
# 3 1st class man      yes
# 4 1st class man      yes
# 5 1st class man      yes
# 6 1st class man      yes


################################################################################


# 02. R에서 제공하는 quakes 데이터셋을 대상으로 다음과 같이 처리하시오

data("quakes")
quakes # 지진 진앙지 데이터 셋 
str(quakes)
# 'data.frame':	1000 obs. of  5 variables:

# [단계1] 'C:/ITWILL/3_Rwork/output' 폴더에 row.names, quote 없이 "quakes_df.csv" 파일명으로 저장 

write.csv(quakes, 'quakes_df.csv', row.names= FALSE, quote = FALSE)

# [단계2] quakes_data로 파일 읽기 

quakes_data <- read.csv('quakes_df.csv')
quakes_data

# [단계3] mag 변수를 대상으로 평균 계산하기 

mean(quakes_data$mag) # [1] 4.6204


################################################################################


# 03. 다음의 Data2 객체를 대상으로 정규표현식을 적용하여 문자열을 처리하시오
Data2 <- c("2021-02-05 수입3000원","2021-02-06 수입4500원","2021-02-07 수입2500원")
library(stringr)


# 조건1) 일짜별 수입을 다음과 같이 출력하시오.
#  <출력 결과>  "3000원" "4500원" "2500원" 
price <- str_extract_all(string = Data2, pattern = "[0-9]{4}[가-힣]$")
unlist(price) 

# 조건2) 위 벡터에서 연속하여 2개 이상 나오는 모든 숫자를 제거하시오.  
#  <출력 결과> "-- 수입원" "-- 수입원" "-- 수입원"  
str_replace_all(string = Data2, pattern = "[0-9]{2}", replacement = "")

# 조건3) 위 벡터에서 -를 /로 치환하시오.
#   <출력 결과>  "2021/02/05 수입3000원" "2021/02/06 수입4500원" "2021/02/07 수입2500원"  
str_replace_all(string = Data2, pattern = "-", replacement = "/")

# 조건4) 모든 원소를 쉼표(,)에 의해서 하나의 문자열로 합치시오. 
# 힌트) str_c(데이터셋, collapse="구분자")함수 이용
#   <출력 결과>  "2021-02-05 수입3000원,2021-02-06 수입4500원,2021-02-07 수입2500원"
str_c(Data2, collapse = ",")

