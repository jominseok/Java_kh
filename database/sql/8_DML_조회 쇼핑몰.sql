# abc123 회원이 주문 내역을 확인하는 쿼리 
SELECT * FROM `ORDER` WHERE OR_ME_ID = 'abc123';

# 기타(1)에 포함된 모든 제품을 조회하는 쿼리
SELECT * FROM PRODUCT WHERE PR_CA_NUM = 1;

# 기타(1), 자동차(5), 의류(3)에 포함된 모든 제품을 조회하는 쿼리 
SELECT * FROM PRODUCT WHERE PR_CA_NUM = 1 OR PR_CA_NUM = 3 OR PR_CA_NUM = 5;
SELECT * FROM PRODUCT WHERE PR_CA_NUM IN (1, 3, 5);

# 등록된 제품들의 카테고리 번호를 조회하는 쿼리 
SELECT DISTINCT PR_CA_NUM FROM PRODUCT;

# 가격이 높은 순으로 제품을 정렬하는 쿼리
SELECT * FROM PRODUCT ORDER BY PR_PRICE DESC, PR_CODE;

# 제품 페이지에서 1페이지에 있는 제품을 조회하는 쿼리(한 페이지에 제품은 2개 조회)
SELECT * FROM PRODUCT LIMIT 0, 2;
# 2페이지에 있는 제품을 조회하는 쿼리(한 페이지에 2개 조회)
# 2번지 = 컨텐츠개수 * (2페이지 - 1)
SELECT * FROM PRODUCT LIMIT 2, 2;
# 10페이지에 있는 제품을 조회하는 쿼리
SELECT * FROM PRODUCT LIMIT 18, 2;

# 카테고리 별 등록된 제품의 개수를 조회 
SELECT 
	PR_CA_NUM AS '카테고리번호', COUNT(PR_CA_NUM) AS '제품수' 
FROM 
	PRODUCT 
GROUP BY 
	PR_CA_NUM;

# 카테고리 별 등록된 제품의 개수가 2개 이상인 카테고리를 조회
SELECT 
	PR_CA_NUM AS '카테고리번호', COUNT(PR_CA_NUM) AS '제품수' 
FROM 
	PRODUCT 
GROUP BY 
	PR_CA_NUM
HAVING 
	COUNT(PR_CA_NUM) >= 2;
    
# abc123회원이 지금까지 주문한 총 금액을 조회하는 쿼리 
SELECT 
	OR_ME_ID AS '구매아이디', SUM(OR_TOTAL_PRICE) AS `총 구매금액` 
FROM 
	`ORDER`
WHERE
	OR_ME_ID = 'abc123' AND OR_STATE NOT IN("반품", "환불")
group by
	OR_ME_ID;

# 제품별 판매된 개수를 조회하는 쿼리 
SELECT 
    OR_PR_CODE, SUM(OR_AMOUNT)
FROM
    `ORDER`
WHERE OR_STATE NOT IN("반품", "환불")
GROUP BY OR_PR_CODE;

# 제품별 카테고리명을 조회하기 위한 INNER JOIN 쿼리
SELECT PRODUCT.*, CA_NAME
FROM 
	PRODUCT
JOIN
	CATEGORY
ON
	# PRODUCT의 외래키를 CATEGORY의 기본키와 연결 
    # 속성명이 다르면 테이블명을 생략할 수 있다 
	PR_CA_NUM = CA_NUM;

# 기타로 등록된 제품들을 조회하는 쿼리 
SELECT 
    *
FROM
    PRODUCT
        JOIN
    CATEGORY ON PR_CA_NUM = CA_NUM
WHERE
	CA_NAME = "기타";

# abc123회원이 주문한 제품목록을 조회하는 쿼리
SELECT DISTINCT
    PR_TITLE AS 제품명
FROM
    `ORDER`
        JOIN
    PRODUCT ON OR_PR_CODE = PR_CODE
WHERE
	OR_ME_ID = "abc123" AND OR_STATE NOT IN("환불", "반품");

# 각 제품별 판매된 개수(판매된 제품에 한해서)
SELECT 
    PR_TITLE, SUM(OR_AMOUNT) AS 판매수
FROM
    `ORDER`
        JOIN
    PRODUCT ON OR_PR_CODE = PR_CODE
WHERE
	OR_STATE NOT IN("반품", "환불")
GROUP BY PR_CODE;
    
# 각 제품별 판매된 개수(모든 제품에 한해서)
SELECT 
	# IFNULL(속성, 값A) : 속성이 NULL인 경우 NULL 대신 값A로 변경 
    PR_TITLE, IFNULL(SUM(OR_AMOUNT), 0) AS 판매수량
FROM
    PRODUCT
        LEFT JOIN
    `ORDER` ON PR_CODE = OR_PR_CODE
WHERE
	OR_STATE IS NULL OR OR_STATE NOT IN("환불", "반품")
GROUP BY PR_CODE;

SELECT 
    PR_TITLE, IFNULL(SUM(OR_AMOUNT), 0) AS 판매수량
FROM
	`ORDER` 
        RIGHT JOIN
    PRODUCT	ON PR_CODE = OR_PR_CODE
WHERE
	OR_STATE IS NULL OR OR_STATE NOT IN("환불", "반품")
GROUP BY PR_CODE;


#모든 제품을 조회하는 쿼리
select * from product;

#모든 카테고리를 조회하는 쿼리
select * from category;

#제품별 카테고리를 조회. 카테고리, 제품을 조회
SELECT 
    pr_title as 카테고리, ca_name as 제품명
FROM
    product
        JOIN
    category ON pr_ca_num = ca_num;

# 기타 카테고리에 포함된 모든 제품을 조회
select ca_name, product.* from category join product on pr_ca_num = ca_num where ca_name = "기타";

#abc123회원이 주문한 제품 목록을 조회
SELECT 
    or_date, or_state,or_amount, or_me_id AS 아이디, pr_title AS 제품명
FROM
    `order`
        JOIN
    product ON or_pr_code = pr_code
WHERE
    or_me_id = 'abc123';

#제품별 판매수량을 조회하는 쿼이
select pr_title 제품명, ifnull(sum(or_amount), 0)  판매수량 from `order` right join product on or_pr_code = pr_code where or_state not in ('반품', '환불') or or_state is null group by pr_code;

# 인기 제픔 조회. 인기제품은 누적판매량을 기준으로 상위 5개
select pr_title 제품명, ifnull(sum(or_amount), 0)  판매수량 from `order` right join product on or_pr_code = pr_code where or_state not in ('반품', '환불') or or_state is null group by pr_code order by 판매수량 DESC,
pr_price ASC limit 0, 5;

#가격이 제일 비싼 제품을 조회하는 쿼리
select * from product order by pr_price DESC limit 0, 1;

# 카테고리별 등록된 제품 수를 조회하는 쿼리
select  if(count(ca_num) > 0, count(ca_num),"제품 없음") as "카테고리 번호", ca_name as 카테고리명 from product right join category on pr_ca_num = ca_num group by ca_num;

# 회원별 누적 주문 금액을 조회 하는 쿼리
select * from `order`; 
select * from member;
#select or_me_id as "회원 아이디", sum(or_amount * or_total_price) as "합계" from `order` group by or_me_id;
select me_id, ifnull(sum(or_total_price), 0) as "누적금액" from `order` right join member on or_me_id = me_id group by me_id;

#회원별 등급을 조회하는 쿼리. 등급은 기본이 브론즈, 누적금액이 5만원 이상이면 실버, 누적금액이 8만원 이상이면 골드
select * from member;
select me_id,
case 
when ifnull(sum(or_total_price), 0) >= 80000 then '골드'
when ifnull(sum(or_total_price), 0) >= 80000 then '실버'
else '브론즈'
end as '등급' from `order` right join member on or_me_id = me_id group by me_id;

#제품 첨부파일을 추가한 후, 추가한 파일이 이미지인지 동영상인지 조회하는 쿼리
select 
	case right(im_file, 3) 
	when "jpg" then '이미지'
	when "png" then '이미지'
	when "mp4" then '영상'
	end as 종류, 
    im_file
from image;





