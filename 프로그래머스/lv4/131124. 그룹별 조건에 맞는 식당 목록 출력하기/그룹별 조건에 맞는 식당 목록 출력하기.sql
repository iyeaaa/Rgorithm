SELECT A.MEMBER_NAME,
B.REVIEW_TEXT,
DATE_FORMAT(B.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE A
JOIN REST_REVIEW B ON A.MEMBER_ID = B.MEMBER_ID
WHERE B.MEMBER_ID IN (SELECT MEMBER_ID
                      FROM REST_REVIEW
                      GROUP BY MEMBER_ID
                      HAVING MEMBER_ID = (SELECT
                                          MEMBER_ID
                                          FROM REST_REVIEW
                                          GROUP BY MEMBER_ID
                                          ORDER BY COUNT(*) DESC
                                          LIMIT 1)
                     )
ORDER BY 3, 2