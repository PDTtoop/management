view: stock {
  sql_table_name: `looker_dataset_demo.stock`
    ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longtitude {
    type: number
    sql: ${TABLE}.longtitude ;;
  }

  dimension: physical_location {
    type: string
    sql: ${TABLE}.physical_location ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
