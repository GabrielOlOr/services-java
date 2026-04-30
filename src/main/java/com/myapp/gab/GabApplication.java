package com.myapp.gab;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.myapp.gab") // <--- ESTO ES LA CLAVE
public class GabApplication {
    public static void main(String[] args) {
        SpringApplication.run(GabApplication.class, args);
    }
}