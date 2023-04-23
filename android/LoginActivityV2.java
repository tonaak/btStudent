public class LoginActivity extends AppCompatActivity {
    private EditText userIdEditText;
    private EditText passwordEditText;
    private Button loginButton;
    private ProgressBar progressBar;

    private LoginUseCase loginUseCase;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // Find the views in your layout
        userIdEditText = findViewById(R.id.userIdEditText);
        passwordEditText = findViewById(R.id.passwordEditText);
        loginButton = findViewById(R.id.loginButton);
        progressBar = findViewById(R.id.progressBar);

        // Create a LoginUseCase instance
        LoginService loginService = retrofit.create(LoginService.class);
        UserRepository userRepository = new UserRepository(loginService);
        loginUseCase = new LoginUseCase(userRepository);

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
                loginUseCase.loginUser(userId, password, new Callback<User>() {
                    @Override
                    public void onSuccess(User result) {
                        // Hide the progress bar
                        progressBar.setVisibility(View.GONE);

                        Toast.makeText(LoginActivity.this, "Login successful", Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onFailure(Exception e) {
                        // Hide the progress bar
                        progressBar.setVisibility(View.GONE);

                        Toast.makeText(LoginActivity.this, "Login failed: " + e.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                });
            }
        });
    }
}
