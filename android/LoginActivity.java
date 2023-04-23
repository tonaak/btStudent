public class LoginActivity extends AppCompatActivity {
    private EditText userIdEditText;
    private EditText passwordEditText;
    private Button loginButton;
    private ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // Find the views in your layout
        userIdEditText = findViewById(R.id.userIdEditText);
        passwordEditText = findViewById(R.id.passwordEditText);
        loginButton = findViewById(R.id.loginButton);
        progressBar = findViewById(R.id.progressBar);

        // Set a click listener for the login button
        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Get the user credentials from the EditText views
                String userId = userIdEditText.getText().toString();
                String password = passwordEditText.getText().toString();

                // Show the progress bar
                progressBar.setVisibility(View.VISIBLE);

                // Call the loginUser method to perform the login request
                loginUser(userId, password);
            }
        });
    }

    private void loginUser(String userId, String password) {
        // Create a LoginService Retrofit client to send the user credentials to the LoginServlet
        MyApplication myApplication = (MyApplication) getApplication();
        Retrofit retrofit = myApplication.getRetrofit();
        LoginService loginService = retrofit.create(LoginService.class);

        User user = new User(userId, password);
        Call<User> call = loginService.loginUser(user);
        call.enqueue(new Callback<User>() {
            @Override
            public void onResponse(Call<User> call, Response<User> response) {
                // Hide the progress bar
                progressBar.setVisibility(View.GONE);

                // Check if the login was successful
                if (response.isSuccessful()) {
                    Toast.makeText(LoginActivity.this, "Login successful", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(LoginActivity.this, "Login failed", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<User> call, Throwable t) {
                // Hide the progress bar
                progressBar.setVisibility(View.GONE);

                // Show an error message
                Toast.makeText(LoginActivity.this, "Error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }
}
