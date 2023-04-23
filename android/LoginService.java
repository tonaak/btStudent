public interface LoginService {
    @POST("/login")
    Call<User> loginUser(@Body User user);
}

// In your LoginActivity:
public void loginUser(String userId, String password) {
    LoginService loginService = retrofit.create(LoginService.class);
    User user = new User(userId, password);
    Call<User> call = loginService.loginUser(user);
    call.enqueue(new Callback<User>() {
        @Override
        public void onResponse(Call<User> call, Response<User> response) {
            if (response.isSuccessful()) {
                Toast.makeText(LoginActivity.this, "Login successful", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(LoginActivity.this, "Login failed", Toast.LENGTH_SHORT).show();
            }
        }

        @Override
        public void onFailure(Call<User> call, Throwable t) {
            Toast.makeText(LoginActivity.this, "Error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    });
}
