view: product_feed {
  sql_table_name: `looker_dataset_demo.product_feed`
    ;;

  dimension: cast {
    type: string
    sql: ${TABLE}.`cast` ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}.creator ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: onair_end {
    type: string
    sql: ${TABLE}.onair_end ;;
  }

  dimension: onair_start {
    type: string
    sql: ${TABLE}.onair_start ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }


  dimension: season {
    type: number
    sql: ${TABLE}.Season ;;
  }

  dimension: sequel {
    type: string
    sql: ${TABLE}.Sequel ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: total_episode {
    type: number
    sql: ${TABLE}.total_episode ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_sale_price {
    type: number
    sql: sum(${TABLE}.sale_price) ;;
    value_format_name: usd_0
    }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
