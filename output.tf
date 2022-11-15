

#output for url site

output "url" {
  value       = azurerm_app_service.as[*].default_site_hostname
  description = "The url of the webapp nginx."
}

output "url1" {
  value       = azurerm_app_service.as1[*].default_site_hostname
  description = "The url of the webapp wordpress."
}

output "url2" {
  value       = azurerm_app_service.as2[*].default_site_hostname
  description = "The url of the webapp tomcat."
}



