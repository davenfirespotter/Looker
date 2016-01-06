- view: dailyactive
  derived_table:
    sql: |
      SELECT
        *
      FROM [LookerPOC.DAUWAUMAU]
        

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

