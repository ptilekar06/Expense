package com.dao;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class UserService {

    private PasswordEncoder passwordEncoder;

    public UserService() {
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    public String hashPassword(String plainPassword) {
        return passwordEncoder.encode(plainPassword);
    }

    public boolean checkPassword(String plainPassword, String hashedPassword) {
        return passwordEncoder.matches(plainPassword, hashedPassword);
    }
}
