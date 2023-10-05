terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "apache_spark_out_of_memory_error_incident" {
  source    = "./modules/apache_spark_out_of_memory_error_incident"

  providers = {
    shoreline = shoreline
  }
}