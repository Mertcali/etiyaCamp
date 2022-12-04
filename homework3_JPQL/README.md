# Postgre'de daha önce oluşturulan veritabanı Java'da modellendi Veri İletişim Katmanında JPA Kullanıldı.Bu ödevde ise JPQL,JPA Hazır fonksiyonları ve DTO gibi kavramların araştırılması istenildi. 04/12/2022

> Javada modellenmiş ve bazı endpointleri oluşturulmuş haline [buradan](https://github.com/Mertcali/etiyaSpring) ulaşabilirsiniz.

## JPQL Nedir?

- Açılımı Java Persistence Query Language.
- JPA kullanıcaz dedik, JPQL'de JPA Standartının entitylerimizi sorgulamak için oluşturduğu bir dil.
- SQL'e benzemekte.

## Nasıl kullanırız?

### Oluşturduğumuz repository'e gelip '@Query' notasyonuyla birlikte sorgumuzu, imzanın üzerine yazıyoruz. Biraz sorguları inceleyelim.

- JPQL Order By Sorgusu:

> Ülke isimlerini alfabetik olarak tersten sırala.

```
@Query("Select c from Country as c ORDER BY c.name DESC")
    List<Country> findAllCountriesOrderByName();
```
    
- JPQL Between Sorgusu:

> Doğum tarihleri ?1(1. parametre) ?2(2.parametre) arasında olanları getir.

```
@Query("SELECT c FROM Customer c WHERE c.birthDate BETWEEN ?1 AND ?2")
    List<Customer> findAllCustomersWithBirthDate(Date start, Date end);
```

- Başka Bir Şekilde Between Yazılışı:

```
@Query("SELECT p FROM Product p WHERE p.unitPrice BETWEEN :start and :end")
    List<Product> findAllProductsUnitPriceBetween(double start, double end);
```

- JPQL Like Sorgusu:

> Müşteri Numarasının içerisinde ?1(1. parametre) olanları getir.

```
@Query("SELECT c FROM Customer c WHERE c.customerNumber LIKE %?1%")
List<Customer> findAllCustomersLike(String customerNumber);
```

- JPQL Join Sorgusu:

> Aslında burada native sqlde join on karşılığı olarak fkyı a.addressType şeklinde belirtiyoruz 

```
@Query("Select a from Address a JOIN a.addressType at")
List<Address> findByAddressType();
```
---------------------

## Gelelim JPA'in bizim işlerimizi çokça kolaylaştırdığı hazır metotlarına.

Jpa bize hazır metotlar sunarak çoğu zaman query yazmaktan bizi kurtarabiliyor. En basit olarak native sql'de yazdığım select * from products şeklinde bir select all sorgusunu javada endpointe getAll şeklinde bir endpoint'e götürmek istiyorsunuz. JPA Bunu sizin için findAll metoduyla yapıyor. Nasıl kullanılıyor peki?
Repositoryimiz içerisinde findAll vb. gibi bir imza tanımlamamıza gerek yok. Linkte kullanılan veritabanındaki product nesnesi üzerinden ilerleyelim. 

* Product modellemem oluşturuldu.
* ProductRepository oluşturuldu ve JpaRepository extend edildi. (Burada jparepository'e ctrl+sol tık yaparak içerisindeki metotları da görebilirsiniz)
* Servis tarafında dependency injection ile ProductRepository'im çağırıldı.

```
private IProductRepository productRepository;

    @Autowired
    public ProductManager(IProductRepository IProductRepository) {
        this.productRepository = IProductRepository;
    }
```

* Servis tarafında getAll metodunu yazarken;

```
@Override
    public List<Product> getAll() {
        return productRepository.findAll();
    }
```

Görüldüğü üzere .findAll metodu kendiliğinden gelmekte. Benim bir imza veya metot oluşturmama gerek yok. Kendisi JpaRepository içerisinde bulunmakta. Tabii içerisinde bulunan bütün metotlardan bahsetmeyeceğim ancak productRepository. yazdıktan sonra orada gelen metotları inceleyerek bakabilirsiniz. ***Exist,FindById,save,delete*** gibi metotlar hazır şekilde bulunmakta.



