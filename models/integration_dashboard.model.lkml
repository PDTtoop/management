connection: "intergration_dashboards"

# include all the views
include: "/views/**/*.view"

datagroup: integration_model_default_datagroup {
  label: "desired label"
  description: "description string"
  # sql_trigger: SELECT MAX(user_id) FROM google_analytics4;;
  max_cache_age: "24 hour"
  interval_trigger: "6 hours"
}

persist_with: integration_model_default_datagroup

explore: google_analytics4 {
  label: "Data Warehouse"
  view_name: google_analytics4

  join: crm_data {
    type: left_outer
    view_label: "CRM"
    relationship: many_to_one
    sql_on: ${google_analytics4.user_id} =${crm_data.user_id} ;;
  }

  join: backend_data {
    type: left_outer
    view_label: "Backend"
    relationship: many_to_one
    sql_on: ${google_analytics4.user_interaction_hit}=${backend_data.user_interaction_hit}   ;;
  }

  join: facebook {
    type: left_outer
    view_label: "Facebook"
    relationship: many_to_one
    sql_on: ${facebook.user}=  ${crm_data.user_id} ;;
  }

  join: product_feed {
    type: left_outer
    view_label: "Product Feed"
    relationship: many_to_one
    sql_on: ${google_analytics4.ep_event_label} = ${product_feed.product_name}  ;;
  }

  join: line_liff {
    type: left_outer
    view_label: "Line-Liff"
    relationship: many_to_one
    sql_on: ${line_liff.lineliff_id} = ${crm_data.lineliff_id};;
  }

  join: stock {
    type: left_outer
    view_label: "stock"
    relationship: one_to_one
    sql_on: ${product_feed.sku} = ${stock.sku} ;;
  }
  }

  explore: backend_data {
    label: "Transactions"
    view_name: backend_data

    join: product_feed{
      type: left_outer
      view_label: "Product Feed"
      relationship: many_to_one
      sql_on: ${backend_data.product_name}=${product_feed.product_name}  ;;
    }

    join: stock{
      type: left_outer
      view_label: "Stock"
      relationship: many_to_one
      sql_on: ${product_feed.sku}=${stock.sku}  ;;
    }

    join: crm_data {
      type: left_outer
      view_label: "CRM"
      relationship: many_to_one
      sql_on: ${backend_data.user_id} =${crm_data.user_id} ;;
    }



    }
