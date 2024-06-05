package org.ict.loging_ex.user.model.input;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputUser {
    private String email, password;

    public InputUser(String username) {
        this.email = username;
    }
}
