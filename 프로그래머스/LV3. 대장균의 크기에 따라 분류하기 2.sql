# 상위 0~25% CRITICAL
# 26~50% HIGH , 51~75% MIDIUM, 76~100 LOW 
# PERCENT_RANK() 함수를 통해 크기별 4분위수를 구할 수 있음 
  
SELECT ID
    , CASE WHEN 75 <= PER  THEN 'LOW'
            WHEN 50 <= PER  THEN 'MEDIUM' 
            WHEN 25 <= PER  THEN 'HIGH'
            WHEN 0 <= PER  THEN 'CRITICAL' ELSE NULL END AS COLONY_NAME          
FROM (SELECT ID
    , SIZE_OF_COLONY
    , PERCENT_RANK() OVER(ORDER BY SIZE_OF_COLONY DESC) * 100 AS PER
FROM ECOLI_DATA) A
ORDER BY ID
