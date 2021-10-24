package reqRes.products;

import com.intuit.karate.junit5.Karate;

class ProductsRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }

}
