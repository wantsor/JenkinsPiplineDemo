package com.wantsor.jenkins.pipeline.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping(path = "/hello")
    public String helloWorld() {
        System.out.println("-------------------------------------");
        return "Hello World";
    }

    @RequestMapping(path = "/helloNew")
    public String helloWorldNew() {
        System.out.println("-------------------------------------");
        return "Hello World new version";
    }

}
