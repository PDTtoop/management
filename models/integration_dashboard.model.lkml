connection: "intergration_dashboard"

# include all the views
include: "/views/**/*.view"

datagroup: integration_model_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: integration_model_default_datagroup

explore: google_analytics4 {
  label: "Data Warehouse"
  view_name: google_analytics4

  join: crm_data {
    type: left_outer
    view_label: "CRM"
    relationship: one_to_many
    sql_on: ${crm_data.user_id} = ${google_analytics4.user_id} ;;
  }

  join: backend_data {
    type: left_outer
    view_label: "Backend"
    relationship: one_to_many
    sql_on: ${crm_data.user_id} = ${backend_data.user_id} ;;
  }

  join: facebook {
    type: left_outer
    view_label: "Facebook"
    relationship: one_to_many
    sql_on: ${crm_data.user_id} = ${facebook.user} ;;
  }

  join: product_feed {
    type: left_outer
    view_label: "Product Feed"
    relationship: one_to_many
    sql_on: ${product_feed.product_name} = ${google_analytics4.ep_event_label} ;;
  }

  join: line_liff {
    type: left_outer
    view_label: "Line-Liff"
    relationship: one_to_many
    sql_on: ${crm_data.lineliff_id} = ${line_liff.lineliff_id} ;;
  }

  join: stock {
    type: left_outer
    view_label: "stock"
    relationship: one_to_one
    sql_on: ${product_feed.sku} = ${stock.sku} ;;
  }

}
