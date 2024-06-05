package org.ict.loging_ex.user.controller;

import lombok.extern.slf4j.Slf4j;
import org.ict.loging_ex.user.model.entity.User;
import org.ict.loging_ex.user.model.input.InputUser;
import org.ict.loging_ex.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
@Slf4j
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/user")
    public ResponseEntity<?> signUpUser(@RequestBody InputUser user) {
        User newUser = userService.signUpUser(user);
        return ResponseEntity.ok(newUser);
    }
    }

