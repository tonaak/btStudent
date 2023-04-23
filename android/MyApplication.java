public class MyApplication extends Application {
    private static final String BASE_URL = "http://example.com/";

    private Retrofit retrofit;

    @Override
    public void onCreate() {
        super.onCreate();

        // Create a Retrofit object with the base URL of your API
        retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    public Retrofit getRetrofit() {
        return retrofit;
    }
}
