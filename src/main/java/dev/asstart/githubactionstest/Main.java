package dev.asstart.githubactionstest;

public class Main {
    public static void main(String[] args) {
        System.out.println(greetUser(new UserFinder()));
    }

    public static String greetUser(UserFinder uf) {
        return "Hello " + uf.getUser();
    }
}
