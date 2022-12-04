# Postgre'de daha önce oluşturulan veritabanı Java'da modellendi Veri İletişim Katmanında JPA Kullanıldı.Bu ödevde ise JPQL,JPA Hazır fonksiyonları ve DTO gibi kavramların araştırılması istenildi. 04/12/2022

## Örnek database klasörün içerisinde paylaşılmıştır ve örnekler o database üzerinden yapılmıştır. Aynı database üzerinden yapılan diğer örnekler için [link1](https://github.com/Mertcali/etiyaAkademi/tree/master/workshop3_10_Sql_Examples) ve [link2](https://github.com/Mertcali/etiyaAkademi/tree/master/workshop4_10_Sql_Examples_2) linklerine bakabilirsiniz.

> Sorgulardaki joinleri daha iyi anlamak için örnek bir png:

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sql_joins.PNG)

### Soru 1 : Hangi ürünler hangi tedarikçiler tarafından üretiliyor?

### Sorgu : 

```
select p.name,ps.supplier_id,s.supplier_number from products p 
inner join product_suppliers ps on p.id = ps.product_id 
inner join suppliers s on s.id = ps.supplier_id
group by p.name,ps.supplier_id,s.supplier_number
```

### Çıktı : 

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu1.PNG)

------------------------------------------

### Soru 2 : Bir ürünün birden fazla tedarikçisi varsa getir ve kaç tedarikçisi olduğunu göster.

### Sorgu : 

```
select p.name, count(ps.supplier_id) as "URETICI SAYISI" from products p 
inner join product_suppliers ps on p.id = ps.product_id group by p.name
having count(ps.supplier_id) > 1
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu2.PNG)

------------------

### Soru 3 : Tedarikçisi olmayan(bir nevi artık üretilmeyen) ürünleri getir.

### Sorgu :

```
select * from products p 
left join product_suppliers ps
on p.id = ps.product_id where ps.supplier_id is null
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu3.PNG)

### Soru 4 : Adresi veya telefon numarası olmayan kullanıcıları getir.

### Sorgu :

```
select * from addresses ad full outer join users us
on ad.user_id = us.id where street_id is null or phone_number is null
```


### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu4.PNG)

------------------

### Soru 5 : Fiyatı 200 - 500  arasında olan ürünleri listele.

### Sorgu :

```
select * from products where cast(unit_price as numeric) between 100 and 400
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu5.PNG)

-----------------------

### Soru 6 : İsmi Mert olan kullanıcıları listele.

### Sorgu :

```
select * from users where lower(name) in('mert')
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu6.PNG)


-----------------------------

### Soru 7 : Bir ülke ekle.

### Sorgu :

```
insert into countries (name) values ('Belçika')
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu7.PNG)

----------------------

### Soru 8 : Belçika adlı ülkeyi güncelle.

### Sorgu :

```
update countries set name ='Belçika Güncelleme' where name = 'Belçika'
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu8.PNG)

------------------------

### Soru 9 : Belçika adlı ülkeyi sil.

### Sorgu :

```
delete from countries where name = 'Belçika Güncelleme'
```

### Çıktı :

![alt text](https://github.com/Mertcali/etiyaCamp/blob/master/homework2_sql/pngs/sorgu9.PNG)



