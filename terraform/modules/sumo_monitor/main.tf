resource "sumologic_monitor" "alarm" {
  name = var.standard_name
  description = var.standard_description
  type = "MonitorsLibraryMonitor"
  parent_id = var.standard_folder
  is_disabled = false
  content_type = "Monitor"
  monitor_type = "Logs"
  queries {
      row_id = "A"
      query = var.standard_query
  }
  triggers  {
    threshold_type = "GreaterThanOrEqual"
    threshold = 1.0
    time_range = "60m"
    occurrence_type = "ResultCount"
    trigger_source = "AllResults"
    trigger_type = var.standard_trigger_type
    detection_method = "StaticCondition"
    }
  triggers  {
    threshold_type = "LessThanOrEqual"
    threshold = 0.0
    time_range = "60m"
    occurrence_type = "ResultCount"
    trigger_source = "AllResults"
    trigger_type = "ResolvedCritical"
    detection_method = "StaticCondition"
  }
  notifications {
    notification {
      connection_type = "Webhook"
      connection_id = var.slack_webhook
      payload_override = var.slack_override
    }
    run_for_trigger_types = [var.standard_trigger_type]
  }
}
  