view: line_liff {
  sql_table_name: `looker_dataset_demo.line_liff`
    ;;

  dimension: click {
    type: number
    sql: ${TABLE}.click ;;
  }

  dimension: key_message {
    type: string
    sql: ${TABLE}.key_message ;;
  }

  dimension: line_type {
    type: string
    sql: ${TABLE}.line_type ;;
  }

  dimension: lineliff_id {
    type: string
    sql: ${TABLE}.lineliff_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
