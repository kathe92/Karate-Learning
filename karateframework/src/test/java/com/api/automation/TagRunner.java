package com.api.automation;
 
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;
 
public class TagRunner {
    @Test
    public void testSample() {
        Builder aRunner = new Builder();
        aRunner.path("classpath:com/api/automation");
        aRunner.tags("@Smoke", "@Regression");
        aRunner.parallel(4);
    }
}