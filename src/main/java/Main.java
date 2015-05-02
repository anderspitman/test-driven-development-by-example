interface Expression {
    public Money reduce(String to);
}

class Sum implements Expression {
    Money augend;
    Money addend;

    Sum(Money augend, Money addend) {
        this.augend = augend;
        this.addend = addend;
    }

    public Money reduce(String to) {
        int amount = augend.amount + addend.amount;
        return new Money(amount, to);
    }
}

class Bank {
    Money reduce(Expression source, String to) {
        return source.reduce(to);
    }
}

public class Main {
    public static void main(String[] argv) {
    }
}
