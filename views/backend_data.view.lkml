view: backend_data {
  sql_table_name: `looker_dataset_demo.backend_data`
    ;;

  dimension: channel {
    type: string
    sql: ${TABLE}.Channel ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: user_interaction_hit {
    type: string
    sql: ${TABLE}.user_interaction_hit ;;
  }


  dimension: transaction_no_ {
    type: string
    sql: ${TABLE}.Transaction_No_ ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserId ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quanity ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }

  measure: total {

    sql: sum(${quantity}) over() ;;

  }


}
