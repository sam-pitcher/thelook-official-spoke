label: "Official Spoke: Core Business"
connection: "default_bigquery_connection"

# 1. Include Governed Views & Explore Templates from the Central Hub
include: "//thelook-antigravity/thelook_views/**/*.view.lkml"
include: "//thelook-antigravity/explores/thelook_hub.explore.lkml"

# Default datagroup required by central PDTs (user_order_facts)
datagroup: thelook_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM `sampitcher-playground.the_look_ca.order_items_table` ;;
  max_cache_age: "4 hours"
}

access_grant: pii_data {
  user_attribute: can_see_pii
  allowed_values: ["Yes", "yes", "true"]
}

persist_with: thelook_default_datagroup

# 2. Unhide official company-wide baseline explores
explore: +order_items {
  hidden: no
  label: "Order Items (Core Sales)"
  group_label: "Official Spoke"
}

explore: +users {
  hidden: no
  label: "Users (Customer Demographics)"
  group_label: "Official Spoke"
}

explore: +orders {
  hidden: no
  label: "Orders (Order-Level Facts)"
  group_label: "Official Spoke"
}
