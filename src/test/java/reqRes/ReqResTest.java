package reqRes;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ReqResTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:reqRes")
                //.tags("utils")
                //.outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
