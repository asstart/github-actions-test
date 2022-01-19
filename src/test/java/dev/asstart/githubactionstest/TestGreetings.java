package dev.asstart.githubactionstest;

import org.junit.Assert;
import org.junit.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.when;

public class TestGreetings {

    @Test
    public void testUserGreeting(){
        var uf = Mockito.mock(UserFinder.class);
        when(uf.getUser()).thenReturn("SUPERUSER");
        Assert.assertEquals("Hello SUPERUSER", Main.greetUser(uf));
    }
}
