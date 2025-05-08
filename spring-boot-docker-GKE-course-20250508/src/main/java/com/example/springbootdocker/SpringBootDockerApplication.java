package com.example.springbootdocker;
 
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.logging.Logger;
 
@RestController
@SpringBootApplication
public class SpringBootDockerApplication {
        private static final Logger logger = Logger.getLogger(SpringBootDockerApplication.class.getName());

        public static void main(String[] args) {
                logger.info("Starting Spring Boot application");
                SpringApplication.run(SpringBootDockerApplication.class, args);
        }

 
        @RequestMapping("/")
        public String home() {
                logger.info("Hello log!");
                return "Hello World!GKE";
        }
    

 
}