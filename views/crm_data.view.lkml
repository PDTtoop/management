view: crm_data {
  sql_table_name: `looker_dataset_demo.crm_data`
    ;;

  dimension: client_location {
    type: string
    sql: ${TABLE}.client_location ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: facebook_auth_id {
    type: string
    sql: ${TABLE}.facebook_auth_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: google_auth_id {
    type: string
    sql: ${TABLE}.google_auth_id ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.Lastname ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: lineliff_id {
    type: string
    sql: ${TABLE}.lineliff_id ;;
  }

  dimension: longtitude {
    type: number
    sql: ${TABLE}.longtitude ;;
  }

  dimension: telephone {
    type: number
    sql: ${TABLE}.telephone ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserID ;;
  }

  measure: count {
    type: count
    drill_fields: [lastname, first_name]
  }
}
