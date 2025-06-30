package com.spring.cloud_bus_config_server_kafka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.wavefront.WavefrontProperties;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableDiscoveryClient
@EnableConfigServer
@SpringBootApplication
public class CloudBusConfigServerKafkaApplication {

	public static void main(String[] args) {
		SpringApplication.run(CloudBusConfigServerKafkaApplication.class, args);
	}
	

}
