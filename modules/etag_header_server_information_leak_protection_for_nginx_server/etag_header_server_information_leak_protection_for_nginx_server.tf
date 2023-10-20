resource "shoreline_notebook" "etag_header_server_information_leak_protection_for_nginx_server" {
  name       = "etag_header_server_information_leak_protection_for_nginx_server"
  data       = file("${path.module}/data/etag_header_server_information_leak_protection_for_nginx_server.json")
  depends_on = [shoreline_action.invoke_stop_edit_start_nginx]
}

resource "shoreline_file" "stop_edit_start_nginx" {
  name             = "stop_edit_start_nginx"
  input_file       = "${path.module}/data/stop_edit_start_nginx.sh"
  md5              = filemd5("${path.module}/data/stop_edit_start_nginx.sh")
  description      = "Disable ETag header in the Nginx server configuration file to prevent its disclosure."
  destination_path = "/tmp/stop_edit_start_nginx.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_stop_edit_start_nginx" {
  name        = "invoke_stop_edit_start_nginx"
  description = "Disable ETag header in the Nginx server configuration file to prevent its disclosure."
  command     = "`chmod +x /tmp/stop_edit_start_nginx.sh && /tmp/stop_edit_start_nginx.sh`"
  params      = ["NGINX_CONFIG_FILE"]
  file_deps   = ["stop_edit_start_nginx"]
  enabled     = true
  depends_on  = [shoreline_file.stop_edit_start_nginx]
}

