import org.junit.*;
import static org.junit.Assert.*;

public class TestMain {

    //@Before
    //public void setUp() {
    //}

    @Test
    public void testMultiplication() {
        Dollar five = new Dollar(5);
        five.times(2);
        assertEquals(10, five.amount);
    }
}