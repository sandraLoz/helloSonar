package es.opplus.helloSonar.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "DemoUser API")
@RestController
public class HelloSonarController {

	@GetMapping(path = "/")
	@Operation(summary = "Hello", tags = "Saludo params")
	public String greeting(@RequestParam(value = "name", defaultValue = "world") String name) {
		return String.format("hello %s", name);
	}
	
}
