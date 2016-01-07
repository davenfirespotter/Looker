- view: dailyactive
  sql_table_name: LookerPOC.DAUWAUMAU_Company

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension : Date
    type: string
    sql: ${TABLE}.reportdate

  - dimension: DailyActiveUsers
    type: int
    sql: ${TABLE}.dau

  - dimension: WeeklyActiveUsers
    type: int
    sql: ${TABLE}.wau

  - dimension: MonthlyActiveUsers
    type: int
    sql: ${TABLE}.mau

  - dimension: CompanyID
    type: int
  
    sql: ${TABLE}.companyid

  sets:
    detail:
      - reportdate
      - dau
      - wau
      - mau
      - companyid

