public class Main {
    public static void main(String[] args) {
        greetUser();
    }

    public static String greetUser() {
        return "Hello" + System.getenv("PROGRAM_USER");
    }
}
