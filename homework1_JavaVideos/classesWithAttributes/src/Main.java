public class Main {
    public static void main(String[] args) {

        Product product = new Product(1,"Laptop", "Asus Laptop", 5000, 3, " " );
        /* product.name = "Laptop";
        product.id = 1;
        product.description = "Asus Laptop";
        product.price = 5000;
        product.stockAmount = 3;
        product.renk = "";
        System.out.println(product.name); */

        /* product.setName("Laptop");
        product.setId(1);
        product.setPrice(5000);
        product.setStockAmount(3);
        product.setRenk("");*/

        System.out.println(product.getKod());


        ProductManager productManager = new ProductManager();
        productManager.add(product);
    }
}