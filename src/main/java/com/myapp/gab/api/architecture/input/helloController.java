package com.myapp.gab.api.architecture.input;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/myApp")
public class helloController {

    @GetMapping("/greeting")
    public String index() {
        return "¡Hola Mundo desde Java 21, Docker y K8s en GCP!";
    }

}
