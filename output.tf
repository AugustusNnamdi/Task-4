

#output for url site

output "url" {
  value       = azurerm_app_service.as[*].default_site_hostname
  description = "The url of the webapp nginx."
}



