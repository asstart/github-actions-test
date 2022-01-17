package dev.asstart.githubactionstest;
public class UserFinder {

    public String getUser(){
        return System.getenv("PROGRAM_USER");
    }
}
