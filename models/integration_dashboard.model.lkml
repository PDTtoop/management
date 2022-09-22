connection: "intergration_dashboard"

# include all the views
include: "/views/**/*.view"

datagroup: integration_dashboard_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: integration_dashboard_default_datagroup

explore: crm_data {}

explore: faceook {}

explore: product_feed {}

explore: stock {}

explore: google_analytics4 {}

explore: backend_data {}

explore: line_liff {}
