resource "sumologic_connection" "slack_alerts" {
  name = "slack_connection"
  description = "Slack connection for notifications from Monitors"
  type = "WebhookConnection"
  webhook_type = "Slack"
  url = "https://google.com"
  default_payload = <<JSON
{
    "text": "Sumo Logic Warning *{{SearchName}}*",
    "attachments": [
        {
            "fields": [{
                "title": "Description",
                "value": "{{SearchDescription}}"
            }],
            "actions": [
                {
                    "name": "sumo",
                    "text": "Go to Sumo Search",
                    "type": "button",
                    "url": "{{SearchQueryURL}}"
                }
            ]
        }
    ]
}
JSON
}