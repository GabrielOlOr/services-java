package com.myapp.gab.api.architecture.input;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class helloController {

    @GetMapping("/sorpresa")
    public String sorpresa() {
        // Cambiamos forward por redirect
        return "redirect:/sorpresa.html";
    }

}
