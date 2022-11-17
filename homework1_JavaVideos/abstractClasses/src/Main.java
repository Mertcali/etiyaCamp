public class Main {
    public static void main(String[] args) {
        WomenGameCalculator gameCalculator = new WomenGameCalculator();
        gameCalculator.hesapla();
        gameCalculator.gameOver();

        GameCalculator[] gameCalculators = new GameCalculator[]{new KidsGameCalculator()
                ,new ManGameCalculator(), new WomenGameCalculator()};

        for(GameCalculator calculator : gameCalculators){
            calculator.hesapla();
        }
    }
}