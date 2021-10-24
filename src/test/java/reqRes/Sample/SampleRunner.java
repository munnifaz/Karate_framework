package reqRes.Sample;

import com.intuit.karate.junit5.Karate;

class SampleRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }

}
