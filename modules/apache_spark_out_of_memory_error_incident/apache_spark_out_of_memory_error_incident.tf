resource "shoreline_notebook" "apache_spark_out_of_memory_error_incident" {
  name       = "apache_spark_out_of_memory_error_incident"
  data       = file("${path.module}/data/apache_spark_out_of_memory_error_incident.json")
  depends_on = [shoreline_action.invoke_increase_memory]
}

resource "shoreline_file" "increase_memory" {
  name             = "increase_memory"
  input_file       = "${path.module}/data/increase_memory.sh"
  md5              = filemd5("${path.module}/data/increase_memory.sh")
  description      = "Increase the memory capacity of the server in use."
  destination_path = "/agent/scripts/increase_memory.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_increase_memory" {
  name        = "invoke_increase_memory"
  description = "Increase the memory capacity of the server in use."
  command     = "`chmod +x /agent/scripts/increase_memory.sh && /agent/scripts/increase_memory.sh`"
  params      = ["NEW_MEMORY_LIMIT"]
  file_deps   = ["increase_memory"]
  enabled     = true
  depends_on  = [shoreline_file.increase_memory]
}

