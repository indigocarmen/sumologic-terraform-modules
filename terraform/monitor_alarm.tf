# Sample Sumol

module "network_theat" {
  source               = "./modules/sumo_monitor"
  standard_name        = "Network Threat"
  standard_description = "Suspicious network activity detected, please investigate."
  
  standard_folder      = sumologic_monitor_folder.example.id
  slack_webhook     = sumologic_connection.slack_alerts.id
  
  standard_query = <<EOF
_sourceCategory= */*/FIREWALL or _sourceCategory=*/*/LB or _sourceCategory=*/*/ROUTER or _sourceCategory=*/*/WINDOWS or _sourceCategory=*/*/SERVER
| where Your_IP != "0.0.0.0" and Your_IP != "127.0.0.1"
| lookup type, actor, raw, threatlevel as malicious_confidence from sumo://threat/cs on threat=Your_IP
| where  type="ip_address" and !isNull(malicious_confidence)
| if (isEmpty(actor), "Unassigned", actor) as Actor
| count by Actor
EOF

  slack_override = <<EOF
{
 	"attachments": [
 		{
 			"pretext": "Sumo Logic Alert: {{SearchName}}",
 			"fields": [
 				{
 					"title": "Results",
 					"value": "{{SearchName}} fired at {{FireTime}}.
 				},
                {
                     "title": "<{{SearchQueryUrl}}| Query Link>"
                }
 			],
 			"mrkdwn_in": ["text", "pretext"],
 			"color": "#29A1E6"
 		}
 	]
 }
EOF
}