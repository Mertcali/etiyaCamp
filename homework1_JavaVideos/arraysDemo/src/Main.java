public class Main {
    public static void main(String[] args) {
        String ogrenci1 = "Ali";
        String ogrenci2 = "Mehmet";
        String ogrenci3 = "Ayşe";
        String ogrenci4 = "Fatma";

        System.out.println(ogrenci1);
        System.out.println(ogrenci2);
        System.out.println(ogrenci3);
        System.out.println(ogrenci4);

        System.out.println("*********************************");

        String[] ogrenciler = new String[4];
        ogrenciler[0]="Ali1";
        ogrenciler[1]="Mehmet1";
        ogrenciler[2]="Ayse1";
        ogrenciler[3]="Ahmet";

        for(int i =0; i<ogrenciler.length;i++){
            System.out.println(ogrenciler[i]);
        }

        System.out.println("*********************************");

        for(String ogrenci : ogrenciler){
            System.out.println(ogrenci);
        }


    }
}