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
    primary_key: yes
    # action: {
    #   label: "Send Emails"
    #   url: "https://segment.com"
    #   icon_url: "https://seeklogo.com/images/S/segment-logo-FCBB33F58E-seeklogo.com.png"
    #   form_url: "https://example.com/ping/{{ value }}/form.json"
    #   param: {
    #     name: "name string"
    #     value: "value string"
    #   }
    #   form_param: {
    #     name: "name string"
    #     type: string
    #     label: "possibly-localized-string"
    #     option: {
    #       name: "name string"
    #       label: "possibly-localized-string"
    #     }
    #     required: yes
    #     description: "possibly-localized-string"
    #     default: "string"
    #   }
    #   user_attribute_param: {
    #     user_attribute: project_access
    #     name: "name_for_json_payload"
    #   }
    # }
    action: {
      label: "SendGrid API"
      url: "https://api.sendgrid.com/v3/mail/send"
      icon_url: "https://d15tnd3q55f8nl.cloudfront.net/static/SG_Twilio_Lockup_Social-56f3cfd2f6b0c62422980170d57fac64.png"

      form_param: {
        name: "to"
        label: "To Email Address"
        default: "{{ value }}"
        description: "e.g. test@example.com"
        type: string
        required: yes
      }
      form_param: {
        name: "from"
        label: "from Email Address"
        default: "{{ value }}"
        description: "e.g. test@example.com"
        type: string
        required: no
      }
      form_param: {
        name: "subject"
        label: "Subject Email"
        required: yes
      }
      form_param: {
        name: "body"
        type: textarea
        required: yes
      }

    }

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
    tags: ["phone"]
    type: string
    sql: ${TABLE}.google_auth_id ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.Lastname ;;
  }

  dimension: client_la_long {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longtitude ;;
  }


# dimension: latitude {
#     type: number
#     sql: ${TABLE}.latitude ;;
#   }

  dimension: lineliff_id {
    type: string
    sql: ${TABLE}.lineliff_id ;;
  }

  # dimension: longtitude {
  #   type: number
  #   sql: ${TABLE}.longtitude ;;
  # }

  dimension: telephone {
    tags: ["phone"]
    type: string
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
