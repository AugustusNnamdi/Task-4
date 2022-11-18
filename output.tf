

#output for url site

output "url" {
  value       = azurerm_app_service.as[*].default_site_hostname
  description = "The url of the webapp nginx."
}

output "sloturl" {
  value       = azurerm_app_service_slot.as_slot[*].default_site_hostname
  description = "The url of the webapp wordpress."
}


output "slot1url" {
  value       = azurerm_app_service_slot.as_slot1[*].default_site_hostname
  description = "The url of the webapp wordpress."
}

