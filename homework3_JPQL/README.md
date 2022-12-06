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

[JPA METOTLARI](https://www.baeldung.com/spring-data-derived-queries)

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

---------------

### Gelelim DTO Nedir? Ne amaçla kullanılır?

Açılımı : Data Transfer Object. Bir nevi veri taşıma nesnesi? 

Nasıl taşıyacağım verimi, nereye taşıyacağım?

Düşünelim ki ben ürünlerimi listelemek istiyorum ama ürünlerimin hangi kategoride olduğunu da birlikte listelemek istiyorum. Biz içeride ilişkilendirmelerimizi yaptık evet ancak ürün geldiğinde kategori ismi vb. tek bir objeyle getirmek için DTO'ları kullanıyoruz. Böylece ileride isteklerimiz değiştiğinde tek obje üzerinden değişiklikler yapabiliyoruz.

Örnek kullanım olarak:

* Entities paketimize DTOS diye bir paket oluşturup içerisine ProductsWithCategoryDTO oluşturabiliriz.
* Daha sonra içerisinde neyi getirmek istediğimiz belirtebiliriz.(String productName, String categoryName, int id)
* ProductRepositorymize gidip buna ait bir get metodu yazabiliriz.(List<ProductWithCategoryDto> getProductWithCategoryDetails();
* Daha sonra yukarıda yaptığımız gibi buna bir joinli query yazabiliriz.
    
```
   @Query("Select new (packagename).ProductWithCategoryDto(p.id, p.productName, c.categoryName)" + "From Category c Inner Join c.products p")
```
    
* Daha sonra servis,manager,endpoint yazılarak çalıştırılabilir.

## Üzerinde çalışılan(yukarıda linklenen) örnek proje için DTO'lu ve DTO'suz query örnekleri ve çıktıları.

```
    @Query("select c from Category c inner join " +
            "c.productCategories pc inner join pc.product p where c.id = :categoryId")
    List<Category> denemeEndPoint(int categoryId);
```

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework3_JPQL/Sonuc1.PNG)

***Oluşturulan DTO class'ı içerisindeki alanlar sırasıyla query'e girilmeli.***

```
    @Query("select new com.etiya.ecommercedemo4.business.dtos.response.category.GetAllCategoriesWithProductResponse" +
            "(c.id, c.name, p.name) from Category c inner join " +
            "c.productCategories pc inner join pc.product p where c.id = :categoryId")
    List<GetAllCategoriesWithProductResponse> denemeEndPoint2(int categoryId);
```
    
![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework3_JPQL/Sonuc2.PNG)
