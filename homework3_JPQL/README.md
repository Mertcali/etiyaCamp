# Postgre'de daha önce oluşturulan veritabanı Java'da modellendi Veri İletişim Katmanında JPA Kullanıldı.Bu ödevde ise JPQL,JPA Hazır fonksiyonları ve DTO gibi kavramların araştırılması istenildi. 04/12/2022

> Javada modellenmiş ve bazı endpointleri oluşturulmuş haline [buradan](https://github.com/Mertcali/etiyaSpring) ulaşabilirsiniz.

## JPQL Nedir?

- Açılımı Java Persistence Query Language.
- JPA kullanıcaz dedik, JPQL'de JPA Standartının entitylerimizi sorgulamak için oluşturduğu bir dil.
- SQL'e benzemekte.

## Nasıl kullanırız?

- Oluşturduğumuz repository'e gelip '@Query' notasyonuyla birlikte sorgumuzu, imzanın üzerine yazıyoruz. Biraz sorguları inceleyelim.

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

- JPQL Like Sorgusu:

> Müşteri Numarasının içerisinde ?1(1. parametre) olanları getir.

```
@Query("SELECT c FROM Customer c WHERE c.customerNumber LIKE %?1%")
    List<Customer> findAllCustomersLike(String customerNumber);
    ```
