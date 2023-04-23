public class UserRepository {
    private LoginService loginService;

    public UserRepository(LoginService loginService) {
        this.loginService = loginService;
    }

    public void loginUser(String userId, String password, final Callback<User> callback) {
        User user = new User(userId, password);
        Call<User> call = loginService.loginUser(user);
        call.enqueue(new Callback<User>() {
            @Override
            public void onResponse(Call<User> call, Response<User> response) {
                if (response.isSuccessful()) {
                    callback.onSuccess(response.body());
                } else {
                    callback.onFailure(new Exception("Login failed"));
                }
            }

            @Override
            public void onFailure(Call<User> call, Throwable t) {
                callback.onFailure(new Exception(t));
            }
        });
    }
}
