- connection: bq_connection

  sql_table_name: LookerPOC.DAUWAUMAU_Company

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: dailyactive
