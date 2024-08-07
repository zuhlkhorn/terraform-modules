variable "name_random_part_length" {
  default = 0
}

variable "namespace" {
  type = string
  validation {
    condition     = length(var.namespace) > 0
    error_message = "You must specify a namespace."
  }
  description = "The name of the application or project"
}

variable "environment" {
  type = string
  validation {
    condition     = length(var.environment) > 0
    error_message = "You must specify an environment."
  }
}

variable "prefix" {
  type = string
  validation {
    condition     = length(var.prefix) > 0
    error_message = "You must specify a prefix."
  }
  description = "A short prefix for all resources"
}

variable "resources" {
  type = list(string)
  default = ["azurerm_consumption_budget_subscription", "azurerm_monitor_action_group", "azurerm_monitor_diagnostic_setting", "azurerm_user_assigned_identity", "azurerm_analysis_services_server", "azurerm_api_management_service", "azurerm_app_configuration", "azurerm_role_assignment", "azurerm_role_definition", "azurerm_automation_account", "azurerm_automation_certificate", "azurerm_automation_credential", "azurerm_automation_runbook", "azurerm_automation_schedule", "azurerm_automation_variable", "azurerm_batch_account", "azurerm_batch_application", "azurerm_batch_certificate", "azurerm_batch_pool", "azurerm_bot_web_app", "azurerm_bot_channel_Email", "azurerm_bot_channel_ms_teams", "azurerm_bot_channel_slack", "azurerm_bot_channel_directline", "azurerm_bot_channels_registration", "azurerm_bot_connection", "azurerm_redis_cache", "azurerm_redis_firewall_rule", "azurerm_cdn_profile", "azurerm_cdn_endpoint", "azurerm_cognitive_account", "azurerm_availability_set", "azurerm_disk_encryption_set", "azurerm_image", "azurerm_linux_virtual_machine", "azurerm_linux_virtual_machine_scale_set", "azurerm_managed_disk", "azurerm_virtual_machine", "azurerm_virtual_machine_scale_set", "azurerm_windows_virtual_machine", "azurerm_windows_virtual_machine_scale_set", "azurerm_containerGroups", "azurerm_container_registry", "azurerm_container_registry_webhook", "azurerm_kubernetes_cluster", "azurerm_cosmosdb_account", "azurerm_custom_provider", "azurerm_mariadb_server", "azurerm_mariadb_firewall_rule", "azurerm_mariadb_database", "azurerm_mariadb_virtual_network_rule", "azurerm_mysql_server", "azurerm_mysql_firewall_rule", "azurerm_mysql_database", "azurerm_mysql_virtual_network_rule", "azurerm_postgresql_server", "azurerm_postgresql_firewall_rule", "azurerm_postgresql_database", "azurerm_postgresql_virtual_network_rule", "azurerm_database_migration_project", "azurerm_database_migration_service", "azurerm_databricks_workspace", "azurerm_kusto_cluster", "azurerm_kusto_database", "azurerm_kusto_eventhub_data_connection", "azurerm_data_factory", "azurerm_data_factory_dataset_mysql", "azurerm_data_factory_dataset_postgresql", "azurerm_data_factory_dataset_sql_server_table", "azurerm_data_factory_integration_runtime_managed", "azurerm_data_factory_pipeline", "azurerm_data_factory_linked_service_data_lake_storage_gen2", "azurerm_data_factory_linked_service_key_vault", "azurerm_recovery_services_vault", "azurerm_recovery_services_vault_backup_police", "azurerm_data_factory_linked_service_mysql", "azurerm_data_factory_linked_service_postgresql", "azurerm_data_factory_linked_service_sql_server", "azurerm_data_factory_trigger_schedule", "azurerm_data_lake_analytics_account", "azurerm_data_lake_analytics_firewall_rule", "azurerm_data_lake_store", "azurerm_data_lake_store_firewall_rule", "azurerm_dev_test_lab", "azurerm_dev_test_linux_virtual_machine", "azurerm_dev_test_windows_virtual_machine", "azurerm_frontdoor", "azurerm_frontdoor_firewall_policy", "azurerm_hdinsight_hadoop_cluster", "azurerm_hdinsight_hbase_cluster", "azurerm_hdinsight_kafka_cluster", "azurerm_hdinsight_interactive_query_cluster", "azurerm_hdinsight_ml_services_cluster", "azurerm_hdinsight_rserver_cluster", "azurerm_hdinsight_spark_cluster", "azurerm_hdinsight_storm_cluster", "azurerm_iotcentral_application", "azurerm_iothub", "azurerm_iothub_consumer_group", "azurerm_iothub_dps", "azurerm_iothub_dps_certificate", "azurerm_key_vault", "azurerm_key_vault_key", "azurerm_key_vault_secret", "azurerm_key_vault_certificate", "azurerm_lb", "azurerm_lb_nat_rule", "azurerm_public_ip", "azurerm_public_ip_prefix", "azurerm_route", "azurerm_route_table", "azurerm_subnet", "azurerm_traffic_manager_profile", "azurerm_virtual_wan", "azurerm_virtual_network", "azurerm_virtual_network_gateway", "azurerm_virtual_network_peering", "azurerm_network_interface", "azurerm_firewall", "azurerm_eventhub", "azurerm_eventhub_namespace", "azurerm_eventhub_authorization_rule", "azurerm_eventhub_namespace_authorization_rule", "azurerm_eventhub_namespace_disaster_recovery_config", "azurerm_eventhub_consumer_group", "azurerm_stream_analytics_job", "azurerm_stream_analytics_function_javascript_udf", "azurerm_stream_analytics_output_blob", "azurerm_stream_analytics_output_mssql", "azurerm_stream_analytics_output_eventhub", "azurerm_stream_analytics_output_servicebus_queue", "azurerm_stream_analytics_output_servicebus_topic", "azurerm_stream_analytics_reference_input_blob", "azurerm_stream_analytics_stream_input_blob", "azurerm_stream_analytics_stream_input_eventhub", "azurerm_stream_analytics_stream_input_iothub", "azurerm_shared_image", "azurerm_snapshots", "azurerm_storage_container", "azurerm_storage_data_lake_gen2_filesystem", "azurerm_storage_queue", "azurerm_storage_table", "azurerm_storage_share", "azurerm_storage_share_directory", "azurerm_machine_learning_workspace", "azurerm_storage_blob", "azurerm_bastion_host", "azurerm_local_network_gateway", "azurerm_application_gateway", "azurerm_express_route_gateway", "azurerm_express_route_circuit", "azurerm_point_to_site_vpn_gateway", "azurerm_template_deployment", "azurerm_sql_server", "azurerm_mssql_server", "azurerm_mssql_database", "azurerm_sql_elasticpool", "azurerm_mssql_elasticpool", "azurerm_sql_failover_group", "azurerm_sql_firewall_rule", "azurerm_log_analytics_workspace", "azurerm_service_fabric_cluster", "azurerm_maps_account", "azurerm_network_watcher", "azurerm_resource_group", "azurerm_network_security_group", "azurerm_network_security_group_rule", "azurerm_network_security_rule", "azurerm_application_security_group", "azurerm_dns_zone", "azurerm_private_dns_zone", "azurerm_notification_hub", "azurerm_notification_hub_namespace", "azurerm_notification_hub_authorization_rule", "azurerm_servicebus_namespace", "azurerm_servicebus_namespace_authorization_rule", "azurerm_servicebus_queue", "azurerm_servicebus_queue_authorization_rule", "azurerm_servicebus_subscription", "azurerm_servicebus_subscription_rule", "azurerm_servicebus_topic", "azurerm_servicebus_topic_authorization_rule", "azurerm_powerbi_embedded", "azurerm_dashboard", "azurerm_signalr_service", "azurerm_eventgrid_domain", "azurerm_eventgrid_domain_topic", "azurerm_eventgrid_event_subscription", "azurerm_eventgrid_topic", "azurerm_relay_namespace", "azurerm_relay_hybrid_connection", "azurerm_app_service", "azurerm_app_service_plan", "azurerm_app_service_environment", "azurerm_application_insights", "aks_node_pool_linux", "aks_node_pool_windows", "azurerm_synapse_workspace", "azurerm_synapse_spark_pool", "azurerm_synapse_firewall_rule", "azurerm_private_endpoint", "azurerm_private_service_connection", "azurerm_firewall_ip_configuration", "azurerm_firewall_application_rule_collection", "azurerm_firewall_nat_rule_collection", "azurerm_firewall_network_rule_collection", "azurerm_dns_a_record", "azurerm_dns_aaaa_record", "azurerm_dns_caa_record", "azurerm_dns_cname_record", "azurerm_dns_mx_record", "azurerm_dns_ns_record", "azurerm_dns_ptr_record", "azurerm_dns_txt_record", "azurerm_private_dns_a_record", "azurerm_private_dns_aaaa_record", "azurerm_private_dns_cname_record", "azurerm_private_dns_mx_record", "azurerm_private_dns_ptr_record", "azurerm_private_dns_srv_record", "azurerm_private_dns_txt_record", "azurerm_virtual_machine_extension", "azurerm_virtual_machine_scale_set_extension", "azurerm_network_ddos_protection_plan", "azurerm_private_dns_zone_group", "azurerm_proximity_placement_group", "azurerm_private_link_service", "databricks_cluster", "databricks_standard_cluster", "databricks_high_concurrency_cluster", "general", "general_safe", "azurerm_mssql_managed_instance"]
  description = "A list of resources with default names"
}

variable "resources_with_short_names" {
  type = list(string)
  default = ["azurerm_key_vault"]
  description = "A list of resources that need short names"
}

variable "resources_with_alphanumeric_names" {
  type = list(string)
  default = ["azurerm_storage_account"]
  description = "A list of resources that need alphanumeric names"
}