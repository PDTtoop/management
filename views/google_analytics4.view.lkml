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


  dimension: client_session {
    type: string
    sql: ${TABLE}.client_session ;;
  }

  dimension: user_interaction_hit {
    primary_key: yes
    type: string
    sql: ${TABLE}.user_interaction_hit ;;
  }


  dimension: is_purchase_event {
    type: yesno
    sql: ${event_name} = 'purchase' ;;
  }



  measure: unique_visitors {
    label: "Unique Visitors"
    type: count_distinct
    description: "Uniqueness determined by user id"
  # view_label: "Visitors"
    sql: ${user_id} ;;
  }

  measure: total_event {
    type: sum
    sql: ${TABLE}.total_event ;;
    drill_fields: [event_name]
  }

  measure: hit_number {
    type: sum
    sql: ${TABLE}.hit_number ;;
  }

  measure: all_sessions {
    view_label: "Funnel View"
    label: "(1) All Sessions"
    type: count
  }

  measure: count_slide_or_later{
    view_label: "Funnel View"
    label: "(2) Browse or Later Sessions"
    type: count
    filters: {
      field: event_name
      value: "slide_content,selected,view_content,purchase,in_app_perchase"
    }
  }

  measure: count_selected_or_later{
    view_label: "Funnel View"
    label: "(3) Select or Later Sessions"
    type: count
    filters: {
      field: event_name
      value: "selected,view_content,purchase,in_app_perchase"
    }
  }

  measure: count_view_or_later{
    view_label: "Funnel View"
    label: "(4) View or Later Sessions"
    type: count
    filters: {
      field: event_name
      value: "view_content,purchase,in_app_perchase"
    }
  }

  measure: count_purchase_or_later{
    view_label: "Funnel View"
    label: "(5) Purchase Sessions"
    type: count
    filters: {
      field: event_name
      value: "purchase,in_app_perchase"
    }
  }

  measure: count {
    type: count
    drill_fields: [event_name]
  }

  set: expand_detail {
    fields: [user_id,line_liff.key_message,line_liff.lineliff_id]
  }
}
