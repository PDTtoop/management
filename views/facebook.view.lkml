view: facebook {
  sql_table_name: `looker_dataset_demo.facebook`
    ;;

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
    sql: ${TABLE}.Date ;;
  }

  dimension: facebook_auth_id {
    type: string
    sql: ${TABLE}.facebook_auth_id ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.User ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
