public class Main {
    public static void main(String[] args) {

        Product product = new Product();
        product.name = "asd";
        product.price = 122;
        product.id = 1;

        ProductManager productManager = new ProductManager();
        productManager.add(product);

        DatabaseHelper.Crud.update();
    }
}