public class Main {
    public static void main(String[] args) {
        BaseKrediManager[] krediManagers = new BaseKrediManager[]{new OgretmenKrediManager(),
                new TarimKrediManager(), new OgrenciKrediManager()};

        for(BaseKrediManager manager : krediManagers){
            System.out.println(manager.hesapla(1000));
        }

    }
}