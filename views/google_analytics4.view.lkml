view: google_analytics4 {
  sql_table_name: `looker_dataset_demo.google_analytics4`
    ;;

  dimension_group: date {
    label: "Date"
    description: "วันที่"
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

  dimension: ep_event_label {
    type: string
    sql: ${TABLE}.ep_event_label ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: ga_session_id {
    type: number
    sql: ${TABLE}.ga_session_id ;;
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.User_ID ;;
    drill_fields: [expand_detail*]
  }

  measure: total_event {
    type: sum
    sql: ${TABLE}.total_event ;;
    drill_fields: [event_name]
  }

  measure: count {
    type: count
    drill_fields: [event_name]
  }

  set: expand_detail {
    fields: [user_id,line_liff.key_message]
  }
}
