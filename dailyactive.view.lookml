- view: ActiveUsers
  derived_table:
    sql: |
      SELECT
        *
      FROM (
        SELECT
          COALESCE(DAUDate,WAUDate,MAUDate) AS ReportDate,
          company.id,
          EXACT_COUNT_DISTINCT(IF(DAUDate IS NOT NULL,target.id,NULL)) AS DAU,
          EXACT_COUNT_DISTINCT(IF(WAUDate IS NOT NULL,target.id,NULL)) AS WAU,
          EXACT_COUNT_DISTINCT(IF(MAUDate IS NOT NULL,target.id,NULL)) AS MAU,
        FROM (
          SELECT
            DDate,
            company.id,
            target.id,
            Ind,
            DATE(IF(Ind=0,DDate,NULL)) AS DAUDate,
            DATE(IF(Ind<7,DATE_ADD(DDate,Ind,"Day"),NULL)) AS WAUDate,
            DATE(IF(Ind<30,DATE_ADD(DDate,Ind,"Day"),NULL)) AS MAUDate
          FROM (
            SELECT
              date(c.date_started) AS DDate,
              u.company.id AS company.id,
              c.target.id AS target.id,
              INTEGER(SPLIT("0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30",",")) AS Ind
            FROM
              [uv_entities.Call] c
            LEFT JOIN EACH
              [uv_entities.UserProfile] u
            ON
              c.target.id=u.__key__.id ) )
        WHERE
          COALESCE(DAUDate,WAUDate,MAUDate)<DATE(TIMESTAMP(CURRENT_DATE())/*Current_Timestamp()*/)
        GROUP EACH BY
          1,
          2 )
      
        order by 1 desc
        

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: reportdate
    type: string
    sql: ${TABLE}.reportdate

  - dimension: company_id
    type: int
    sql: ${TABLE}.company_id

  - dimension: dau
    type: int
    sql: ${TABLE}.dau

  - dimension: wau
    type: int
    sql: ${TABLE}.wau

  - dimension: mau
    type: int
    sql: ${TABLE}.mau

  sets:
    detail:
      - reportdate
      - company_id
      - dau
      - wau
      - mau

